#!/bin/bash

function preload_wallpaper() {
    local monitor="eDP-1"
    local wallpaper_dir="$HOME/.config/wallpapers/"

    local wallpapers=$(find "$wallpaper_dir" -type f | sort -R)

    local wallpaper=$(echo ${wallpapers} | cut -d ' ' -f1)
    if [ ! -f $wallpaper ]; then
        # the [ ] is an alias for the test command
        # The logical output is then negated
        echo "File found ${wallpaper}"
        exit 1
    fi

    echo "Setting as baclground $wallpaper"
    notify-send -u low -t 2000 "Wallpaper" "Setting wallpaper to $wallpaper"

}

preload_wallpaper
