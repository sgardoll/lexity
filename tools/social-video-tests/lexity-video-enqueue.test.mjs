// Tests for nodes/lexity-video-enqueue/1.0.0/main.ts (STU-282).
//
// The headline case is DST. The 06:00 Australia/Sydney run happens at 19:00–20:00
// UTC on the PREVIOUS day, so the UTC calendar date is the wrong publication date.
// The existing cron prompt derives "today" from toISOString() — these tests pin the
// difference so the bug cannot reappear unnoticed.
//
// Run with:
//   node --experimental-strip-types --test tests/lexity-video-enqueue.test.mjs

import { test } from "node:test";
import assert from "node:assert/strict";

import { nodePath } from "./paths.mjs";

const {
  sydneyDateFor,
  sydneyOffsetMinutes,
  checkAssetReady,
  editionKey,
  planEnqueue,
  findOrphans,
} = await import(nodePath("lexity-video-enqueue"));

const ready = (over = {}) => ({
  term: "Acomiast",
  definition: "A person who does not take the time to rest or relax.",
  imageUrl: "https://storage.googleapis.com/b/lexity/1.png",
  termSpoken: "https://storage.googleapis.com/b/lexity/Acomiast-term.mp3",
  usageSpoken: "https://storage.googleapis.com/b/lexity/Acomiast-usage.mp3",
  creationDate: "2026-09-14T06:00:00.000Z",
  ...over,
});

// --- the publication date -----------------------------------------------------

test("REGRESSION: the 06:00 Sydney run must not take its date from UTC", () => {
  // 2026-09-14 is AEST (UTC+10), so 06:00 local == 2026-09-13T20:00Z.
  const runInstant = "2026-09-13T20:00:00.000Z";
  assert.equal(sydneyDateFor(runInstant), "2026-09-14");

  // The bug this guards against: the naive UTC slice reports the previous day,
  // which is what the existing cron prompt does today.
  assert.equal(new Date(runInstant).toISOString().slice(0, 10), "2026-09-13");
});

test("the Sydney date flips at 14:00Z, not at midnight UTC", () => {
  assert.equal(sydneyDateFor("2026-09-13T13:59:59Z"), "2026-09-13");
  assert.equal(sydneyDateFor("2026-09-13T14:00:00Z"), "2026-09-14");
});

// --- DST ----------------------------------------------------------------------

test("DST: the offset is +10 in winter and +11 in summer", () => {
  assert.equal(sydneyOffsetMinutes("2026-06-15T00:00:00Z"), 600, "AEST");
  assert.equal(sydneyOffsetMinutes("2026-12-15T00:00:00Z"), 660, "AEDT");
});

test("DST: 06:00 Sydney moves by an hour in UTC but stays the same local date", () => {
  // AEST (UTC+10): 06:00 local == 20:00Z previous day
  assert.equal(sydneyDateFor("2026-09-13T20:00:00Z"), "2026-09-14");
  // AEDT (UTC+11): 06:00 local == 19:00Z previous day
  assert.equal(sydneyDateFor("2026-10-04T19:00:00Z"), "2026-10-05");

  // Both are "06:00 in Sydney" yet an hour apart in UTC — which is exactly why
  // deriving the date from the UTC instant is wrong on one side of the change.
  assert.equal(sydneyOffsetMinutes("2026-09-13T20:00:00Z"), 600);
  assert.equal(sydneyOffsetMinutes("2026-10-04T19:00:00Z"), 660);
});

test("DST: the days on either side of the transitions resolve correctly", () => {
  // DST ends Sun 5 Apr 2026 (03:00 AEDT -> 02:00 AEST).
  assert.equal(sydneyOffsetMinutes("2026-04-04T12:00:00Z"), 660, "day before: still AEDT");
  assert.equal(sydneyOffsetMinutes("2026-04-05T12:00:00Z"), 600, "day of: back to AEST");
  assert.equal(sydneyDateFor("2026-04-04T19:00:00Z"), "2026-04-05", "06:00 local on the changeover day");

  // DST starts Sun 4 Oct 2026 (02:00 AEST -> 03:00 AEDT).
  assert.equal(sydneyOffsetMinutes("2026-10-03T12:00:00Z"), 600, "day before: still AEST");
  assert.equal(sydneyOffsetMinutes("2026-10-05T12:00:00Z"), 660, "after: AEDT");
  assert.equal(sydneyDateFor("2026-10-03T20:00:00Z"), "2026-10-04", "06:00 local on the changeover day");
});

