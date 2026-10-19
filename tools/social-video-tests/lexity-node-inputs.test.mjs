// Structural guard for the whole node set (STU-280/281/282).
//
// BuildShip drops any input that is not declared in a node's inputs.json when it
// deploys. So a node that destructures a parameter it never declared reads
// `undefined` at runtime, silently — which is exactly what happened to
// `editionKey` on lexity-video-job and produced `job::undefined` on a live run.
//
// This test would have caught that before deploy: every parameter a node reads
// must be declared.
//
// Run with:
//   node --experimental-strip-types --test lexity-node-inputs.test.mjs

import { test } from "node:test";
import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import path from "node:path";

import { buildshipRepo, nodePath } from "./paths.mjs";

const NODES = ["lexity-video-manifest", "lexity-video-enqueue", "lexity-video-job"];

/** Parameters a node reads off its first (inputs) argument. */
function destructuredInputs(source) {
  const m = /export default async function\s+\w+\s*\(\s*\{([^}]*)\}/.exec(source);
  if (!m) return null;
  return m[1]
    .split(",")
    .map((raw) => raw.split(":")[0].split("=")[0].trim())
    .filter(Boolean);
}

for (const id of NODES) {
  test(`${id}: every parameter it reads is declared in inputs.json`, () => {
    const dir = path.dirname(nodePath(id));
    const source = readFileSync(nodePath(id), "utf8");
    const declared = Object.keys(
      JSON.parse(readFileSync(path.join(dir, "inputs.json"), "utf8")).properties,
    );

    const read = destructuredInputs(source);
    assert.ok(read, `could not parse the default export signature of ${id}`);

    // The regression: an undeclared input is silently dropped on deploy.
    const undeclared = read.filter((p) => !declared.includes(p));
    assert.deepEqual(
      undeclared,
      [],
      `${id} reads ${JSON.stringify(undeclared)} but does not declare them — BuildShip will drop these on deploy`,
    );
  });

  test(`${id}: ships the files a deployable node needs`, () => {
    const dir = path.dirname(nodePath(id));
    for (const f of ["main.ts", "inputs.json", "output.json", "schema.json", "meta.json"]) {
      assert.doesNotThrow(() => readFileSync(path.join(dir, f)), `${id} is missing ${f}`);
    }
  });
}

test("the node check is actually looking at the BuildShip checkout", () => {
  // Guard against the suite passing because it resolved the wrong tree.
  assert.ok(buildshipRepo.includes("buildship"), `unexpected repo: ${buildshipRepo}`);
  for (const id of NODES) {
    assert.ok(
      readFileSync(nodePath(id), "utf8").includes("export default async function"),
      `${id} unreadable`,
    );
  }
});

test("every declared input carries the buildship wrapper BuildShip requires", () => {
  // BuildShip expects each input property to be {"buildship": {index, sensitive}, ...}.
  // An unwrapped property is silently not rendered as an input, which is how a
  // brand-new input can appear correct in the repo and be absent on deploy.
  for (const id of NODES) {
    const dir = path.dirname(nodePath(id));
    const props = JSON.parse(readFileSync(path.join(dir, "inputs.json"), "utf8")).properties;
    const unwrapped = Object.entries(props)
      .filter(([, v]) => !(v.buildship && typeof v.buildship.index === "number" && "sensitive" in v.buildship))
      .map(([k]) => k);
    assert.deepEqual(unwrapped, [], `${id} has inputs without the buildship wrapper: ${JSON.stringify(unwrapped)}`);
  }
});
