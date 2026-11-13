---
name: "session-model-coauthor-inference.md"
description: "In cmd/commit.go the automatic model Co-Authored-By trailer is inferred from the active agent session model only when the auto_model_co_author gate is true (nil default true); require_model_co_author is still enforced after inference; providerCfg.Model is never attributed."
type: project
---
In `cmd/commit.go`, `providerCfg.AutoModelCoAuthor` is folded into `projCfg` (allocating `&project.Config{}` when nil) before the trailers are built.

The inference block's gate is `autoModelCoAuthor := projCfg == nil || projCfg.AutoModelCoAuthor == nil || *projCfg.AutoModelCoAuthor`, commented "Gated by auto_model_co_author (default true); set to false to disable." The block assigns `domains := project.DefaultModelCoAuthorDomains` and appends `commit.InferModelCoAuthor(providerCfg.SessionModel)` to `trailers` only when `autoModelCoAuthor && !commit.HasModelCoAuthor(trailers, domains) && providerCfg.SessionModel != ""` and the call reports ok.

The block is not gated by a `require_*` key; `require_model_co_author` is checked afterwards, failing the commit when `commit.HasModelCoAuthor(trailers, project.DefaultModelCoAuthorDomains)` is false.

The source comment above the block says the trailer is inferred only from the active agent session model (e.g. `PI_MODEL`, `CLAUDE_CODE_MODEL`, `CODEX_MODEL`) and that `providerCfg.Model`, git-agent's own inference model, is strictly for commit drafting/planning and must never be attributed as a co-author.

`infrastructure/config/resolver.go` documents `SessionModel` as the active agent session model used only for Co-Authored-By attribution, assigned from `getSessionModelEnv()`.

`getSessionModelEnv` reads that session model in priority order pi > Claude Code / Anthropic > Codex / OpenAI and is intentionally separate from the inference routing model; its comment says the generic `MODEL` variable is deliberately excluded because shells, CI, and unrelated tooling set it freely.

The config-key contract for `auto_model_co_author` (scopes, kebab alias, pointer semantics, precedence) is described in [[auto-model-coauthor-key]].

Why: the gate lets a user opt out of automatic session-model attribution without disabling the drafting model. How to apply: adjust the gate in the `cmd/commit.go` inference block; the `require_*` keys remain separate conditions enforced after inference, and a false `auto_model_co_author` suppresses only the automatic trailer.
