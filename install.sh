#!/bin/bash

#===============================================================================
#                    Brady-MacDonald Install Script
#                clone to your home folder as ~/dotfiles/
#===============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

# Globals
packages=()
pwd=$(pwd)
user=$(whoami)
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$XDG_CONFIG_HOME"

echo -e "Hello ${user}\n"

# Prompt helper
prompt() {
    read -p "$1 (Y/n) " response
    [[ $response =~ ^(Y|y|)$ ]]
}

# ---------------------------------------------------------------------
# PACKAGE GROUP FUNCTIONS
# ---------------------------------------------------------------------

install_hyprland_group() {
    if prompt "Install Hyprland?"; then
        echo -e "-> ${ORANGE}Hyprland${NC}..."
        packages+=(
            hyprland hyprpaper hyprlock hypridle hyprsunset
            hyprshot hyprpicker hyprcursor
        )
        echo -e "${GREEN}Added Hyprland packages${NC}\n"
    else
        echo -e "${RED}Skipping Hyprland${NC}\n"
    fi
}

install_required_group() {
    if prompt "Install required dependencies? (zsh/rofi/waybar ...)"; then
        echo -e "-> ${ORANGE}Required packages${NC}..."
        packages+=(ly ghostty tmux zsh waybar rofi-wayland swaync dolphin)
        echo -e "${GREEN}Added required packages${NC}\n"
    else
        echo -e "${RED}Skipping required packages${NC}\n"
    fi
}

install_optional_group() {
    if prompt "Install helpful stuff? (bluetooth/brightness/yazi...)"; then
        echo -e "-> ${ORANGE}Optional packages${NC}..."
        packages+=(
            bluez bluez-utils blueman
            lazygit lazydocker
            yazi playerctl brightnessctl
        )
        echo -e "${GREEN}Added optional packages${NC}\n"
    else
        echo -e "${RED}Skipping optional packages${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# SYMLINKS
# ---------------------------------------------------------------------

link_dotfiles() {
    if prompt "Create symbolic links with \$XDG_CONFIG_HOME -> $XDG_CONFIG_HOME?"; then
        echo -e "${GREEN}Linking dotfiles...${NC}"

        ln -sfv "$pwd/.gitconfig" ~
        ln -sfv "$pwd/zsh" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/hypr" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/rofi" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/tmux" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/waybar" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/swaync" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/scripts" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/ghostty" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/wallpapers" "$XDG_CONFIG_HOME"
        ln -sfv "$pwd/themes" "$XDG_CONFIG_HOME"

        echo -e "${GREEN}Symlinks created${NC}\n"
    else
        echo -e "${RED}Skipping symlink creation${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# PACKAGE INSTALLATION
# ---------------------------------------------------------------------

pacman_install() {
    if prompt "Install all pacman packages now?"; then
        echo -e "${GREEN}Installing pacman packages...${NC}"
        sudo pacman -S --needed "${packages[@]}"
        echo -e "${GREEN}Pacman packages installed${NC}\n"
    else
        echo -e "${RED}Skipped pacman install${NC}\n"
    fi
}

install_yay() {
    if prompt "Install yay?"; then
        echo -e "${GREEN}Installing yay...${NC}"
        git clone https://aur.archlinux.org/yay-bin.git
        cd yay-bin && makepkg -si --noconfirm && cd ..
        echo -e "${GREEN}yay installed${NC}\n"
    else
        echo -e "${RED}Skipping yay${NC}\n"
    fi
}

install_aur_packages() {
    if prompt "Install AUR packages (spotify, signal ...)?"; then
        echo -e "${GREEN}Installing AUR packages...${NC}"
        yay -S spotify signal-desktop
        echo -e "${GREEN}AUR packages installed${NC}\n"
    else
        echo -e "${RED}Skipping AUR packages${NC}\n"
    fi
}

install_fluff() {
    if prompt "Install fluff (cava, fastfetch, cmatrix ...)?"; then
        echo -e "${GREEN}Installing fluff...${NC}"
        yay -S cava fastfetch cmatrix
        echo -e "${GREEN}Fluff installed${NC}\n"
    else
        echo -e "${RED}Skipping fluff${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# MAIN INSTALL FLOW
# ---------------------------------------------------------------------

main() {
    install_hyprland_group
    install_required_group
    install_optional_group

    echo -e "${ORANGE}Collected packages:${NC}"
    printf "%s\n" "${packages[@]}"
    echo

    link_dotfiles

    pacman_install
    install_yay
    install_aur_packages
    install_fluff

    echo -e "${GREEN}All done!${NC}"
}

main
