// Tests for nodes/lexity-video-job/1.0.0/main.ts (STU-281).
//
// One test per acceptance criterion, plus the key-invariance property that keeps
// a re-render from republishing the same word.
//
// Run with:
//   node --experimental-strip-types --test tests/lexity-video-job.test.mjs

import { test } from "node:test";
import assert from "node:assert/strict";

import { nodePath } from "./paths.mjs";

const {
  jobKey,
  publicationKey,
  createJob,
  createOrDedupe,
  claim,
  heartbeat,
  acceptResult,
  startRerender,
  shouldPublish,
  isLeaseExpired,
  jobControlRules,
  DEFAULT_LEASE_MS,
} = await import(nodePath("lexity-video-job"));
const { normaliseTerm: manifestNormaliseTerm } = await import(nodePath("lexity-video-manifest"));

const T0 = "2026-09-14T06:00:00.000Z";
const later = (ms) => new Date(new Date(T0).getTime() + ms).toISOString();

const manifest = {
  edition: { sydneyDate: "2026-09-14", docPath: "lexicon/abc123", docId: "abc123" },
  text: { term: "Acomiast" },
  template: { version: "1.0.0" },
};
const EK = "2026-09-14::acomiast::1.0.0";

test("CRITERION: concurrent duplicate cron delivery creates one logical job", () => {
  const first = createOrDedupe(null, manifest, EK, T0);
  assert.equal(first.created, true);

  // The second delivery arrives concurrently and sees the first job.
  const second = createOrDedupe(first.job, manifest, EK, T0);
  assert.equal(second.created, false, "must not create a second job");
  assert.equal(second.job.key, first.job.key);
  assert.equal(jobKey(EK), first.job.key, "the key is deterministic, so duplicates collide");
});

test("CRITERION: an expired worker lease recovers", () => {
  let job = createJob(manifest, EK, T0);

  const first = claim(job, { workerId: "w1", now: T0, leaseMs: 60_000 });
  assert.equal(first.ok, true);
  assert.equal(first.reason, "claimed");
  job = first.job;

  // Before expiry nobody else may take it.
  const blocked = claim(job, { workerId: "w2", now: later(30_000), leaseMs: 60_000 });
  assert.equal(blocked.ok, false);
  assert.equal(blocked.reason, "lease_held");

  // After expiry — w1 died — the work is recoverable.
  const recovered = claim(job, { workerId: "w2", now: later(60_001), leaseMs: 60_000 });
  assert.equal(recovered.ok, true);
  assert.equal(recovered.reason, "reclaimed_after_expiry");
  assert.equal(recovered.job.attempt, 2, "recovery is a new attempt");
  assert.equal(recovered.job.attempts, 2);
});

test("CRITERION: a late/stale worker result cannot overwrite the current attempt", () => {
  let job = createJob(manifest, EK, T0);

  const a = claim(job, { workerId: "w1", now: T0, leaseMs: 60_000 });
  job = a.job;
  const staleToken = job.lease.token;

  // w1 stalls; its lease expires; w2 starts a newer attempt.
  const b = claim(job, { workerId: "w2", now: later(60_001), leaseMs: 60_000 });
  job = b.job;

  // NOW w1 finally finishes and submits its result.
  const late = acceptResult(job, { token: staleToken, now: later(70_000) });
  assert.equal(late.ok, false);
  assert.equal(late.reason, "stale_attempt", "the fence must reject it");
  assert.equal(late.job.status, "rendering", "and the newer attempt is untouched");

  // The current attempt's own result is accepted.
  const fresh = acceptResult(job, { token: job.lease.token, now: later(80_000) });
  assert.equal(fresh.ok, true);
  assert.equal(fresh.job.status, "rendered");
  assert.equal(fresh.job.lease, null);
});

test("CRITERION: intentional rerender has explicit version history", () => {
  let job = createJob(manifest, EK, T0);
  job = claim(job, { workerId: "w1", now: T0 }).job;
  job = acceptResult(job, { token: job.lease.token, now: later(1000) }).job;
  assert.equal(job.status, "rendered");
  assert.equal(job.versionHistory.length, 0);

  const re = startRerender(job, { templateVersion: "1.1.0", now: later(2000), reason: "typography fix" });
  assert.equal(re.ok, true);
  assert.equal(re.job.status, "queued");
  assert.equal(re.job.versionHistory.length, 1);
  assert.deepEqual(re.job.versionHistory[0], {
    attempt: 2,
    templateVersion: "1.1.0",
    at: later(2000),
    reason: "typography fix",
  });
  assert.equal(re.job.attempt, 1, "the render attempt resets for a new template");

  // A rerender must not silently discard the previous version's record.
  const again = startRerender(re.job, { templateVersion: "1.2.0", now: later(3000) });
  assert.equal(again.job.versionHistory.length, 2, "history accumulates");
  assert.equal(again.job.versionHistory[1].templateVersion, "1.2.0");
  assert.equal(again.job.versionHistory[1].reason, "manual_rerender", "defaults are recorded, not blank");
});

test("CRITERION: client writes to job control state are denied", () => {
  const rules = jobControlRules();
  assert.match(rules, /allow write: if false;/, "control state must be server-write-only");
  assert.match(rules, /match \/video_jobs\/\{jobId\}/);
});

