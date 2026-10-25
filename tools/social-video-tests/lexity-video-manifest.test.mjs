// Tests for nodes/lexity-video-manifest/1.0.0/main.ts (STU-280).
//
// These prove the manifest's acceptance criteria at the unit level:
//   * accepts a representative existing record
//   * rejects missing / wrong-word / unreadable assets
//   * all three media files must be present before a manifest exists
//   * the snapshot is frozen, so a later edit to the source record cannot
//     change what a retried render produces
//
// Run with (Node 22 requires the type-stripping flag to import the .ts module):
//   node --experimental-strip-types --test tests/lexity-video-manifest.test.mjs

import { test } from "node:test";
import assert from "node:assert/strict";

import { nodePath } from "./paths.mjs";

const {
  buildManifest,
  editionKey,
  normaliseTerm,
  basenameOf,
  isHttpUrl,
  sha256Hex,
  attachIntegrity,
  verifyIntegrity,
  MANIFEST_SCHEMA_VERSION,
} = await import(nodePath("lexity-video-manifest"));

const BUCKET = "https://storage.googleapis.com/buildship-4tgke4-us-central1/lexity";

/** A representative record, modelled on the real LexiconRecord schema. */
const record = (over = {}) => ({
  term: "Acomiast",
  definition: "A person who does not take the time to rest or relax; a workaholic.",
  etymology: "Greek",
  language: "ENGLISH",
  partOfSpeech: "noun",
  pronunciation: "uh-KOH-mee-ast",
  usage: "He was such an acomiast that he never took a holiday.",
  imageUrl: `${BUCKET}/1789000000000.png`,
  colours: { vibrant: "#FF6B6B", textColor: "#57636C", lightVibrant: "#FFD166" },
  blurhash: "UEK]}p$P0KNd3sJ8vzof01xG?Hs,DgoeyEWB",
  creationDate: "2026-09-14T06:00:00.000Z",
  termSpoken: `${BUCKET}/Acomiast-term.mp3`,
  usageSpoken: `${BUCKET}/Acomiast-usage.mp3`,
  ...over,
});

const opts = { sydneyDate: "2026-09-14", docPath: "lexicon/abc123", templateVersion: "1.0.0" };

/** Capture a thrown ManifestError for assertions. */
function caught(fn) {
  try {
    fn();
  } catch (e) {
    return e;
  }
  throw new Error("expected a ManifestError, but nothing was thrown");
}

test("accepts a representative existing record", () => {
  const m = buildManifest(record(), opts);
  assert.equal(m.schemaVersion, MANIFEST_SCHEMA_VERSION);
  assert.equal(m.text.term, "Acomiast");
  assert.equal(m.edition.sydneyDate, "2026-09-14");
  assert.equal(m.edition.docId, "abc123");
  assert.equal(m.template.version, "1.0.0");
  assert.equal(m.colours.vibrant, "#FF6B6B");
  assert.ok(m.media.image.url.endsWith(".png"));
  assert.ok(m.media.audio.term.url.endsWith("-term.mp3"));
  assert.ok(m.media.audio.usage.url.endsWith("-usage.mp3"));
});

test("all three media assets are required before a manifest exists", () => {
  for (const field of ["imageUrl", "termSpoken", "usageSpoken"]) {
    const err = caught(() => buildManifest(record({ [field]: "" }), opts));
    assert.equal(err.code, "missing_field", `${field} should be missing_field`);
    const expectedField = field.startsWith("image") ? /media\.image\.url/ : /media\.audio\./;
    assert.match(err.field, expectedField);
  }
});

test("rejects a malformed image URL as unreadable rather than absent", () => {
  const err = caught(() => buildManifest(record({ imageUrl: "not-a-url" }), opts));
  assert.equal(err.code, "unreadable_asset");
  assert.equal(err.field, "media.image.url");
});

test("rejects audio belonging to a different word (wrong-word guard)", () => {
  const err = caught(() =>
    buildManifest(record({ termSpoken: `${BUCKET}/Zephyr-term.mp3` }), opts),
  );
  assert.equal(err.code, "wrong_word");
  assert.equal(err.field, "media.audio.term.url");
});

test("rejects audio whose name violates the suffix contract", () => {
  const err = caught(() =>
    buildManifest(record({ usageSpoken: `${BUCKET}/Acomiast-voice.mp3` }), opts),
  );
  assert.equal(err.code, "unreadable_asset");
  assert.equal(err.field, "media.audio.usage.url");
});

