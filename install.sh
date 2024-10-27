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

ln -sf ~/dotfiles/.gitconfig ~
ln -sf ~/dotfiles/scripts ~/.config
ln -sf ~/dotfiles/wallpapers ~/.config
ln -sf ~/dotfiles/alacritty ~/.config
ln -sf ~/dotfiles/waybar ~/.config
ln -sf ~/dotfiles/dunst ~/.config
ln -sf ~/dotfiles/rofi ~/.config
ln -sf ~/dotfiles/tmux ~/.config
ln -sf ~/dotfiles/hypr ~/.config
ln -sf ~/dotfiles/zsh ~/.config
