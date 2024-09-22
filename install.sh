#!/bin/bash

sudo pacman -S alacritty feh picom polybar rofi dunst tmux zsh

# clip
# wpctl pactl
# nm-applet xss-lock 

ln -sf ~/dotfiles/.gitconfig ~
ln -sf ~/dotfiles/scripts ~/.config
ln -sf ~/dotfiles/wallpapers ~/.config
ln -sf ~/dotfiles/alacritty ~/.config
ln -sf ~/dotfiles/dunst ~/.config
ln -sf ~/dotfiles/i3 ~/.config
ln -sf ~/dotfiles/picom ~/.config
ln -sf ~/dotfiles/polybar ~/.config
ln -sf ~/dotfiles/rofi ~/.config
ln -sf ~/dotfiles/tmux ~/.config
ln -sf ~/dotfiles/zsh ~/.config
