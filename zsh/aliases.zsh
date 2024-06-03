#########################################################
# Aliases
#########################################################
alias vim="nvim"
alias dsa="docker container prune -f"

alias cl="cat logs | jq '.'"
alias sl="source info.sh;"

alias ls="ls --color"
alias ll="ls -al"

alias sql="sqlite3"

alias fsb= "${XDG_CONFIG_HOME}/scripts/fsb.sh"

alias lg="lazygit"
alias ld="lazydocker"
alias sz="source ${ZDOTDIR}/.zshrc && source ${ZDOTDIR}/.zshenv"

alias tnc="tmux new-session -s config"
alias tnw="tmux new-session -s werk"
alias tns="tmux new-session -s sbr"
alias tls="tmux ls"
alias ta="tmux attach"

alias nnote="cd ~/notes && vim ."
alias nzsh="cd ${ZDOTDIR} && vim ."
alias nconf="cd ${XDG_CONFIG_HOME}/nvim && vim ."
alias ntmux="cd ${XDG_CONFIG_HOME}/tmux && vim ."
alias npoly="cd ${XDG_CONFIG_HOME}/polybar && vim ."
alias nrofi="cd ${XDG_CONFIG_HOME}/rofi && vim ."
alias nii="cd ${XDG_CONFIG_HOME}/i3 && vim ."
alias vimc="vim ~/.vimrc"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
