# Social video pipeline — node test suites

Tests for the three custom BuildShip nodes behind the Lexity daily-word video
pipeline. They live **here**, in the Lexity repo, and not in the BuildShip repo.

## Why not in the BuildShip repo

The BuildShip GitHub repo is a **sync surface** for BuildShip, not a normal code
repo. Its `.gitignore` excludes `/tests` on purpose: GitHub does not recognise
those files, so committing them there does nothing except clutter the sync
surface — and has previously blocked it outright.

Consequence worth knowing: because the rule ignores the whole `/tests`
directory, **any new test file added there is silently invisible to git**. The
three older suites in that repo stay tracked only because they predate the rule.

## What is covered

| Suite | Node | Tests |
| -- | -- | -- |
| `lexity-video-manifest.test.mjs` | `lexity-video-manifest` | 24 |
| `lexity-video-job.test.mjs` | `lexity-video-job` | 13 |
| `lexity-video-enqueue.test.mjs` | `lexity-video-enqueue` | 15 |

These are the acceptance evidence for STU-280 (input manifest), STU-281 (durable
jobs, leases, deduplication) and STU-282 (enqueue + reconciliation + DST).

## Running

```sh
node --experimental-strip-types --test lexity-video-manifest.test.mjs \
                                    lexity-video-job.test.mjs \
                                    lexity-video-enqueue.test.mjs
```

Node 22+ is required: `--experimental-strip-types` is what lets the suites import
the nodes' `.ts` sources directly.

## How the node sources are found

The nodes are version-controlled in the BuildShip repo; these tests import them
from a checkout on disk. `paths.mjs` resolves that checkout in this order:

1. `$BUILDSHIP_REPO`, if set
2. a **sibling** checkout at `../../../buildship` — i.e. `~/Projects/buildship`

If neither exists, the suites fail immediately with a message naming the paths
they tried, rather than an obscure module-not-found. Set the variable when the
checkout lives somewhere else:

```sh
BUILDSHIP_REPO=/path/to/buildship node --experimental-strip-types --test <suite>
```

## Provenance

Extracted from `~/Projects/buildship` at commit `fae59bd`, where the node sources
are tracked but these suites cannot be. The copies left in the BuildShip working
tree are untracked and ignored; **this directory is the version-controlled copy**,
so if the two ever disagree, this one is authoritative — or better, delete the
BuildShip-side copies to remove the ambiguity.
