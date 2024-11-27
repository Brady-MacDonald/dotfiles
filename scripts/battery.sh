#!/bin/bash

warn=20
crit=10
delay=2

while true; do
    bat=$(cat /sys/class/power_supply/BAT0/capacity)
    state=$(cat /sys/class/power_supply/BAT0/status)

    if [[ $state == "Charging" ]]; then
        exit 0
    fi

    if [[ $bat -lt $crit ]]; then
        notify-send -u critical "Battery is about to get fucked" "For real do something now or Hyprland will crash" -a "Battery Warning" -i "battery-low" 
    elif [[ $bat -lt $warn ]]; then
        notify-send -u normal "Battery is going to start getting fucked soon" "Idk you should probably do something about it" -a "Battery Warning" -i "battery" 
    fi

    sleep ${delay}m;
done