test("DST: a whole year of 06:00 Sydney runs yields 365 distinct increasing dates", () => {
  // Guards against an off-by-one-day that only appears in one half of the year.
  const dates = [];
  const start = Date.parse("2026-01-01T19:00:00Z"); // 05:00 or 06:00 Sydney, zone-dependent
  for (let i = 0; i < 365; i++) {
    dates.push(sydneyDateFor(new Date(start + i * 86_400_000).toISOString()));
  }
  assert.equal(new Set(dates).size, 365, "every day must map to a distinct Sydney date");
  const sorted = [...dates].sort();
  assert.deepEqual(dates, sorted, "dates must be monotonic");
  assert.ok(dates.includes("2026-04-05"), "the DST-end day is present");
  assert.ok(dates.includes("2026-10-04"), "the DST-start day is present");
});

test("an invalid instant is rejected rather than silently producing a date", () => {
  assert.throws(() => sydneyDateFor("not-a-date"), /invalid instant/);
});

// --- readiness ----------------------------------------------------------------

test("readiness requires every asset, including the final creationDate", () => {
  assert.deepEqual(checkAssetReady(ready()), { ready: true, missing: [] });

  // creationDate is the last thing written, so it is the "everything landed" signal.
  assert.deepEqual(checkAssetReady(ready({ creationDate: "" })), {
    ready: false,
    missing: ["creationDate"],
  });

  const nothing = checkAssetReady(null);
  assert.equal(nothing.ready, false);
  assert.deepEqual(nothing.missing, [
    "term",
    "definition",
    "imageUrl",
    "termSpoken",
    "usageSpoken",
    "creationDate",
  ]);
});

// --- enqueue planning ---------------------------------------------------------

test("CRITERION: enqueue happens once, only when every asset is ready", () => {
  const d = planEnqueue({ record: ready(), instant: "2026-09-13T20:00:00Z", docPath: "lexicon/abc" });
  assert.equal(d.action, "enqueue");
  assert.equal(d.reason, "ready");
  assert.equal(d.sydneyDate, "2026-09-14");
  assert.equal(d.editionKey, "2026-09-14::acomiast::1.0.0");
});

test("CRITERION: a duplicate delivery does not enqueue a second job", () => {
  const args = { record: ready(), instant: "2026-09-13T20:00:00Z", docPath: "lexicon/abc" };
  assert.equal(planEnqueue(args).action, "enqueue");
  // Second call sees the job that the first created.
  const again = planEnqueue({ ...args, existingJob: { key: "job::2026-09-14::acomiast::1.0.0" } });
  assert.equal(again.action, "skip");
  assert.equal(again.reason, "already_enqueued");
});

test("CRITERION: missing assets fail visibly, naming what is missing", () => {
  const d = planEnqueue({
    record: ready({ imageUrl: "", usageSpoken: "" }),
    instant: "2026-09-13T20:00:00Z",
    docPath: "lexicon/abc",
  });
  assert.equal(d.action, "skip");
  assert.equal(d.reason, "assets_not_ready");
  assert.deepEqual(d.missing, ["imageUrl", "usageSpoken"]);
});

test("a run without a document path is rejected outright", () => {
  assert.throws(
    () => planEnqueue({ record: ready(), instant: "2026-09-13T20:00:00Z", docPath: "" }),
    /docPath is required/,
  );
});

test("editionKey folds the word, so case does not create a second job", () => {
  assert.equal(editionKey("2026-09-14", "Acomiast", "1.0.0"), editionKey("2026-09-14", "acomiast", "1.0.0"));
  assert.notEqual(editionKey("2026-09-14", "Acomiast", "1.0.0"), editionKey("2026-09-14", "Acomiast", "1.1.0"));
});

// --- reconciliation -----------------------------------------------------------

test("CRITERION: reconciliation finds a ready edition that was never enqueued", () => {
  const instant = "2026-09-13T20:00:00Z";
  const key = "2026-09-14::acomiast::1.0.0";

  // The crash case: the document finished, but the enqueue never ran.
  const orphans = findOrphans({
    editions: [
      { docPath: "lexicon/abc", record: ready() },
      { docPath: "lexicon/def", record: ready({ term: "Zephyr" }) },
    ],
    jobsByEditionKey: { "2026-09-14::zephyr::1.0.0": { key: "present" } },
    instant,
  });

  assert.deepEqual(orphans, [
    { docPath: "lexicon/abc", editionKey: key, sydneyDate: "2026-09-14" },
  ]);
});

test("reconciliation ignores editions that are not asset-ready", () => {
  const orphans = findOrphans({
    editions: [{ docPath: "lexicon/abc", record: ready({ termSpoken: "" }) }],
    jobsByEditionKey: {},
    instant: "2026-09-13T20:00:00Z",
  });
  assert.deepEqual(orphans, [], "an unfinished edition must not be enqueued by the reconciler");
});
