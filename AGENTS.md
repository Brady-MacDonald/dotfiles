# AGENTS.md

Arch Linux + Hyprland dotfiles. Not a code project: no build, test, lint, or CI. Verification means applying configs live.

## Layout & live install
- Top-level dirs mirror `~/.config/` exactly. `install.sh` symlinks each of `zsh/`, `hypr/`, `rofi/`, `tmux/`, `waybar/`, `swaync/`, `ghostty/`, `opencode/`, `wallpapers/`, `themes/`, `scripts/` into `$XDG_CONFIG_HOME` and `.gitconfig` -> `~/.gitconfig`. Configs/scripts reference `~/.config/...` paths directly, not relative paths.
- On this machine those symlinks are already live, so editing a file in this repo edits the running config. Verify changes with: `hyprctl reload` (hyprland), `~/.config/waybar/launch.sh` (waybar), `swaync-client -rs` (swaync), `tmux source-file ~/.config/tmux/tmux.conf`.
- `./install.sh` is fully interactive (Y/n prompts) and designed to also run via `curl ... | bash`. Fresh installs are handled by `install.sh`'s `setup_zsh` step, which appends `export ZDOTDIR="$HOME/.config/zsh"` to `/etc/zsh/zshenv` (if not present) and sets zsh as the login shell via `sudo chsh`.

## Theme system (the non-obvious part)
- `themes/active` is an **untracked, gitignored symlink** to an absolute path (`~/.config/themes/pinksky` by default); `install.sh` creates it if missing. `themes/set_theme.sh` repoints it (`ln -nsfv <theme> active`) then reloads hyprpaper, hyprland, swaync, and waybar.
- `waybar/style.css` and `swaync/style.css` start with `@import "../themes/active/{waybar,swaync}.css"` and consume the `@define-color` variables defined there. `hypr/hyprland.lua` also hooks the theme at the bottom via `pcall(dofile, "~/.config/themes/active/hyprland.lua")` (`dofile`, not `require`, so symlink changes are re-read on reload).
- A new theme = a dir under `themes/` providing `waybar.css`, `swaync.css`, `wallpaper.jpg` (hyprland.lua optional). Themes are NOT uniform: `themes/skull/` has only `waybar.css` + `wallpaper.png` and breaks swaync/hyprland theming if activated.
- Theme vars are GTK CSS custom properties, not plain color literals; keep using them in style.css instead of hardcoding colors.

## Hyprland
- Both `hypr/hyprland.conf` (classic syntax) and `hypr/hyprland.lua` (new Lua `hl.*` API) are tracked. `hyprland.lua` is the active config (switched in the latest commit); `hyprland.conf` is retained legacy. Keybinds and the theme hook exist in both — keep them in sync or drop the stale one.

## Scripts & shell
- `scripts/` is on `$PATH` via `zsh/.zshenv`; `battery.sh`, `volume.sh`, `wallpaper.sh`, `tray_manager.sh` run as bare commands and are invoked from waybar/hyprland configs via `~/.config/scripts/...`.
- zsh uses zinit + Powerlevel10k with `ZDOTDIR=~/.config/zsh`. `.zcompdump*` and `secrets.env` are gitignored — never commit generated dumps or secrets.

## opencode/
- `opencode/` is symlinked to `~/.config/opencode` like the other config dirs. `opencode/opencode.jsonc` is the real global config (model, provider, MCP servers); `opencode/tui.json` sets the TUI theme; custom agents live in `opencode/agents/`.
- `package.json`/`package-lock.json`/`node_modules` (plugin deps) and `data/` are gitignored but must exist in the dir (they do on this machine). No opencode restart needed for config edits to be seen by new sessions.

## Misc
- `.gitconfig` becomes the user's live global git config (identity, aliases); editing it affects the whole machine.
- `ghostty/config` loads `config-file = themes` (its palette file).
