#!/bin/bash

set -uo pipefail

reload() {
    if [[ -z "${1:-}" ]]; then
      exit 0
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

    # Detect wallpaper file by extension
    WALLPAPER=""
    for ext in jpg jpeg png webp; do
      if [[ -f "$THEME_PATH/wallpaper.$ext" ]]; then
        WALLPAPER="$THEME_PATH/wallpaper.$ext"
        break
      fi
    done

    if [[ -z "$WALLPAPER" ]]; then
      echo "Warning: No wallpaper found in $THEME_PATH, skipping wallpaper change"
    else
      hyprctl hyprpaper unload all
      hyprctl hyprpaper preload "$WALLPAPER"
      hyprctl hyprpaper wallpaper ",$WALLPAPER"
    fi

    hyprctl reload
    swaync-client -rs
    ~/.config/waybar/launch.sh

    notify-send -u normal -t 3000 -a "Theme Switcher" -i "${WALLPAPER:-}" "Theme: $THEME_NAME - Excellent choice"
}

rofi_cmd() {
    local current_theme
    current_theme="$(readlink "$HOME/.config/themes/active" 2>/dev/null | xargs basename)" || current_theme="none"
    rofi -dmenu \
         -p "Themes" \
         -mesg "Current: <b>$current_theme</b>" \
         -theme "$HOME/.config/rofi/theme_picker.rasi"
}

mapfile -t themes < <(find -L "$HOME/.config/themes" -mindepth 1 -maxdepth 1 -type d ! -name active -printf '%f\n')
theme="$(printf '%s\n' "${themes[@]}" | rofi_cmd)"
reload "$theme"
