---
name: "auto-model-coauthor-key.md"
description: "auto_model_co_author is a bool key allowed in user/project/local scope with alias auto-model-co-author; Config.AutoModelCoAuthor is *bool (json autoModelCoAuthor,omitempty), nil defaults to on, Resolve takes flags over file, and LoadProjectConfig resolves local over project over user."
type: project
---
`infrastructure/config/keys.go` adds `"auto_model_co_author": {Name: "auto_model_co_author", Type: "bool", AllowUser: true, AllowProject: true, AllowLocal: true}` to `KeyRegistry`.

`KeyAliases` maps `"auto-model-co-author"` to `"auto_model_co_author"`.

`domain/project/config.go` declares on `Config`: `AutoModelCoAuthor *bool `json:"autoModelCoAuthor,omitempty"``, commented "When false, disable automatic model co-author inference from session model (default: true)".

`infrastructure/config/resolver.go` `Resolve` sets `result.AutoModelCoAuthor` from `flags.AutoModelCoAuthor` when non-nil, else from `file.AutoModelCoAuthor` when non-nil, and leaves it nil otherwise; the added comment records "flags take precedence, then file, then nil (default true)".

`infrastructure/config/project.go` declares on `rawProjectConfig`: `AutoModelCoAuthor *bool `yaml:"auto_model_co_author,omitempty"``.

`LoadProjectConfig` resolves the key local > project > user by taking the first non-nil raw pointer (`local`, else `proj`, else `user`).

The `LoadProjectConfig` nil-config guard now also tests `merged.AutoModelCoAuthor == nil`.

`LoadProjectConfig` copies the merged pointer into `cfg.AutoModelCoAuthor` when it is non-nil, so a nil value on the resulting Config means the key was unset at every scope.

Why: per the field comment, setting the key false disables automatic model co-author inference from the session model, while nil keeps the default-on behavior. How to apply: write `auto_model_co_author` (or `auto-model-co-author`) in user, project, or local config; the flag value wins over config, and local config wins over project.