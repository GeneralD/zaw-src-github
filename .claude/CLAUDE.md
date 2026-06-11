# zaw-src-github

Zsh plugin providing optional sources for [zaw](https://github.com/zsh-users/zaw)
(incremental-search UI): list your own GitHub repos (`zaw-src-ghs`) and your
starred repos (`zaw-src-starred`), then clone / `ghq get` / browse the selection.

- Language: pure zsh (no build step, no tests)
- Status: legacy plugin (uses deprecated `go get` to auto-install helper CLIs
  `ghs` and `github-list-starred`; relies on `~/.config/hub` for credentials)
- License: Apache-2.0

## Layout

- `zaw-src-github.plugin.zsh` — entry point; sources every `src/*.zsh` after
  verifying zaw is loaded (`zaw-register-src` exists)
- `src/ghs.zsh` — "github" source (own repos via `ghs`)
- `src/starred.zsh` — "github-starred" source (via `github-list-starred`)
- `src/variables.zsh` — `ZAW_GITHUB_USER` / `ZAW_GITHUB_TOKEN` defaults read
  from `~/.config/hub`

## Notes

- Runtime deps: zaw, jq, go, a Nerd Font (sources embed PUA glyphs U+F09B / U+F116)
- No CI, no package manifest; installed via zplug or oh-my-zsh custom plugins
