#########################################################
# Aliases
#########################################################
alias sz="source ${ZDOTDIR}/.zshrc && source ${ZDOTDIR}/.zshenv"

alias dsa="docker stop $(docker ps -aq) && docker container prune -f && docker volume rm directus_sbr-commercial-content-new"

alias ls="ls --color"
alias ll="ls -al"

alias sql="sqlite3"

alias fsb="${XDG_CONFIG_HOME}/scripts/fsb.sh"

alias lg="lazygit"
alias ld="lazydocker"

alias tnc="tmux new-session -s config"
alias tnw="tmux new-session -s werk"
alias tns="tmux new-session -s sbr"

alias nconf="cd ${XDG_CONFIG_HOME}/nvim && nvim"
alias nnote="cd ~/notes && nvim"
alias ntmux="nvim ${XDG_CONFIG_HOME}/tmux"
alias nzsh="cd ${ZDOTDIR} && nvim .zshrc"

alias nfzf="nvim \$(fzf)"
alias cfzf="cd \$(find . -type d \( -name node_modules -o -name .git \) -prune -o -name '*' -type d   -print | fzf)"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
