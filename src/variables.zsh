#!/usr/bin/env zsh

ZAW_GITHUB_USER=${ZAW_GITHUB_USER:-`\cat ~/.config/hub 2>/dev/null | \grep user | \awk '{ print $NF }'`}
ZAW_GITHUB_TOKEN=${ZAW_GITHUB_TOKEN:-`\cat ~/.config/hub 2>/dev/null | \grep oauth_token | \awk '{ print $NF }'`}
