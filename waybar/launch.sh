#!/bin/bash

function stop(){
    killall -q waybar

    # wait for process to shut down
    while pgrep -x waybar >/dev/null; do sleep 1; done

    # check for additional monitor
    # if [[ $(xrandr -q | grep "HDMI-1 connected") ]]; then
    # 	polybar external &
    # fi
}

function start(){
    local config=$1

    if [ ! -z $config ]; then
        echo "using config: $config"
        waybar -c $XDG_CONFIG_HOME/waybar/$config &
    else
        echo "using default"
        waybar &
    fi
}

stop
start
