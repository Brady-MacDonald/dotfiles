#!/bin/bash

promt="Themes"
msg="Select $promt"

reload() {
    if [ -z "$1" ]; then
        exit
    fi

    cd ~/.config/swaync
    sed -i '1,21d' style.css
    sed -i "0r $1.css" style.css
    swaync-client -rs

    hyprctl hyprpaper preload ~/.config/wallpapers/forrest.jpg
    hyprctl hyprpaper wallpaper ",~/.config/wallpapers/forrest.jpg"

    notify-send -u normal -t 3000 -a "Theme Switcher" "New Theme Set: $1"
}

rofi_cmd() {
	rofi -dmenu \
		 -p "$promt" \
		 -mesg "$msg"
}

declare -A colors=(["red"]="#FF0000" ["green"]="#00FF00" ["blue"]="#0000FF" ["default"]="#000000")
output=$(for color in "${!colors[@]}"; do
  echo "$color is ${colors[$color]}."
done | rofi_cmd)

reload $output
