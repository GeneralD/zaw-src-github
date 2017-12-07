# zaw-src-unity-github

Optional sources of [zaw](https://github.com/zsh-users/zaw) for Github:

- github

It shows list of your repos on Github and clones repo you choose.

- github-starred

It shows list of your favorite repos (starred) on Github and clones repo you choose.

## Installation

If you are using zplug, just add the code below in your .zshrc.

```zsh
zplug "zsh-users/zaw"
zplug "GeneralD/zaw-src-github", on:zsh-users/zaw, defer:2
```

For oh-my-zsh, clone this repo into ~/.oh-my-zsh/custom/plugins and add plugin as below.

```zsh
plugins+=(zaw zaw-src-github)
```

## Customize

If you have a config file ~/.config/hub as below, username and taken will be loaded from it.

```
github.com:
- user: GeneralD
  oauth_token: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  protocol: https
```

Furthermore, you can override if you want.

```zsh
ZAW_GITHUB_USER=GeneralD
ZAW_GITHUB_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Dependencies

- jq
- go

If you are using macOS, you can install with,

```sh
brew install jq
brew install go
```

- any nerd-font

This zaw source shows characters of nerd-font.
You can search compatible font with,

```sh
brew cask search nerd-font
```

Then, install and set any nerd-font to your terminal application.
