#!/bin/bash

#===============================================================================
#
#                    Brady-MacDonald Install Script
#                clone to your home folder as ~/dotfiles/
#
#==============================================================================

packages=""

pwd=$(pwd)
user=$(whoami)
echo -e "Hello ${user}\n"

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

# Install required packages
prompt "Install wayland/Hyprland?"
val=$?
echo -en "-> ${ORANGE}Hyprland${NC}... "
if [[ $val -eq 0 ]]; then
    echo -e "${GREEN}lets get it${NC}"
    packages+="wayland hyprland hyprpaper hyprlock hypridle "
else
    echo -e "${RED}skipped${NC}"
fi

prompt "Install other required dependecies? (zsh/rofi/waybar ...)"
val=$?
echo -en "-> ${ORANGE}Required packages${NC}... "
if [[ $val -eq 0 ]]; then
    packages+="waybar alacritty rofi-wayland tmux swaync zsh"
    echo -e "${GREEN}lets get it${NC}"
else
    echo -e "${RED}skipped${NC}"
fi

prompt "Install helpful stuff? (bluetooth/brightness/yazi...)"
val=$?
echo -en "-> ${ORANGE}Others${NC}... "
if [[ $val -eq 0 ]]; then
    packages+="bluez bluez-utils yazi playerctl brightnessctl"
    echo -e "${GREEN}lets get it${NC}"
else
    echo -e "${RED}skipped${NC}"
fi

echo \n $packages \n

prompt "Create symbolic links with \$XDG_CONFIG_HOME -> $XDG_CONFIG_HOME?"
val=$?
if [[ $val -eq 0 ]]; then

    ln -sfv $pwd/.gitconfig ~
    ln -sfv $pwd/zsh $XDG_CONFIG_HOME
    ln -sfv $pwd/hypr $XDG_CONFIG_HOME
    ln -sfv $pwd/rofi $XDG_CONFIG_HOME
    ln -sfv $pwd/tmux $XDG_CONFIG_HOME
    ln -sfv $pwd/waybar $XDG_CONFIG_HOME
    ln -sfv $pwd/scripts $XDG_CONFIG_HOME
    ln -sfv $pwd/alacritty $XDG_CONFIG_HOME
    ln -sfv $pwd/wallpapers $XDG_CONFIG_HOME
fi

read -p "Install yay? (Y/n)" links
read -p "Install AUR packages (spotify, signal ...)? (Y/n)" uar
read -p "Install fluff (cava, fastfetch, cmatrix ...)? (Y/n)" fluff
