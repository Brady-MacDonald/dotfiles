#!/bin/bash

warn=25
crit=20
kill=10

delay=2

capacity_file=/sys/class/power_supply/BAT0/capacity
status_file=/sys/class/power_supply/BAT0/status

# File does not exist on desktop
if [[ ! -f $capacity_file ]]; then
    exit 0
fi

while true; do
    bat=$(cat $capacity_file)
    state=$(cat $status_file)

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
