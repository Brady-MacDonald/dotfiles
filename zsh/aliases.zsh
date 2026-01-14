####################
# Aliases
####################

alias sz="source ${ZDOTDIR}/.zshrc && source ${ZDOTDIR}/.zshenv"

alias cat="bat"
alias python="python3"
alias tree="tree -L 3"
alias grep="grep --color=auto"
alias df="df --human-readable"
alias du="du --human-readable"

alias ll="ls -alh"
alias ls="ls --color"
alias lsusb="ls -l /dev/disk/by-id/usb-*"

alias ussh="${XDG_CONFIG_HOME}/scripts/update_ssh.sh"

alias cdc="source ${XDG_CONFIG_HOME}/scripts/fzf_cd.sh"
alias cdb="source ${XDG_CONFIG_HOME}/scripts/fzf_cd.sh ${BRADY_MACDONALD_HOME}"
alias cdd="source ${XDG_CONFIG_HOME}/scripts/fzf_cd.sh ${BRADY_MACDONALD_HOME}/dotfiles"
alias cdw="source ${XDG_CONFIG_HOME}/scripts/fzf_cd.sh ~/nssmp/repos/"

alias fgb="${XDG_CONFIG_HOME}/scripts/fgb.sh" # Fuzzy Git Branch
alias fgc="${XDG_CONFIG_HOME}/scripts/fshow.sh" # Fuzzy Git Commits

alias y="yazi"
alias lg="lazygit"
alias ld="lazydocker"

alias tnc="tmux new-session -s config"
alias tns="tmux new-session -s nssmp"

alias n="nvim \$(find . \( -name node_modules -o -name .git -o -name pkg -o -name .nuget -o -name .cargo \) -prune -o -name '*' -print | fzf-tmux -p)"
alias c="cd \$(find . -type d \( -name node_modules -o -name .git -o -name pkg \) -prune -o -name '*' -type d -print | fzf)"
