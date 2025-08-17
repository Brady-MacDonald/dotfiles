#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-6"
theme='style-1'

wallpaper="$HOME/.config/wallpapers"
papers="$(cd $HOME/.config/wallpapers && find -type f | cut -d '/' -f 2)"

promt="Wallpapers"
msg="Select $promt"

rofi_cmd() {
	rofi -dmenu \
		 -p "$promt" \
		 -mesg "$msg" \
		 -theme ${dir}/${theme}.rasi
}

set_wallpaper() {
    new_paper="$wallpaper/$1"
    notify-send -u normal -t 3000 -a "Wallpaper Updated" -i $new_paper "Updated Wallpaper" "$1 - Excellent choice"
    hyprctl hyprpaper preload $new_paper
    hyprctl hyprpaper wallpaper ",$new_paper"
    loaded=$(hyprctl hyprpaper listloaded)
}

paper="$(echo -e "$papers" | rofi_cmd)"
if [[ -n $paper ]]; then
    set_wallpaper $paper
fi
