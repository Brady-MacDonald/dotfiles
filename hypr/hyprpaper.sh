set_wallpaper() {
    # monitor="eDP-1"
    monitor=""
    wallpaper_dir="$HOME/.config/wallpapers"
    files=($wallpaper_dir/*)
    random_file=("${files[RANDOM % ${#files[@]}]}")

    hyprctl notify 1 5000 0 "Setting wallpaper to $random_file"
    # hyprctl hyprpaper 
    hyprctl hyprpaper wallpaper "$monitor,$random_file"
}

