#!/bin/bash

themes="$(cd $HOME/.config/themes && find -mindepth 1 -type d | cut -d '/' -f 2)"
echo $themes

reload() {
    if [[ -z $1 && $1 != "CNCLD" ]]; then
      echo "Usage: theme_set <theme-name>, script must be provided a theme name"
      exit 1
    fi

    THEME_NAME="$1"
    THEMES_DIR="$HOME/.config/themes"
    ACTIVE_DIR="$HOME/.config/themes/active/"
    THEME_PATH="$THEMES_DIR/$THEME_NAME"

    # Check if the theme exists
    if [[ ! -d "$THEME_PATH" ]]; then
      echo "Theme '$THEME_NAME' does not exist in $THEMES_DIR"
      exit 1
    fi

    ln -nsfv "$THEME_PATH" "$ACTIVE_DIR"

    # cp ~/.config/themes/current/swaync.css ~/.config/swaync/
    # cd ~/.config/swaync
    # sed -i '1,21d' style.css
    # sed -i "0r swaync.css" style.css

    swaync-client -rs

    # Change background with theme (should call same wallpaper script)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload ~/.config/themes/active/wallpaper.jpg
    hyprctl hyprpaper wallpaper ",~/.config/themes/active/wallpaper.jpg"

    hyprctl reload
    ~/.config/waybar/launch.sh

    notify-send -u normal -t 3000 -a "Theme Switcher" "New Theme Set: $1"
}

rofi_cmd() {
	rofi -dmenu \
		 -p "$promt" \
		 -mesg "$msg"
}