test("rejects a mismatched expected word — the wrong-edition guard", () => {
  const err = caught(() =>
    buildManifest(record(), { ...opts, expectedTerm: "Zephyr" }),
  );
  assert.equal(err.code, "wrong_word");
  assert.equal(err.field, "text.term");

  // and accepts it when it matches, including case differences
  assert.doesNotThrow(() =>
    buildManifest(record(), { ...opts, expectedTerm: "acomiast" }),
  );
});

test("rejects a malformed publication date", () => {
  for (const bad of ["", "14-09-2026", "2026-9-14", "today"]) {
    const err = caught(() => buildManifest(record(), { ...opts, sydneyDate: bad }));
    assert.equal(err.code, "bad_date", `'${bad}' should be bad_date`);
  }
});

test("rejects a record whose assets are not finished yet (no creationDate)", () => {
  const err = caught(() => buildManifest(record({ creationDate: "" }), opts));
  assert.equal(err.code, "missing_field");
  assert.equal(err.field, "text.creationDate");
});

test("rejects an empty term or definition without inventing a fallback", () => {
  // The FlutterFlow card silently substitutes 'Acomiast' and a stock definition
  // when these are empty; the manifest must not inherit that behaviour.
  assert.equal(caught(() => buildManifest(record({ term: "" }), opts)).code, "missing_field");
  assert.equal(caught(() => buildManifest(record({ definition: "" }), opts)).code, "missing_field");
});

test("normaliseTerm folds case, accents and punctuation", () => {
  assert.equal(normaliseTerm("Acomiast"), "acomiast");
  assert.equal(normaliseTerm("Flâneur"), "flaneur");
  assert.equal(normaliseTerm("  Flâneur! "), "flaneur");
  assert.equal(normaliseTerm("Café"), "cafe");
  assert.equal(normaliseTerm(undefined), "");
});

test("accented terms match their accented asset names", () => {
  const m = buildManifest(
    record({
      term: "Flâneur",
      termSpoken: `${BUCKET}/Flâneur-term.mp3`,
      usageSpoken: `${BUCKET}/Flâneur-usage.mp3`,
    }),
    opts,
  );
  assert.equal(m.text.term, "Flâneur");
});

test("percent-encoded asset names are decoded before comparison", () => {
  // GCS object names appear percent-encoded in some URL forms.
  const m = buildManifest(
    record({
      term: "Flâneur",
      termSpoken: `${BUCKET}/Fl%C3%A2neur-term.mp3`,
      usageSpoken: `${BUCKET}/Fl%C3%A2neur-usage.mp3`,
    }),
    opts,
  );
  assert.equal(m.text.term, "Flâneur");
});

test("non-Latin terms skip the substring check but still enforce the suffix", () => {
  // 日本語 normalises to "" — a naive includes("") would pass trivially, so the
  // term check is skipped deliberately. The suffix contract must still hold.
  assert.equal(normaliseTerm("日本語"), "");
  assert.doesNotThrow(() =>
    buildManifest(
      record({
        term: "日本語",
        termSpoken: `${BUCKET}/日本語-term.mp3`,
        usageSpoken: `${BUCKET}/日本語-usage.mp3`,
      }),
      opts,
    ),
  );
  assert.equal(
    caught(() =>
      buildManifest(
        record({
          term: "日本語",
          termSpoken: `${BUCKET}/日本語-voice.mp3`,
          usageSpoken: `${BUCKET}/日本語-usage.mp3`,
        }),
        opts,
      ),
    ).code,
    "unreadable_asset",
  );
});

test("KNOWN LIMIT: this validator does not catch a doubled storage prefix", () => {
  // STU-299's defect is lexity/lexity/{term}-term.mp3. That is a path-prefix
  // problem, not a word or suffix problem, so the manifest legitimately accepts
  // it — the guard belongs in the consumer, which must read the stored value
  // rather than reconstruct the path. Recorded so the gap is explicit.
  const m = buildManifest(
    record({
      termSpoken: `${BUCKET}/lexity/Acomiast-term.mp3`,
      usageSpoken: `${BUCKET}/lexity/Acomiast-usage.mp3`,
    }),
    opts,
  );
  assert.ok(m.media.audio.term.url.includes("/lexity/lexity/"));
});

test("the snapshot is frozen — a later edit cannot change a retried render", () => {
  const source = record();
  const m = buildManifest(source, opts);
  assert.ok(Object.isFrozen(m));

  // Mutating the source record afterwards must not alter the frozen manifest.
  source.term = "Zephyr";
  source.imageUrl = `${BUCKET}/other.png`;
  assert.equal(m.text.term, "Acomiast");
  assert.ok(m.media.image.url.endsWith("1789000000000.png"));
});

