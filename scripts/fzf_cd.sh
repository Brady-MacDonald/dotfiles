# cd into any directory using fzf
# Defaults to XDG_CONFIG_HOME
# Must source file so it is not ran in subshell 

target_dir=$XDG_CONFIG_HOME
if [ ! -z $1 ]; then
    if [ -d $1 ];then
        target_dir=$1
    else
        echo "Directory does not exist"
        return 1
    fi
fi

dir=$( cd $target_dir &&
    find -L . -maxdepth 1 -type d | 
    cut -d '/' -f 2 | 
    fzf-tmux -p
)

cd $target_dir/$dir
