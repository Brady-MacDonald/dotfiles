#!/bin/bash

# Fuzzy Git Branch (local and remote branches)
# Open in a tmux window
function fgb() {
    local pattern=$*
    local branches branch

    RED='\033[0;31m'
    NC='\033[0m' 
       
    branches=$(git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
    branch=$(echo "$branches" |
            fzf-tmux -p --reverse -1 -0 +m) &&
    if [ -z $branch ]; then
        echo "[$0] ... No branch matches the provided pattern"; return;
    fi

    if [ "$branch" = "" ]; then
        echo -e "${RED}Not checking out branch${NC}"
        echo "[$branch] No branch matches the provided pattern"; return;
        return 
    fi;

    git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
}

fgb "$@"