test("editionKey is stable and identifies one edition/word/template", () => {
  const a = editionKey(buildManifest(record(), opts));
  const b = editionKey(buildManifest(record(), opts));
  assert.equal(a, b, "identical inputs must dedupe to one key");
  assert.equal(a, "2026-09-14::acomiast::1.0.0");

  const other = editionKey(
    buildManifest(record(), { ...opts, templateVersion: "2.0.0" }),
  );
  assert.notEqual(a, other, "a new template version is a different job");
});

test("URL helpers behave on the shapes the pipeline actually produces", () => {
  assert.ok(isHttpUrl("https://storage.googleapis.com/b/x.png"));
  assert.ok(!isHttpUrl("gs://bucket/x.png"));
  assert.ok(!isHttpUrl(""));
  assert.equal(basenameOf(`${BUCKET}/Acomiast-term.mp3`), "Acomiast-term.mp3");
  assert.equal(basenameOf(`${BUCKET}/Acomiast-term.mp3?token=abc`), "Acomiast-term.mp3");
  assert.equal(basenameOf(`${BUCKET}/Fl%C3%A2neur-term.mp3`), "Flâneur-term.mp3");
});

// ---------------------------------------------------------------------------
// Media-byte integrity (STU-280: "download and validate actual media bytes
// once; freeze the snapshot for retries")
// ---------------------------------------------------------------------------

const bytesFor = (s) => new TextEncoder().encode(s);

/** A fetcher that serves different bytes per asset key, so mismatches are provable. */
const fetcherFor = (byKey, over = {}) => async (url) => {
  for (const [k, v] of Object.entries(byKey)) {
    if (url.includes(v)) return bytesFor(over[k] ?? `${k}-body`);
  }
  throw new Error(`unexpected url ${url}`);
};

const plan = {
  image: "1789000000000.png",
  termAudio: "Acomiast-term.mp3",
  usageAudio: "Acomiast-usage.mp3",
};

test("sha256Hex matches the published test vector", () => {
  // Anchors the hash itself rather than trusting our own implementation.
  assert.equal(
    sha256Hex(bytesFor("abc")),
    "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad",
  );
});

test("attachIntegrity records size and checksum for all three assets", async () => {
  const m = await attachIntegrity(buildManifest(record(), opts), fetcherFor(plan));
  assert.deepEqual(Object.keys(m.integrity).sort(), ["image", "termAudio", "usageAudio"]);
  for (const k of ["image", "termAudio", "usageAudio"]) {
    assert.ok(m.integrity[k].bytes > 0, `${k} should record a byte count`);
    assert.match(m.integrity[k].sha256, /^[a-f0-9]{64}$/);
  }
  assert.equal(m.integrity.image.sha256, sha256Hex(bytesFor("image-body")));
});

test("attachIntegrity rejects an asset that cannot be fetched", async () => {
  const failing = async (url) => {
    if (url.includes("Acomiast-usage.mp3")) {
      const e = new Error("404");
      throw e;
    }
    return bytesFor("ok");
  };
  await assert.rejects(() => attachIntegrity(buildManifest(record(), opts), failing));
});

test("attachIntegrity rejects a zero-byte asset rather than freezing it", async () => {
  const empty = async () => new Uint8Array(0);
  await assert.rejects(() => attachIntegrity(buildManifest(record(), opts), empty));
});

test("verifyIntegrity passes when the bytes are unchanged", async () => {
  const m = await attachIntegrity(buildManifest(record(), opts), fetcherFor(plan));
  await assert.doesNotReject(() => verifyIntegrity(m, fetcherFor(plan)));
});

test("verifyIntegrity fails when an asset changed under us", async () => {
  const m = await attachIntegrity(buildManifest(record(), opts), fetcherFor(plan));
  // Same URLs, different bytes: exactly what a silently-replaced asset looks like.
  const swapped = fetcherFor(plan, { usageAudio: "TAMPERED" });
  await assert.rejects(
    () => verifyIntegrity(m, swapped),
    (err) => err.code === "unreadable_asset" && /checksum changed/.test(err.message),
  );
});

test("verifyIntegrity refuses a manifest with no recorded integrity", async () => {
  await assert.rejects(
    () => verifyIntegrity(buildManifest(record(), opts), fetcherFor(plan)),
    (err) => err.code === "missing_field" && err.field === "integrity",
  );
});
