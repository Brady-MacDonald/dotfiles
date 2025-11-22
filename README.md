# Dotfiles

Brady MacDonald

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

Hyprland is the wayland compositor used
Dotfiles are built around it and its ecosystem
```bash
    sudo pacman -Syu hyprland hyprpaper hyprlock hypridle hyprsunset hyprshot
```

Core Packages


| Package       | Purpose       |
| ------------- | ------------- |
| ghostty | Terminal |
| tmux | Terminal multiplessor |
| waybar | Status bar |
| nautilus | File explorer|
| yazi | Terminal files |
| swaync | Notification Center |
| zen-browser | Browser |


- wpctl pactl

#### Rofi
```bash
    sudo rofi-wayland`
```
Application launcher 

#### Bluetooth
```bash
    sudo pacman -S bluez bluez-utils blueman`
```

[*] Provides the `bluetoothctl` executable
[*] Must enable the systemd service `bluetooth.service`
[*] `blueman` to provide a GUI

```bash
    sudo pacman -S playerctl brightnessctl
```

#### Networking
```bash
    sudo pacman -S networkmanager network-manager-applet
```

#### Themes
- qt6-wayland qt5-wayland
- GTK

### Optional

Packages which you will probably end up installing anyway at some point

```bash
    sudo pacman -S wl-clipboard
```
Exposes the `wl-copy` and `wl-paste` commands

```bash
    sudo pacman -S lazygit lazydocker
```

- jq
- transmission-gtk

### AUR

Packages installed from the AUR should use yay

- vlc-git
- signal-desktop
- spotify


## Use

`./scripts/`
Added to `$PATH`, offer various utilities

## Neovim

Check out the [nvim-config](https://github.com/Brady-MacDonald/nvim-config.git) repo... got a nice Neovim setup
No, I do not want to add it as a submodule.
