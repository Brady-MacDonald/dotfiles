# Arch Linux Dotfiles

Check out the [Blog Post](https://bradymacdonald.com/blog/dotfiles) for more details

- [Install](#Install)
- [Packages](#Packages)
    - [Required](#Required)
    - [Optional](#Optional)
    - [AUR](#AUR)
- [Use](#Use)
- [Neovim](#Neovim)

## Install

### Curl install script

Curl the install script 
It will clone repo onto your machine and other installation prompts

```bash
curl -fsSL https://raw.github.com/Brady-MacDonald/dotfiles/main/install.sh | bash

```
### Clone Repo 

Manually clone repo and run install script

```bash
git clone https://github.com/Brady-MacDonald/dotfiles.git
cd dotfiles
./install.sh
```

![Skull](screeshots/skull.png)
![VaporWave](screeshots/vapor.png)
![Avatar](screeshots/avatar.png)

## Packages

### Required

Packages directly referenced in dotfiles and will error if not installed

| Package       | Purpose                |
| ------------- | ------------- |
| hyprland | Wayland compositor |
| ly | Display Manager |
| ghostty | Terminal |
| tmux | Terminal multiplessor |
| zsh | Shell |
| waybar | Status bar |
| dolphin | File explorer|
| yazi | Terminal files |
| swaync | Notification Center |
| Nerd Fonts | Terminal and system fonts |


#### Hyprland

Hyprland is the wayland compositor used
Dotfiles are built around it and its ecosystem

```bash
sudo pacman -Syu hyprland hyprpaper hyprlock hypridle hyprsunset hyprshot hyprpicker hyprcursor
```

#### Display Manager

Ly is used as the DM
Minimal TUI login screen

```bash
sudo pacman -S ly
systemctl enable ly.service
``` 

#### Terminal
Ghostty / zsh / tmux for terminal setup

```bash
sudo pacman -S ghostty tmux zsh
``` 

#### DE Info

```bash
sudo pacman -S waybar swaync
``` 

#### Bluetooth

```bash
sudo pacman -S blueman`
```

- Provides:
    - `bluetooth.service` Must enable the systemd service 
    - `blueman-manager` provides a GTK based GUI

```bash
sudo pacman -S playerctl brightnessctl
```

#### Networking

```bash
sudo pacman -S networkmanager network-manager-applet
```

#### Audio

Pipewire is used as the audio server
Wireplumber as Session manager: `wpctl`

```bash
sudo pacman -S pipewire pipewire-pulse pipewire-jack wireplumber
systemctl --user --now enable pipewire pipewire-pulse wireplumber
```

#### Themes

Prefer to use qt GUI apps when possible
(transmission-qt, dolphin ...)

```bash
sudo pacman -S qt6ct nwg-look
```

- `qt6ct` used to control the theme of transmission and qalculate 
- `nwg-look` Used for themeing GTK apps (blueman)

#### Application Launcher

Rofi is used as the dmenu replacement

```bash
sudo pacman -S rofi
```

---

### Optional

Packages which you will probably end up installing anyway at some point

| Package       | Purpose                |
| ------------- | ------------- |
| Lazygit / Lazygit | TUI |
| ncdu | NCurses Disk Usage |
| transmission-qt | BitTorrent client |
| qalculate-qt | Calculator |
| cava | Music visual |
| wl-clipboard | Wayland clippy |

```bash
sudo pacman -S lazygit lazydocker ncdu transmission-qt qalculate-qt
```

```bash
sudo pacman -S wl-clipboard cliphist
```
Exposes the `wl-copy` and `wl-paste` commands
cliphist: Clipboard history manager for wayland

### AUR
Packages installed from the AUR 
Installing from AUR should be done using [yay](https://github.com/Jguer/yay)


| Package | Purpose |
| ------------- | ------------- |
| zen-browser-bin | Browser |
| spotify | Muse |
| signal-desktop | Messaging |
| vlc-git | Becuase the normal repo does not work with wayland |
| spotify-terminal | TUI spotify |
| spicetify-cli | Gotta make spotify look nice |
| spicetify-themes-git | With plenty of themes |
```bash
yay -Syu zen-browser-bin spotify signal-desktop vlc-git
yay -Syu spicetify-cli spicetify-themes-git
```

`spicetify config current_theme Dreary color_scheme Graytone-Blue `

## Use
`./scripts/`
Added to `$PATH`, offer various utilities

## Neovim

Check out the [nvim-config](https://github.com/Brady-MacDonald/nvim-config.git) repo... got a nice Neovim setup
No, I do not want to add it as a submodule.
