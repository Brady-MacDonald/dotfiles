#!/bin/bash

sudo pacman -Syu alacritty rofi-wayland tmux zsh

# hyprland hyprpaper hyprlock hypridle

# waybar
# wpctl pactl
# bluez bluez-utils
# playerctl
# clip
# nm-applet 
# qt6-wayland qt5-wayland

# AUR
# vlc-git signal

ln -sf ~/Brady-MacDonald/dotfiles/.gitconfig ~
ln -sf ~/Brady-MacDonald/dotfiles/scripts ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/wallpapers ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/alacritty ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/waybar ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/dunst ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/rofi ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/tmux ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/hypr ~/.config
ln -sf ~/Brady-MacDonald/dotfiles/zsh ~/.config
