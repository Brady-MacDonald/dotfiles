#!/bin/bash

#===============================================================================
#                    Brady-MacDonald Install Script
#===============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

packages=()
DOTFILES_DIR="$HOME/dotfiles"
user=$(whoami)

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$XDG_CONFIG_HOME"

echo -e "Hello ${user}\n"

clone_repo() {
    REPO_URL="https://github.com/Brady-MacDonald/dotfiles.git"

    if [[ ! -d "$DOTFILES_DIR" ]]; then
        git clone "$REPO_URL" "$DOTFILES_DIR" || { echo "failed to clone repo"; exit 1; }
    fi

    cd "$DOTFILES_DIR" || exit 1
}


# ---------------------------------------------------------------------
# PROMPT HELPERS
# ---------------------------------------------------------------------

prompt() {
    read -p "$1 (Y/n) " response
    [[ $response =~ ^(Y|y|)$ ]]
}

header() {
    local title="$1"
    echo -e "\n${ORANGE}================================"
    echo -e "${ORANGE}${title}${NC}"
    echo -e "${ORANGE}================================${NC}"
}

# ---------------------------------------------------------------------
# PACKAGE GROUP FUNCTIONS
# ---------------------------------------------------------------------

install_hyprland_group() {
    if prompt "Install Hyprland?"; then
        packages+=(hyprland hyprpaper hyprlock hypridle hyprsunset hyprshot hyprpicker hyprcursor)
        echo -e "-> ${ORANGE}Hyprland${NC}..."
        echo -e "${GREEN}[+] Added Hyprland packages${NC}\n"
    else
        echo -e "-> ${ORANGE}Hyprland${NC}..."
        echo -e "${RED}[x] Skipping Hyprland${NC}\n"
    fi
}

install_required_group() {
    if prompt "Install required dependencies? (zsh/rofi/waybar ...)"; then
        echo -e "-> ${ORANGE}Required packages${NC}..."
        packages+=(ly ghostty tmux zsh waybar rofi-wayland swaync dolphin)
        echo -e "${GREEN}[+] Added required packages${NC}\n"
    else
        echo -e "-> ${ORANGE}Required packages${NC}..."
        echo -e "${RED}[x] Skipping required packages${NC}\n"
    fi
}

install_optional_group() {
    if prompt "Install helpful stuff? (bluetooth/brightness/yazi...)"; then
        echo -e "-> ${ORANGE}Optional packages${NC}..."
        packages+=(blueman lazygit lazydocker yazi playerctl brightnessctl ttf-jetbrains-mono-nerd noto-fonts-emoji)
        echo -e "${GREEN}[+] Added optional packages${NC}\n"
    else
        echo -e "-> ${ORANGE}Optional packages${NC}..."
        echo -e "${RED}[x] Skipping optional packages${NC}\n"
    fi
}

install_fluff() {
    if prompt "Install fluff (cava, fastfetch, cmatrix ...)?"; then
        echo -e "${GREEN}Installing fluff...${NC}"
        packages+=(cava fastfetch cmatrix signal-desktop)
        echo -e "${GREEN}Fluff installed${NC}\n"
    else
        echo -e "${RED}Skipping fluff${NC}\n"
    fi
}

setup_pipe_wire(){
    sudo pacman -S --needed pipewire pipewire-pulse pipewire-jack wireplumber
    systemctl --user --now enable pipewire pipewire-pulse wireplumber
}

# ---------------------------------------------------------------------
# SYMLINKS
# ---------------------------------------------------------------------

link_file() {
    local src="$1" dst="$2"
    if [[ -L "$dst" ]]; then
        ln -sfv "$src" "$dst"
    elif [[ -e "$dst" ]]; then
        mv -v "$dst" "$dst.bak"
        ln -sfv "$src" "$dst"
    else
        ln -sfv "$src" "$dst"
    fi
}

