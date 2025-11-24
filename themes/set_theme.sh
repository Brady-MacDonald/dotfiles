#!/bin/bash

reload() {
    if [[ -z $1 && $1 != "CNCLD" ]]; then
      echo "Usage: theme_set <theme-name>, script must be provided a theme name"
      exit 1
    fi

    THEMES_DIR="$HOME/.config/themes"
    CURRENT_THEME_DIR="$HOME/.config/themes/active/"

    THEME_NAME=$(echo "$1" | sed -E 's/<[^>]+>//g' | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
    THEME_PATH="$THEMES_DIR/$THEME_NAME"

    # Check if the theme entered exists
    if [[ ! -d "$THEME_PATH" ]]; then
      echo "Theme '$THEME_NAME' does not exist in $THEMES_DIR"
      exit 1
    fi

ln -nsfv "$THEME_PATH" "$CURRENT_THEME_DIR"

    cp ~/.config/themes/current/swaync.css ~/.config/swaync/
    cd ~/.config/swaync
    sed -i '1,21d' style.css
    sed -i "0r swaync.css" style.css
    rm swaync.css

    swaync-client -rs

    # Change background with theme (should call same wallpaper script)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload ~/.config/themes/current/wallpaper.jpg
    hyprctl hyprpaper wallpaper ",~/.config/themes/current/wallpaper.jpg"

    notify-send -u normal -t 3000 -a "Theme Switcher" "New Theme Set: $1"
    hyprctl reload
    # ~/.config/scripts/wallpaper.sh
    # ~/.config/waybar/launch.sh
}

rofi_cmd() {
	rofi -dmenu \
		 -p "$promt" \
		 -mesg "$msg"
}

declare -A colors=(["skull"]=DARK ["vapor_wave"]="#00FF00" ["pinksky"]="#0000FF" ["mountains"]="#000000")
output=$(for color in "${!colors[@]}"; do
  echo "$color is ${colors[$color]}."
done | rofi_cmd)

reload $output
