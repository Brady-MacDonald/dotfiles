####################
# Aliases
####################
alias cat="bat"
alias grep="grep --color=auto"
alias sz="source ${ZDOTDIR}/.zshrc && source ${ZDOTDIR}/.zshenv"

alias python="python3"
alias ls="ls --color"
alias ll="ls -alh"

alias tree="tree -L 3"
alias nuke="git reset --hard HEAD && git clean -fd"

alias ..="cd .."
alias ...="cd ../.."

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

alias nconf="cd ${XDG_CONFIG_HOME}/nvim && nvim"
alias nnote="cd ~/notes && nvim"
alias ntmux="nvim ${XDG_CONFIG_HOME}/tmux"
alias nzsh="cd ${ZDOTDIR} && nvim .zshrc"

alias n="nvim \$(find . \( -name node_modules -o -name .git -o -name pkg -o -name .nuget -o -name .cargo \) -prune -o -name '*' -print | fzf-tmux -p)"
alias c="cd \$(find . -type d \( -name node_modules -o -name .git -o -name pkg \) -prune -o -name '*' -type d -print | fzf)"

alias cdp="pushd $@ > /dev/null"
for index ({1..9}) alias "$index"="cd +${index}"; unset index
