export PATH=$HOME/.config/rofi/scripts:$PATH
# Set shell env variables
# Sourced before the .zshrc and all other zsh config files
# $ZDOTDIR set first in /etc/zsh/zshenv

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WORKSPACE="$HOME/workspace"

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

# NPM
# export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
# export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
# export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"

# C
export CC="gcc"
# export CC="clang"

#########################################################
# Path
#########################################################

export PATH=$PATH:/usr/local/go/bin:$HOME/go:$HOME/go/bin
