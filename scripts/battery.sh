#!/bin/bash

warn=25
crit=20
kill=10

delay=2

while true; do
    bat=$(cat /sys/class/power_supply/BAT0/capacity)
    state=$(cat /sys/class/power_supply/BAT0/status)

    if [[ $state == "Charging" ]]; then
        exit 0
    fi

    if [[ $bat -lt $kill ]]; then
        notify-send -u critical "Hyprland crash immeniant" "You have 30sec then your apps get killed fuck face" -a "Battery Warning" -i "battery-low" 
        sleep 30
        if [[ $state != "Charging" ]]; then
            pkill vlc
            pkill zen-bin
        fi
    elif [[ $bat -lt $crit ]]; then
        notify-send -u critical "battery is going to start getting fucked soon" "better do something or hyprland will crash" -a "battery warning" -i "battery" 
    elif [[ $bat -lt $warn ]]; then
        notify-send -u normal "Battery is getting low" "Probable good for now" -a "battery warning" -i "battery" 
    fi

    sleep ${delay}m;
done
