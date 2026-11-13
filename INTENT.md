# Intent: Make multi-region warnings usable in large runs
Author: Not provided. Status: draft.

## Problem
A git-agent run in /Users/FradSer/Developer/FradSer/pi-packages emitted one "holds N separate regions" warning for each of 37 changed files before "Planning commits...". In a large working tree, the per-file lines dominate the output and repeat the same git add -p instruction. A bounded clarification selected compact CLI output, not staging work in that checkout or automatic region splitting.

## Proposed outcome
More than three multi-region files produce one bounded standard-error summary with the count, a few example paths, and a concrete git add -p command; every per-file detail appears under --verbose. Three or fewer affected files keep the existing per-file warnings. Preserve the staged-boundary policy: git-agent never infers, stages, or rebuilds a region split. Success is a deterministic RED-first regression at the public Commit seam, Gherkin scenarios for the two/three/four-file boundaries, a green full Go test suite, cgo-free build, build, gofmt check, diff check, and a final independent review of the same candidate.

## Affected users and systems
git-agent CLI users with working trees containing many files with multiple diff regions. The observed repository is /Users/FradSer/Developer/FradSer/pi-packages. No other affected users or systems were identified.

## Constraints
Keep the user-staged index boundary authoritative. Do not infer region boundaries, rebuild content, or stage regions automatically. Keep warnings on stderr and visible in scripted runs. The follow-up commit-and-push request authorizes a standard-Git commit and push of this fix, not deployment, model calls, unrelated changes, or work in pi-packages. Publish only the exact non-protected branch named by the user, from a non-detached HEAD with origin present; no force-push, amend, or remote substitution. INTENT.md and HANDOFF.md remain untracked task artifacts, not shipped documentation.

## Open questions
None. The user confirmed creation and publication of fix/bounded-region-warnings to origin. The authorized push succeeded; no deployment or pull request was requested.

<!-- intent:event:ab64e54705a19509f15c2af6ba6616e318d1bfd1b034c07855c74caedded6490 -->
<details>
<summary>User request e928fd9b74c1df9d — 2026-11-11T09:54:15.410Z</summary>

