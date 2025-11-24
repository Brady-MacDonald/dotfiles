#!/bin/bash

reload() {
    if [[ -z $1 && $1 != "CNCLD" ]]; then
      echo "Usage: theme_set <theme-name>, script must be provided a theme name"
      exit 1
    fi

    THEME_NAME="$1"
    THEMES_DIR="$HOME/.config/themes"
    ACTIVE_DIR="$HOME/.config/themes/active"
    THEME_PATH="$THEMES_DIR/$THEME_NAME"

    # Check if the theme exists
    if [[ ! -d "$THEME_PATH" ]]; then
      echo "Theme '$THEME_NAME' does not exist in $THEMES_DIR"
      exit 1
    fi

    ln -nsfv "$THEME_PATH" "$ACTIVE_DIR"

    # # Change background with theme (should call same wallpaper script)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload ~/.config/themes/active/wallpaper.jpg
    hyprctl hyprpaper wallpaper ",~/.config/themes/active/wallpaper.jpg"

    hyprctl reload
    swaync-client -rs
    ~/.config/waybar/launch.sh

    notify-send -u normal -t 3000 -a "Theme Switcher" "New Theme Set: $1"
}

rofi_cmd() {
	rofi -dmenu \
		 -p "$promt" \
		 -mesg "$msg"
}

themes="$(cd $HOME/.config/themes && find -mindepth 1 -type d | cut -d '/' -f 2)"
theme="$(for a in $themes; do echo -en "$a\n" ; done | rofi_cmd)"
reload $theme
