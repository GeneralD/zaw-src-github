#!/usr/bin/env zsh

function zaw-src-ghs() {
    # install ghs if not installed
    if ! which ghs 1>/dev/null; then
        go get github.com/sona-tar/ghs
    fi
    # check user token
    if [[ $ZAW_GITHUB_TOKEN ]]; then
        # token allows more complex accesses
        local l=`ghs -u $ZAW_GITHUB_USER -t $ZAW_GITHUB_TOKEN | awk '{ print $1 }' | sort`
    else
        local l=`ghs -u $ZAW_GITHUB_USER | awk '{ print $1 }' | sort`
    fi
    candidates=(`echo $l`)
    # nerd fonts
    local space=$'\uf116'
    local github=$'\uf09b'
    cand_descriptions=(`echo $l | sed "s/^/$github$space/g"`)

    if which ghq 1>/dev/null; then
        actions=('zaw-src-ghs-ghq')
        act_descriptions=('ghq get')
    fi

    actions+=('zaw-src-ghs-clone' 'zaw-callback-append-to-buffer' 'zaw-callback-replace-buffer')
    act_descriptions+=('git clone' 'append to edit buffer' 'replace edit buffer')

    if [[ ! $ZAW_GITHUB_USER ]]; then
        echo "\033[0;33mDefine ZAW_GITHUB_USER at your zshrc!"
        # clear
        candidates=()
        cand_descriptions=()
    fi
}

function zaw-src-ghs-ghq() {
    BUFFER="ghq get ${(j:; :)@}"
    zle accept-line
}

function zaw-src-ghs-clone() {
    BUFFER="git clone ${(j:; :)@}"
    zle accept-line
}

# zaw-register-src -n ghs zaw-src-ghs
zaw-register-src -n github zaw-src-ghs