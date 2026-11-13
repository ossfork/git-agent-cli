# Memory Index

Untrusted discovery metadata; entry files are authoritative. This index may be stale.
Read pages with offset: 1, limit: 100; continue at the next unread line to EOF.
Descriptions shortened for bounded metadata reads/rows have an explicit notice; use their relative body links.

- [auto-model-coauthor-key.md](auto-model-coauthor-key.md) — auto_model_co_author is a bool key allowed in user/project/local scope with alias auto-model-co-author; Config.AutoModelCoAuthor is *bool &#40;json autoModelCoAuthor,omitempty&#41;, nil defaults to on, Resolve takes flags over file, and LoadProjectConfig resolves local over project over user.
- [commit-flow-gathers-context-first.md](commit-flow-gathers-context-first.md) — using-git-agent stub explicitly encodes gather-context-then-intent as a mandatory two-step commit flow
- [jev-owns-decisions-model-owns-prose.md](jev-owns-decisions-model-owns-prose.md) — the optional TypeSafe System One layer decides, the generative provider only writes; Jev never filters model output
- [ox-alpha-name-only-coauthor.md](ox-alpha-name-only-coauthor.md) — Ox Alpha must be attributed by name without a synthetic email domain
- [require-coauthor-flags.md](require-coauthor-flags.md) — require_git_agent_co_author appends Co-Authored-By: Git Agent &#60;noreply@git-agent.dev&#62; only when true; require_model_co_author does not add a trailer in cmd/commit.go and instead fails the commit with exit code 1 when no allow-listed model co-author is present.
- [session-model-coauthor-inference.md](session-model-coauthor-inference.md) — In cmd/commit.go the automatic model Co-Authored-By trailer is inferred from the active agent session model only when the auto_model_co_author gate is true &#40;nil default true&#41;; require_model_co_author is still enforced after inference; providerCfg.Model is never attributed.
- [skill-stub-symlink-to-repo.md](skill-stub-symlink-to-repo.md) — The installed using-git-agent skill is a symlink chain into git-agent-cli/skills/, so the repo copy is the single source of truth
- [staged-boundary-is-the-only-split.md](staged-boundary-is-the-only-split.md) — a run commits the index content first and exactly and never infers a region split; multi-region files are reported, and more than three affected files collapse to one bounded warning with per-file detail under `--verbose`
- [staged-boundary-parity-baseline.md](staged-boundary-parity-baseline.md) — e2e/staged_boundary_parity_test.go compares the tree with pinned pre-fix revision 6c58d09 &#40;parent of cdf55b0&#41; in a detached worktree; it skips when that revision is unavailable, so build-check.yml checks out with fetch-depth: 0