link_dotfiles() {
    if prompt "Create symbolic links with \$XDG_CONFIG_HOME -> $XDG_CONFIG_HOME?"; then
        echo -e "${GREEN}Linking dotfiles...${NC}"

        link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
        link_file "$DOTFILES_DIR/zsh" "$XDG_CONFIG_HOME/zsh"
        link_file "$DOTFILES_DIR/hypr" "$XDG_CONFIG_HOME/hypr"
        link_file "$DOTFILES_DIR/rofi" "$XDG_CONFIG_HOME/rofi"
        link_file "$DOTFILES_DIR/tmux" "$XDG_CONFIG_HOME/tmux"
        link_file "$DOTFILES_DIR/waybar" "$XDG_CONFIG_HOME/waybar"
        link_file "$DOTFILES_DIR/swaync" "$XDG_CONFIG_HOME/swaync"
        link_file "$DOTFILES_DIR/scripts" "$XDG_CONFIG_HOME/scripts"
        link_file "$DOTFILES_DIR/ghostty" "$XDG_CONFIG_HOME/ghostty"
        link_file "$DOTFILES_DIR/opencode" "$XDG_CONFIG_HOME/opencode"
        link_file "$DOTFILES_DIR/wallpapers" "$XDG_CONFIG_HOME/wallpapers"
        link_file "$DOTFILES_DIR/themes" "$XDG_CONFIG_HOME/themes"

        echo -e "${GREEN}Symlinks created${NC}\n"
    else
        echo -e "${RED}Skipping symlink creation${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# ZSH SETUP
# ---------------------------------------------------------------------

setup_zsh() {
    if prompt "Set up zsh (ZDOTDIR + default shell)?"; then
        if command -v zsh &>/dev/null; then
            echo -e "${GREEN}Configuring zsh...${NC}"
            if ! grep -q 'ZDOTDIR=' /etc/zsh/zshenv 2>/dev/null; then
                echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee -a /etc/zsh/zshenv
            fi
            if [[ "$(basename "$SHELL")" != "zsh" ]]; then
                sudo chsh -s "$(command -v zsh)" "$user"
            fi
            echo -e "${GREEN}zsh configured${NC}\n"
        else
            echo -e "${RED}zsh not installed, skipping${NC}\n"
        fi
    else
        echo -e "${RED}Skipping zsh setup${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# PACKAGE INSTALLATION
# ---------------------------------------------------------------------

pacman_install() {
    if prompt "Install packages now?"; then
        if (( ${#packages[@]} )); then
            echo -e "${GREEN}Installing pacman packages...${NC}"
            sudo pacman -Syu --needed "${packages[@]}"
            echo -e "${GREEN}Pacman packages installed${NC}\n"
        else
            echo -e "${ORANGE}No packages selected, skipping pacman install${NC}\n"
        fi
    else
        echo -e "${RED}Skipped pacman install${NC}\n"
    fi
}

install_yay() {
    if prompt "Install yay?"; then
        if command -v yay &>/dev/null; then
            echo -e "${GREEN}yay already installed, skipping${NC}\n"
        else
            echo -e "${GREEN}Installing yay...${NC}"
            [[ -d yay-bin ]] || git clone https://aur.archlinux.org/yay-bin.git
            (cd yay-bin && makepkg -si --noconfirm)
            echo -e "${GREEN}yay installed${NC}\n"
        fi
    else
        echo -e "${RED}Skipping yay${NC}\n"
    fi
}

install_aur_packages() {
    if prompt "Install AUR packages (spotify, calcure ...)?"; then
        echo -e "${GREEN}Installing AUR packages...${NC}"
        yay -S --needed spotify calcure
        echo -e "${GREEN}AUR packages installed${NC}\n"
    else
        echo -e "${RED}Skipping AUR packages${NC}\n"
    fi
}

# ---------------------------------------------------------------------
# MAIN INSTALL FLOW
# ---------------------------------------------------------------------

main() {
    header "Welcome to the dots"
    clone_repo
    
    header "Install Hyprland"
    install_hyprland_group
    install_required_group
    install_optional_group
    install_fluff

    echo -e "${ORANGE}Collected packages:${NC}"
    printf "%s\n" "${packages[@]}"
    echo

    pacman_install
    link_dotfiles
    setup_zsh

    install_yay
    install_aur_packages

    echo -e "${GREEN}All done!${NC}"
}

main
