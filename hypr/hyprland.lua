-- Main Hyprland Lua configuration.
-- Split into modules under modules/; each require() is its own Lua scope, so
-- an error in one module won't stop the rest of the config from loading.

require("modules.monitors")
require("modules.apps")
require("modules.env")
require("modules.look-and-feel")
require("modules.input")
require("modules.keybinds")
require("modules.window-rules")

----------------------
-- THEME OVERRIDE --
----------------------

-- Load the active theme's hyprland override (e.g. ~/.config/themes/pinksky/hyprland.lua).
-- Use dofile() instead of require() so the file is re-read on every reload
-- (require() caches the module and won't pick up symlink changes).
pcall(dofile, "~/.config/themes/active/hyprland.lua")
