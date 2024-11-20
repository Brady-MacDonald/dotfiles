#!/bin/bash

#===============================================================================
#
#                NOTES: Brady-MacDonald Install Script
#                repo to your home folder as ~/dotfiles/
#
#==============================================================================

packages=""

user=$(whoami)
echo -e "Hello, ${user}\n"

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' 

function prompt {
    read -p "$1 (Y/n) " response
    if [[ $response == "Y" || $response == "y" || $response == "" ]]; then
        return 0
    else
        return 1
    fi
}
prompt "Install Hyprland?"
val=$?
echo -en "-> ${ORANGE}Hyprland${NC}... "
if [[ $val -eq 0 ]]; then
    echo -e "${GREEN}lets get it${NC}"
    packages+="hyprland hyprpaper hyprlock hypridle "
else
    echo -e "${RED}skipped${NC}"
fi

prompt "Install other dependecies?"
val=$?
echo -en "-> ${ORANGE}Others${NC}... "
if [[ $val -eq 0 ]]; then
    packages+="alacritty rofi-wayland tmux zsh"
    echo -e "${GREEN}lets get it${NC}"
else
    echo -e "${RED}skipped${NC}"
fi

echo $packages


prompt "Create symbolic links with $XDG_CONFIG_HOME?"
if [[ links == "y"]]; then
    ln -sf ~/Brady-MacDonald/dotfiles/.gitconfig ~
    ln -sf ~/Brady-MacDonald/dotfiles/scripts $XDG_CONFIG_HOME
    ln -sf ~/Brady-MacDonald/dotfiles/wallpapers $XDG_CONFIG_HOME
    ln -sf ~/Brady-MacDonald/dotfiles/alacritty ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/waybar ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/dunst ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/rofi ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/tmux ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/hypr ~/.config
    ln -sf ~/Brady-MacDonald/dotfiles/zsh ~/.config
fi

read -p "Install yay? (Y/n)" links
read -p "Install AUR packages (spotify, signal ...)? (Y/n)" uar
read -p "Install fluff (cava, fastfetch, cmatrix ...)? (Y/n)" fluff
