---
name: staged-boundary-is-the-only-split
description: a run commits the index content first and exactly and never infers a region split; multi-region files are reported, and more than three affected files collapse to one bounded warning with per-file detail under `--verbose`
type: decision
---

# The index is the only split the run acts on

`commitWorkflow` commits the index content first, through `git commit` alone: no
`git reset`, no `git add`, no content rebuilt, no index entry written by
git-agent. The remainder is the working tree measured against the index plus the
untracked paths, and it goes through the file-level flow unchanged. A dry run
records the index tree (`write-tree`) and puts it back (`read-tree`), because it
stages groups to show a real per-group diff.

**Why**: the run used to `UnstageAll` and re-add each path whole, which destroyed
what the user expressed with `git add -p` and made `--no-stage` commit the whole
file. Reproduced with the develop binary: one region staged by hand, and the
commit carried the loose region too.

**How to apply**: keep the split user-driven. A path whose only difference from
HEAD is the index is excluded from the remainder, so a fully staged path is never
handed to the file-level flow twice: a run whose index holds complete file changes
makes the commits it made before this fix, and only a path staged in part is
committed in two parts.

A file whose change covers two or more anchored regions is reported on
`WarnWriter` (wired to stderr with or without a terminal). Up to three such files
are each named on the warning stream with their region count, headings, and a
`git add -p <file>` command. More than three produce one bounded warning line with
the count, up to three example paths, and one concrete `git add -p` command; a
non-verbose run appends a hint to rerun with `--verbose`, which writes every
per-file line after the summary and omits the hint. Region headings are capped at
three per file; the thresholds are `maxDetailedRegionFiles` and
`maxRegionHeadings`, both 3.

Never infer a boundary, never rebuild content, and never call `StageFiles` for a
path the index already holds a decision about. Every diff shown to the model goes
through `preparedForModel`, so the staged path keeps the filter and both caps.

An attempt to infer regions instead (a hunk parser, applier, region ledger and
two tunable settings, about 1447 production lines) was measured against real
history and dropped: the fine end made 7.08 pieces per human split and split 44%
of changes humans kept whole, and it could not check that a region commit builds.
The measurement harness and the defects it found are gone with it; see the commit
history if that route is ever revisited.
