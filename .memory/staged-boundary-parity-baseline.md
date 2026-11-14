---
name: "staged-boundary-parity-baseline.md"
description: "e2e/staged_boundary_parity_test.go compares the tree with pinned pre-fix revision 6c58d09 (parent of cdf55b0) in a detached worktree; it skips when that revision is unavailable, so build-check.yml checks out with fetch-depth: 0"
type: project
---
`e2e/staged_boundary_parity_test.go` compares this tree with the revision immediately before the staged-boundary fix; its header comment records that a moving `develop` branch stopped representing the defect once the fix landed there, so the baseline is pinned and built once in a detached worktree.

The pinned baseline is revision `6c58d09`, declared in the source as the parent of `cdf55b0`, and `baselineBinary` builds it once and returns its binary path.

The parity check requires the current binary to match the baseline on exit code, commit subjects, the JSON envelope, and the model request bodies; the test logs that the pre-fix baseline absorbed the unstaged region and left the working tree empty.

The helper's comment records that it skips when the pinned revision is unavailable, which is what a shallow checkout sees; `.github/workflows/build-check.yml` therefore checks out with `fetch-depth: 0`, and the CHANGELOG records that full history keeps the pinned pre-fix baseline from silently skipping in CI.

Why: the comparison is a test rather than a note, so the pre-fix defect has to stay reproducible. How to apply: keep the baseline pinned to the pre-fix revision and keep full history in CI; do not repoint the parity test at a moving branch or drop `fetch-depth: 0`.