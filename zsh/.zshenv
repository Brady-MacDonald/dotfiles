# Sourced before the .zshrc and all other zsh config files
# $ZDOTDIR set first in /etc/zsh/zshenv

export BRADY_MACDONALD_HOME="$HOME/Brady-MacDonald"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

#########################################################
# ZSH
#########################################################

export HISTSIZE=10000                   
export SAVEHIST=10000

export EDITOR="nvim"
export VISUAL="nvim"

# Go
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# C
export CC="gcc"

#########################################################
# Path
#########################################################

export PATH=$PATH:/usr/local/go/bin:$HOME/go:$HOME/go/bin
export PATH=$PATH:${XDG_CONFIG_HOME}/scripts/
export PATH=$PATH:${HOME}/.local/bin/
export PATH=$PATH:${HOME}/.spicetify
