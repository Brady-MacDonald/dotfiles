#!/bin/bash

preload_wallpaper() {
    monitor="eDP-1"
    wallpaper_dir="$HOME/.config/wallpapers/"
    wallpapers=$(find "$wallpaper_dir" -type f | sort -R )

    for wallpaper in $wallpapers; do
        preload_string+="preload = "$wallpaper"\n"
        wallpaper_string+="wallpaper = $monitor, $wallpaper\n"
    done

    echo -en "$preload_string\n$wallpaper_string\n" > ~/.config/hypr/hyprpaper.conf
}

preload_wallpaper

