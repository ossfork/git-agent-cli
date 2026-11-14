---
name: "require-coauthor-flags.md"
description: "require_git_agent_co_author appends Co-Authored-By: Git Agent <noreply@git-agent.dev> only when true; require_model_co_author does not add a trailer in cmd/commit.go and instead fails the commit with exit code 1 when no allow-listed model co-author is present."
type: project
---
`infrastructure/config/keys.go` registers `require_git_agent_co_author` and `require_model_co_author` as `bool` keys with `AllowUser`, `AllowProject` and `AllowLocal` true, and maps the dashed spellings `require-git-agent-co-author` / `require-model-co-author` onto those snake_case names.

`domain/project/config.go` documents `RequireGitAgentCoAuthor` (`json:"requireGitAgentCoAuthor"`) as appending a Co-Authored-By: Git Agent trailer when true, and `RequireModelCoAuthor` (`json:"requireModelCoAuthor"`) as requiring every commit to carry a Co-Authored-By from a built-in AI-provider domain.

`cmd/commit.go` loads `projCfg` with `infraConfig.LoadProjectConfig(root, userConfigPath())` and folds `providerCfg.RequireGitAgentCoAuthor` / `providerCfg.RequireModelCoAuthor` into it (allocating `&project.Config{}` when nil) because the hook executor reads policy off `projCfg`.

`Co-Authored-By: Git Agent <noreply@git-agent.dev>` is appended only when `projCfg != nil && projCfg.RequireGitAgentCoAuthor`.

In `cmd/commit.go`, when `projCfg != nil && projCfg.RequireModelCoAuthor` and no trailer matches `project.DefaultModelCoAuthorDomains`, the command returns `agentErrors.NewExitCodeError(1, ...)` asking for `--co-author` with an allow-listed email or `--co-author "Ox Alpha"`.

`project.DefaultModelCoAuthorDomains` is documented as the built-in allow-list of email domains that count as a "model" co-author for `RequireModelCoAuthor` enforcement.

Why: these keys separate appending an attribution from enforcing one. How to apply: `require_model_co_author` does not add the automatic model trailer (that comes from session-model inference, see [[session-model-coauthor-inference]]); `require_git_agent_co_author` controls only the Git Agent trailer appended in `cmd/commit.go`.