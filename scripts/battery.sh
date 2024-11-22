#!/bin/bash

bat=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

warn=20
crit=10

delay=2

while true; do
    if [[ $state == "Charging" ]]; then
        exit 0;
    fi

    if [[ $bat -lt $crit ]]; then
        notify-send -u critical "Battery is discharging: $bat%" "Fucking do something about it"
    elif [[ $bat -lt $warn ]]; then
        notify-send -u normal "Battery is at: $bat%" "Idk you should probably do something about it"
    fi

    sleep ${delay}m;
done