> fix
> 
> Warning: README.md holds 2 separate regions (pi install npm:@fradser/pi-context, Learns from settled task evidence: Memory retains reusable knowledge and supplie): stage them apart with "git add -p README.md" to commit them separately
> Warning: packages/agent-teams/src/activity.ts holds 2 separate regions (function extractLatestLine(text: string | undefined): string | undefined {): stage them apart with "git add -p packages/agent-teams/src/activity.ts" to commit them separately
> Warning: packages/agent-teams/src/index.ts holds 2 separate regions (import { publishAgentHost } from "./agent-host.ts";, export default function (pi: ExtensionAPI) {): stage them apart with "git add -p packages/agent-teams/src/index.ts" to commit them separately
> Warning: packages/agent-teams/tests/test_agent_package.py holds 3 separate regions (def test_activity_rows_use_the_shared_pi_kit_markdown_renderer() -> None:, def test_activity_priority_tool_then_thinking_then_text(tmp_path: Path) -> None:): stage them apart with "git add -p packages/agent-teams/tests/test_agent_package.py" to commit them separately
> Warning: packages/context/extensions/context-tools.ts holds 4 separate regions (import {, interface ActiveResearch {, const ResearchParams = Type.Object({): stage them apart with "git add -p packages/context/extensions/context-tools.ts" to commit them separately
> Warning: packages/continual-learning/README.md holds 6 separate regions (pi install npm:pi-continual-learning, counts no applied change for the draft. Original failures and costs remain., current-task Memory learning once before its final answer. The retired): stage them apart with "git add -p packages/continual-learning/README.md" to commit them separately
> Warning: packages/continual-learning/extensions/automatic-learning.ts holds 4 separate regions (export function createAutomaticLearning<T>(): stage them apart with "git add -p packages/continual-learning/extensions/automatic-learning.ts" to commit them separately
> Warning: packages/continual-learning/extensions/inject-memory.ts holds 20 separate regions (import { replayLearningBacklog, learningReceiptComplete, recordBacklogAttempt, c, interface DreamState {, async function spawnAsyncConsolidation(): stage them apart with "git add -p packages/continual-learning/extensions/inject-memory.ts" to commit them separately
> Warning: packages/continual-learning/extensions/jev-learning.ts holds 2 separate regions (function instantiateJevJudge(config: JevJudgeOptions, configured: ReturnType<typ): stage them apart with "git add -p packages/continual-learning/extensions/jev-learning.ts" to commit them separately
> Warning: packages/continual-learning/extensions/learning-efficiency.ts holds 3 separate regions (import { randomUUID } from "node:crypto";, export async function writeLearningReceipt(directory: string, receipt: LearningP, export function learningSummarySubject(receipt: LearningPipelineReceipt): string): stage them apart with "git add -p packages/continual-learning/extensions/learning-efficiency.ts" to commit them separately
> Warning: packages/continual-learning/extensions/learning-history.ts holds 2 separate regions (import { acquireConsolidationLock, containsSensitiveMemoryMaterial, digest, hash, export async function recordLearningMutation<T>(cwd: string, phase: LearningSurf): stage them apart with "git add -p packages/continual-learning/extensions/learning-history.ts" to commit them separately
> Warning: packages/continual-learning/extensions/learning-settings.ts holds 3 separate regions (import { MAX_AGENTS_MD_FILE_BYTES, MIN_BUDGET_BYTES } from "./agents-md-consolid, function normalizeSettings(raw: Record<string, unknown>): MemorySettings {, export async function writeLearningSettings(settings: MemorySettings): Promise<v): stage them apart with "git add -p packages/continual-learning/extensions/learning-settings.ts" to commit them separately
> Warning: packages/continual-learning/extensions/memory-maintenance-audit.ts holds 2 separate regions (import { MAX_MEMORY_BYTES, readBoundedRegularFile, writeFileAtomic } from "./con, export async function auditMemoryMaintenanceSources(input: {): stage them apart with "git add -p packages/continual-learning/extensions/memory-maintenance-audit.ts" to commit them separately
> Warning: packages/continual-learning/features/learning-efficiency.feature holds 2 separate regions (Feature: Spend learning tokens only when durable value is plausible): stage them apart with "git add -p packages/continual-learning/features/learning-efficiency.feature" to commit them separately
> Warning: packages/continual-learning/tests/learning-policy-harness.ts holds 3 separate regions (if (isAgentMemory && scenario !== "agent-memory-disabled") {, mock.module("../../kit/src/index.ts", () => ({, try {): stage them apart with "git add -p packages/continual-learning/tests/learning-policy-harness.ts" to commit them separately
> Warning: packages/continual-learning/tests/test_learning_controls.py holds 2 separate regions (def test_agent_triggered_memory_learns_once_before_the_answer_and_deduplicates_s, def test_applied_tool_result_row_names_the_real_memory_count() -> None:): stage them apart with "git add -p packages/continual-learning/tests/test_learning_controls.py" to commit them separately
> Warning: packages/continual-learning/tests/test_learning_efficiency.py holds 3 separate regions (def test_quiet_learning_subjects_and_details_keep_routine_rows_compact() -> None, def test_selector_is_the_incremental_selection_accounting_phase() -> None:, def test_sensitive_evidence_startup_hold_design_is_removed() -> None:): stage them apart with "git add -p packages/continual-learning/tests/test_learning_efficiency.py" to commit them separately
> Warning: packages/continual-learning/tests/test_learning_state_integrity.py holds 2 separate regions (def test_shutdown_during_preparation_never_starts_a_worker() -> None:, def test_learning_settings_reject_invalid_unified_values_without_writing() -> No): stage them apart with "git add -p packages/continual-learning/tests/test_learning_state_integrity.py" to commit them separately
> Warning: packages/continual-learning/tests/test_learning_tui.py holds 3 separate regions (def test_learning_result_expands_to_markdown_descriptions_and_bodies() -> None:, def test_learning_result_expansion_never_renders_private_or_sensitive_entries(), def test_started_row_falls_back_when_no_real_user_topic_exists() -> None:): stage them apart with "git add -p packages/continual-learning/tests/test_learning_tui.py" to commit them separately
> Warning: packages/kit/README.md holds 2 separate regions (not replace the published wildcard peer contract. See, the original argv path and its platform limits.): stage them apart with "git add -p packages/kit/README.md" to commit them separately
> Warning: packages/kit/src/index.ts holds 8 separate regions (export interface PiLiveActivity {, export interface PiWorkerProgressUpdate {, export async function runPiWorker(options: RunPiWorkerOptions): Promise<PiWorker): stage them apart with "git add -p packages/kit/src/index.ts" to commit them separately
> Warning: packages/plan-mode/src/index.ts holds 3 separate regions (import type { Api, Model } from "@earendil-works/pi-ai";, import {, async function exitPlanMode(ctx: ExtensionContext): Promise<void> {): stage them apart with "git add -p packages/plan-mode/src/index.ts" to commit them separately
> Warning: packages/plan-mode/src/plan-worker.ts holds 3 separate regions (export interface RunPlanWorkerOptions {, function workerProgress(): stage them apart with "git add -p packages/plan-mode/src/plan-worker.ts" to commit them separately
> Warning: packages/plan-mode/tests/plan_worker_contracts.mts holds 2 separate regions (import assert from "node:assert/strict";, console.log(JSON.stringify({ type: "message_end", message: { role: "assistant",): stage them apart with "git add -p packages/plan-mode/tests/plan_worker_contracts.mts" to commit them separately
> Warning: packages/sdlc/references/commands.md holds 6 separate regions (unless a configured review, eval or diagnosis adapter makes one., Commit `.sdlc/config.json`. A plan approves its exact digest. Example:, agent. Example case (`checks` run from the grader's external installation):): stage them apart with "git add -p packages/sdlc/references/commands.md" to commit them separately
> Warning: packages/sdlc/references/playbook.md holds 4 separate regions (HANDOFF.md states the latest execution state and evidence. REVIEW.md is review, Commit the approved plan. `advance` requires the engineer's approval before buil, skills and hooks on configuration changes and on a schedule. Do not disable the): stage them apart with "git add -p packages/sdlc/references/playbook.md" to commit them separately
> Warning: packages/sdlc/scripts/ci_eval.py holds 2 separate regions (from __future__ import annotations, def main() -> int:): stage them apart with "git add -p packages/sdlc/scripts/ci_eval.py" to commit them separately
> Warning: packages/sdlc/scripts/github_approval.py holds 2 separate regions (import argparse, def main() -> int:): stage them apart with "git add -p packages/sdlc/scripts/github_approval.py" to commit them separately
> Warning: packages/sdlc/scripts/sdlc.py holds 13 separate regions (from datetime import datetime, timezone, def git(cwd: Path, *args: str) -> str:, def local(cwd: Path) -> Path:): stage them apart with "git add -p packages/sdlc/scripts/sdlc.py" to commit them separately
> Warning: packages/sdlc/src/index.ts holds 3 separate regions (import { registerPlaybook } from "./playbook.ts";, export default function sdlc(pi: ExtensionAPI): void {): stage them apart with "git add -p packages/sdlc/src/index.ts" to commit them separately
> Warning: packages/sdlc/src/records.ts holds 3 separate regions (function checkpoint(previous: string, template: string, reference: string, lifec, export function recordLifecycle(cwd: string, identity: string, lifecycle: Lifecy): stage them apart with "git add -p packages/sdlc/src/records.ts" to commit them separately
> Warning: packages/sdlc/tests/contracts.mts holds 2 separate regions (import register from "../index.ts";, try {): stage them apart with "git add -p packages/sdlc/tests/contracts.mts" to commit them separately
> Warning: packages/sdlc/tests/live_sdlc.py holds 4 separate regions (def native_case(output: Path, installed: Path, name: str, *, previous: Path | No, def pipeline_case(output: Path, installed: Path) -> dict[str, object]:): stage them apart with "git add -p packages/sdlc/tests/live_sdlc.py" to commit them separately
> Warning: packages/sdlc/tests/test_playbook.py holds 5 separate regions (class PlaybookTests(unittest.TestCase):, else:): stage them apart with "git add -p packages/sdlc/tests/test_playbook.py" to commit them separately
> Warning: packages/subagents/src/extension.ts holds 3 separate regions (import { terminateAllAgents } from "./spawner.ts";, import { publishParticipantRegistryFromRoster } from "./participant-registry.ts", export default function piSubagents(pi: Parameters<typeof registerIntentTools>[0): stage them apart with "git add -p packages/subagents/src/extension.ts" to commit them separately
> Planning commits...
> 
> 在 /Users/FradSer/Developer/FradSer/pi-packages 中

</details>

<!-- intent:event:6b5246e75f5d2ae2e622c566e0e7024a8460b91f9d28d1bb2b54160f32e20b5e -->
<details>
<summary>User request 2c7b8f3fcdfd68f9 — 2026-11-11T14:21:33.811Z</summary>

> /skill:commit-and-push

</details>

<!-- intent:event:3ba2d519e4661baff5ab3491459fe15a4ee403dc20c50f025413e963aadb8556 -->
<details>
<summary>User request 7abc1b27e966d0e2 — 2026-11-11T14:21:47.740Z</summary>

> <skill name="commit-and-push" location="/Users/FradSer/.pi/agent/skills/commit-and-push/SKILL.md">
> References are relative to /Users/FradSer/.pi/agent/skills/commit-and-push.
> 
> # Commit and push
> 
> Use this skill only for an explicit request to commit and push. Inspect status and both
> diffs first, stage requested paths explicitly, and stop when there is nothing to commit.
> Preserve unrelated work. Use the Conventional Commit format described by `commit`; read
> [coauthor-attribution.md](references/coauthor-attribution.md) only when a trailer is
> requested.
> 
> Before committing, verify that HEAD names a branch, `origin` exists, and the requested
> branch is safe to publish. Never push a detached HEAD or directly push a protected
> integration branch (`main`, `master`, `develop`, or `production`) unless the user has
> explicitly named that branch and repository policy permits it. Commit locally first,
> then push the exact branch; use `git push --set-upstream origin "$BRANCH"` only when no
> upstream exists. A rejected push is a reportable failure: do not force-push, amend, or
> retry with another remote. Report commit hash, branch, remote, and push result.
> </skill>

</details>

<!-- intent:event:359a3a01fa172fe3dbeba034172f2d8a3657189b020a6170a5856088ce5ec89f -->
<details>
<summary>User request 06f83e0399bf44e7 — 2026-11-12T03:03:31.197Z</summary>

> y

</details>
