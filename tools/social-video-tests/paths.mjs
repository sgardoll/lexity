// Resolves the BuildShip node sources these tests exercise.
//
// The nodes are version-controlled in the BuildShip repo (which is a sync
// surface for BuildShip, not a normal code repo — its .gitignore excludes
// /tests on purpose, so tests cannot live there). The tests live here instead
// and import the node sources from a BuildShip checkout on disk.
//
// Resolution rules:
//   * $BUILDSHIP_REPO, when set, is AUTHORITATIVE — if it is not a usable
//     checkout this is an error, never a silent fall back to somewhere else.
//     Falling back would let the suites pass against a different checkout than
//     the one you asked for, which is exactly the surprise tests must not have.
//   * otherwise, a sibling checkout at ../../../buildship (~/Projects/buildship)

import { existsSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const here = path.dirname(fileURLToPath(import.meta.url));

/** A usable checkout is one that actually holds a nodes/ directory. */
const isCheckout = (dir) => Boolean(dir) && existsSync(path.join(dir, "nodes"));

const fromEnv = process.env.BUILDSHIP_REPO?.trim();
const sibling = path.resolve(here, "../../../buildship");

if (fromEnv && !isCheckout(fromEnv)) {
  throw new Error(
    [
      `BUILDSHIP_REPO is set to "${fromEnv}" but that is not a BuildShip checkout.`,
      "It must contain a nodes/ directory. Unset it to use the sibling default,",
      `or point it at a real checkout (the sibling default is ${sibling}).`,
    ].join("\n"),
  );
}

export const buildshipRepo = fromEnv || sibling;

if (!isCheckout(buildshipRepo)) {
  throw new Error(
    [
      "Could not locate a BuildShip checkout containing nodes/.",
      `Looked in: ${buildshipRepo}`,
      "Set BUILDSHIP_REPO=/path/to/buildship if it lives elsewhere.",
    ].join("\n"),
  );
}

/** Absolute path to a custom node's entry module. */
export const nodePath = (id, version = "1.0.0") =>
  path.join(buildshipRepo, "nodes", id, version, "main.ts");
