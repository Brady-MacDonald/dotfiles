#!/bin/bash

id=2345

function volume(){
    if [[ $# -eq 0 ]]; then
        notify-send -u critical -t 2000 "Must provide volume arg"
        return
    fi

    vol=$1
    echo $vol

    if [[ $vol -eq "mute" ]]; then
        notify-send -u low -t 2000 "Volume Muted"
        wpctl set-mute @DEFAULT_SINK@ toggle
    elif [[ $vol -eq "up" ]]; then
        notify-send -u low -t 2000 -i " " "Volume Up"
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    else 
        notify-send -u low -t 2000 -i " " "Volume Down"
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    fi
}

volume "$@"
