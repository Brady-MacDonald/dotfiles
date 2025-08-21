# Dotfiles

Brady MacDonald: Dotfiles worth saving

Archlinux is assumed

- [Install](#Install)
- [Packages](#Packages)
- [Use](#Use)
- [Neovim](#Neovim)

![Skull](screeshots/skull.png)
![VaporWave](screeshots/vapor.png)
![Avatar](screeshots/avatar.png)

## Install

Clone the repo onto your machine and run `./install.sh`

```bash
    git clone https://github.com/Brady-MacDonald/dotfiles.git
    cd dotfiles
    ./install.sh
```

You will be prompted to install the following packages

## Packages

### Required

These packages are directly referenced in dotfiles and will error if not installed

#### Hyprland

Hyprland is the wayland compositor used and dotfiles are built around it

```bash
    sudo pacman -S hyprland hyprpaper hyprlock hypridle
```

- waybar
- nautilus
- tmux
- swaync
- ghostty
- yazi
- zen-browser

- wpctl pactl

## Bluetooth
`sudo pacman -S bluez bluez-utils blueman`
    - Provides the `bluetoothctl` executable
    - Must enable the systemd service `bluetooth.service`
    - `blueman` to provide a GUI

`sudo pacman -S playerctl brightnessctl`

## Networking
`pacman -S networkmanager network-manager-applet`

- qt6-wayland qt5-wayland

Clippy
`pacman -S wl-clipboard`

### Optional

Packages which you will probably end up installing anyway at some point

- jq
- transmission-gtk

#### AUR

`spotify-tui`

Packages installed from the AUR should use yay

- vlc-git
- signal-desktop
- spotify

| Package       | Purpose       |
| ------------- | ------------- |
| hyprland      | Title         |
| yazi          | Text          |

## Use

`./scripts/`
Added to `$PATH`, offer various utilities

## Neovim

Check out the nvim-config repo... got a nice Neovim setup: [nvim-config](https://github.com/Brady-MacDonald/nvim-config.git)
No, I do not want to add it as a submodule.
