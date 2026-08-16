---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT + "
local ctlMod = "CONTROL + ALT + "
local shiftMod = "SHIFT + ALT + "

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. "Return", hl.dsp.exec_cmd(Ternimal))
hl.bind(mainMod .. "Q", hl.dsp.window.close())
hl.bind(mainMod .. "F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. "M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. "D", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. "E", hl.dsp.exec_cmd(File_Manager))
hl.bind(mainMod .. "Y", hl.dsp.exec_cmd(Terminal_File))
hl.bind(mainMod .. "B", hl.dsp.exec_cmd(Browser))

hl.bind(mainMod .. "R", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. "G", hl.dsp.exec_cmd("hyprshot -m window"))

hl.bind(mainMod .. "V", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. "N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(shiftMod .. "P", hl.dsp.window.pseudo())
hl.bind(shiftMod .. "W", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))
hl.bind(shiftMod .. "A", hl.dsp.exec_cmd("~/.config/scripts/audio-toggle.sh"))

hl.bind(mainMod .. "L", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "H", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. "up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "down", hl.dsp.focus({ direction = "down" }))

-- Swap window positions
hl.bind(shiftMod .. "H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(shiftMod .. "L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(shiftMod .. "J", hl.dsp.window.swap({ direction = "d" }))
hl.bind(shiftMod .. "K", hl.dsp.window.swap({ direction = "u" }))

-- Resize window
hl.bind(ctlMod .. "L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(ctlMod .. "H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(ctlMod .. "K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(ctlMod .. "J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
hl.bind(ctlMod .. "right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(ctlMod .. "left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(ctlMod .. "up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(ctlMod .. "down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

local menu = "~/.config/rofi/scripts/launcher_t2"
local menu_all = "~/.config/rofi/scripts/launcher_t6"
local menu_power = "~/.config/rofi/scripts/powermenu.sh"
local menu_wallpaper = "~/.config/scripts/wallpaper.sh"
local theme = "~/.config/themes/set_theme.sh"

hl.bind(mainMod .. "Space", hl.dsp.exec_cmd("pkill rofi || " .. menu))
hl.bind(shiftMod .. "Space", hl.dsp.exec_cmd("pkill rofi || " .. menu_all))
hl.bind(ctlMod .. "Space", hl.dsp.exec_cmd("pkill rofi || " .. menu_all))
hl.bind(mainMod .. "P", hl.dsp.exec_cmd("pkill rofi || " .. menu_power))
hl.bind(mainMod .. "W", hl.dsp.exec_cmd("pkill rofi || " .. menu_wallpaper))
hl.bind(mainMod .. "T", hl.dsp.exec_cmd("pkill rofi || " .. theme))
hl.bind(mainMod .. "C",
    hl.dsp.exec_cmd(
        "pkill rofi || cliphist list | rofi -dmenu -p \"Clippy\" -theme ~/.config/rofi/clippy.rasi | cliphist decode | wl-copy"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. "S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. "SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
