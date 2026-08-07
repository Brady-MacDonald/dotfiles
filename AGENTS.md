# AGENTS.md

Arch Linux + Hyprland dotfiles. Not a code project: no build, test, lint, or CI. Verification means applying configs live.

## Layout & live install
- Top-level dirs mirror `~/.config/` exactly. `install.sh` symlinks each of `zsh/`, `hypr/`, `rofi/`, `tmux/`, `waybar/`, `swaync/`, `ghostty/`, `opencode/`, `wallpapers/`, `themes/`, `scripts/` into `$XDG_CONFIG_HOME` and `.gitconfig` -> `~/.gitconfig`. Configs/scripts reference `~/.config/...` paths directly, not relative paths.
- On this machine those symlinks are already live, so editing a file in this repo edits the running config. Verify changes with: `hyprctl reload` (hyprland), `~/.config/waybar/launch.sh` (waybar), `swaync-client -rs` (swaync), `tmux source-file ~/.config/tmux/tmux.conf`.
- `./install.sh` is fully interactive (Y/n prompts) and designed to also run via `curl ... | bash`. Fresh-install gotcha: `zsh/.zshenv` is only loaded if `/etc/zsh/zshenv` already sets `ZDOTDIR=~/.config/zsh`; install.sh does not set this up.

## Theme system (the non-obvious part)
- `themes/active` is a **tracked symlink** to a machine-specific absolute path (`/home/bmacdonald/.config/themes/pinksky`); it is stale on any fresh checkout. `themes/set_theme.sh` repoints it (`ln -nsfv <theme> active`) then reloads hyprpaper, hyprland, swaync, and waybar.
- `waybar/style.css` and `swaync/style.css` start with `@import "../themes/active/{waybar,swaync}.css"` and consume the `@define-color` variables defined there. `hypr/hyprland.conf` also `source`s `~/.config/themes/active/hyprland.conf`.
- A new theme = a dir under `themes/` providing `waybar.css`, `swaync.css`, `wallpaper.jpg` (hyprland.conf optional). Themes are NOT uniform: `themes/skull/` has only `waybar.css` + `wallpaper.png` and breaks swaync/hyprland theming if activated.
- Theme vars are GTK CSS custom properties, not plain color literals; keep using them in style.css instead of hardcoding colors.

## Hyprland
- Both `hypr/hyprland.conf` (classic syntax) and `hypr/hyprland.lua` (new Lua `hl.*` API) are tracked. `hyprland.lua` is the active config (switched in the latest commit); `hyprland.conf` is retained legacy. Keybinds and the theme hook exist in both — keep them in sync or drop the stale one.

## Scripts & shell
- `scripts/` is on `$PATH` via `zsh/.zshenv`; `battery.sh`, `volume.sh`, `wallpaper.sh`, `tray_manager.sh` run as bare commands and are invoked from waybar/hyprland configs via `~/.config/scripts/...`.
- zsh uses zinit + Powerlevel10k with `ZDOTDIR=~/.config/zsh`. `.zcompdump*` and `secrets.env` are gitignored — never commit generated dumps or secrets.

## opencode/
- This repo ships its own opencode config + custom agents (`opencode/agents/bug-fixer.md`, `reviewer.md`) meant to be linked to `~/.config/opencode`. `opencode/opencode.json` is intentionally minimal.

## Misc
- `.gitconfig` becomes the user's live global git config (identity, aliases); editing it affects the whole machine.
- `ghostty/config` loads `config-file = themes` (its palette file).