test("CRITERION: source app records remain compatible", () => {
  const job = createJob(manifest, EK, T0);

  // The job is a separate document; it carries no lexicon field names and the
  // manifest is never mutated.
  const lexiconFields = ["term", "definition", "etymology", "imageUrl", "colours", "blurhash"];
  for (const f of lexiconFields) {
    assert.ok(!(f in job), `job must not shadow lexicon field '${f}'`);
  }
  assert.deepEqual(manifest.text, { term: "Acomiast" }, "the manifest is untouched");

  // And no job key points at the app's collection.
  assert.ok(!job.key.includes("lexicon/"), "job keys must not address the lexicon collection");
});

test("publication key is independent of template version (rerender must not republish)", () => {
  const a = publicationKey({ sydneyDate: "2026-09-14", term: "Acomiast" });
  const b = publicationKey({ sydneyDate: "2026-09-14", term: "acomiast" });
  assert.equal(a, b, "case does not create a new publication identity");
  assert.equal(a, "pub::2026-09-14::acomiast");
  assert.ok(!a.includes("1.0.0"), "the template version must NOT be part of publication identity");

  // Meanwhile the job key DOES include the template version, so a new template is
  // a new job — but still the same publication.
  assert.notEqual(jobKey("e::1.0.0"), jobKey("e::1.1.0"));
});

test("shouldPublish publishes once, then never again", () => {
  let job = createJob(manifest, EK, T0);
  assert.equal(shouldPublish(job).reason, "not_rendered");

  job = claim(job, { workerId: "w1", now: T0 }).job;
  job = acceptResult(job, { token: job.lease.token, now: later(1000) }).job;

  assert.equal(shouldPublish(job).ok, true, "a rendered, unpublished job may publish");

  const published = { ...job, publishedAt: later(2000) };
  assert.equal(shouldPublish(published).ok, false);
  assert.equal(shouldPublish(published).reason, "already_published");

  // Even after a rerender, the same word must not be republished.
  const rerendered = startRerender(published, { templateVersion: "1.1.0", now: later(3000) }).job;
  assert.equal(rerendered.publishedAt, later(2000), "publishedAt survives a rerender");
});

test("claim refuses jobs whose assets are not ready, and finished jobs", () => {
  const waiting = { ...createJob(manifest, EK, T0), status: "waiting_assets" };
  assert.equal(claim(waiting, { workerId: "w1", now: T0 }).reason, "assets_not_ready");

  const done = { ...createJob(manifest, EK, T0), status: "rendered" };
  assert.equal(claim(done, { workerId: "w1", now: T0 }).reason, "already_rendered");

  assert.equal(claim(createJob(manifest, EK, T0), { workerId: "", now: T0 }).reason, "worker_id_required");
});

test("heartbeat extends only the current attempt's live lease", () => {
  let job = claim(createJob(manifest, EK, T0), { workerId: "w1", now: T0, leaseMs: 60_000 }).job;
  const token = job.lease.token;

  const ok = heartbeat(job, { workerId: "w1", token, now: later(30_000), leaseMs: 60_000 });
  assert.equal(ok.ok, true);
  assert.equal(ok.job.lease.expiresAt, later(90_000), "the expiry moves with the heartbeat");

  assert.equal(heartbeat(job, { workerId: "w1", token: "wrong", now: later(30_000) }).reason, "stale_token");
  assert.equal(heartbeat(job, { workerId: "w2", token, now: later(30_000) }).reason, "wrong_worker");
  assert.equal(heartbeat(job, { workerId: "w1", token, now: later(60_001) }).reason, "lease_expired");
});

test("retries are bounded — an unrecognised error needs a human, not a loop", () => {
  let job = claim(createJob(manifest, EK, T0), { workerId: "w1", now: T0 }).job;

  // A retryable category requeues with a next retry time.
  const retryable = acceptResult(job, { token: job.lease.token, now: later(1000), status: "failed", errorCategory: "unreadable_asset" });
  assert.equal(retryable.job.status, "queued");
  assert.ok(retryable.job.nextRetryAt, "a retry time is set");
  assert.equal(retryable.job.lastError.category, "unreadable_asset");

  // An unrecognised error goes straight to a human.
  const unknown = acceptResult(job, { token: job.lease.token, now: later(1000), status: "failed", errorCategory: "compositor_crash" });
  assert.equal(unknown.job.status, "needs_attention");
  assert.equal(unknown.job.nextRetryAt, null);

  // And retryable errors stop retrying after 3 attempts.
  const exhausted = acceptResult({ ...job, attempts: 3 }, { token: job.lease.token, now: later(1000), status: "failed", errorCategory: "timeout" });
  assert.equal(exhausted.job.status, "needs_attention");
});

test("isLeaseExpired treats a missing lease as expired", () => {
  assert.equal(isLeaseExpired({ lease: null }, T0), true);
  assert.equal(isLeaseExpired({ lease: { expiresAt: later(1) } }, T0), false);
  assert.equal(isLeaseExpired({ lease: { expiresAt: T0 } }, T0), true, "expiry is inclusive");
  assert.ok(DEFAULT_LEASE_MS > 0);
});

test("the duplicated normaliseTerm has not diverged from the manifest node's", () => {
  // The job node inlines this helper because BuildShip bundles nodes
  // independently, so nothing but this test keeps the two copies honest.
  const samples = ["Acomiast", "Flâneur", "  Flâneur! ", "Café", "日本語", "", "Æther", "A-B_C"];
  for (const s of samples) {
    assert.equal(
      publicationKey({ sydneyDate: "2026-09-14", term: s }),
      `pub::2026-09-14::${manifestNormaliseTerm(s)}`,
      `normalisation diverged for ${JSON.stringify(s)}`,
    );
  }
});
