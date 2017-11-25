#!/usr/bin/env zsh

function zaw-src-starred() {
    # install github-list-starred if not installed
    if ! which github-list-starred 1>/dev/null; then
        go get github.com/motemen/github-list-starred
    fi

    candidates=(`github-list-starred $ZAW_GITHUB_USER 2>/dev/null | grep https://`)
    if which map 1>/dev/null; then # <- zsh-functional plugin is required
        # nerd fonts
        local space=$'\uf116'
        local github=$'\uf09b'
        cand_descriptions=(`map '${1:gs/https:\/\/github.com\//${github}${space}}' $candidates`)
    fi

    if which ghq 1>/dev/null; then
        actions=('zaw-src-starred-ghq')
        act_descriptions=('ghq get')
    fi

    actions+=('zaw-src-starred-clone' 'zaw-callback-append-to-buffer' 'zaw-callback-replace-buffer')
    act_descriptions+=('git clone' 'append to edit buffer' 'replace edit buffer')

    if [[ ! $ZAW_GITHUB_USER ]]; then
        echo "\033[0;33mDefine ZAW_GITHUB_USER at your zshrc!"
        # clear
        candidates=()
        cand_descriptions=()
    fi
}

function zaw-src-starred-ghq() {
    BUFFER="ghq get ${(j:; :)@}"
    zle accept-line
}

function zaw-src-starred-clone() {
    BUFFER="git clone ${(j:; :)@}"
    zle accept-line
}

zaw-register-src -n github-starred zaw-src-starred