# Dotfiles

Brady MacDonald: Dotfiles worth saving

## Table of Contents

- [Install](#Install)
- [Packages](#Packages)
- [Use](#Use)
- [Neovim](#Neovim)

## Install
---

Clone the repo onto your machine
Run install script

```bash
    git clone https://github.com/Brady-MacDonald/dotfiles.git
    cd dotfiles
    ./install.sh
```

You will be prompted to install the following packages

## Packages
---

### Hyprland

Wayland compositor
- hyprland hyprpaper hyprlock hypridle

Required packages
- waybar
- alacritty
- yazi
- zen-browser

- wpctl pactl
- bluez bluez-utils
- playerctl
- clip
- nm-applet 
- qt6-wayland qt5-wayland

### AUR

Packages installed from the AUR should use yay

- vlc-git
- signal
- spotify

| Package       | Purpose       |
| ------------- | ------------- |
| hyprland      | Title       |
| yazi   | Text        |

## Use
---

`./scripts/`
Added to `$PATH`, offer various utilities

## Neovim
---

Check out the nvim-config repo got the Neovim setup: [nvim-config](https://github.com/Brady-MacDonald/nvim-config.git)
No, I do not want to add it as a submodule...
