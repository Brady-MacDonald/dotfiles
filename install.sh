#!/bin/bash

sudo apt update && sudo apt install i3 feh picom polybar rofi

ln -s ~/dotfiles/alacritty ~/.config
ln -s ~/dotfiles/picom ~/.config
ln -s ~/dotfiles/polybar ~/.config
ln -s ~/dotfiles/rofi ~/.config
ln -s ~/dotfiles/tmux ~/.config
ln -s ~/dotfiles/zsh ~/.config
