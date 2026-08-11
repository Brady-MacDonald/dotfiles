---------------------
----- MONITORS ------
---------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal     = "ghostty"
local terminalFile = "yazi"
local fileManager  = "dolphin"
local browser      = "zen-browser"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --watch cliphist store")
    hl.exec_cmd("~/.config/scripts/battery.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in          = 2,
        gaps_out         = 4,
        border_size      = 2,
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
        col              = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

    },
    decoration = {
        rounding         = 10,
        rounding_power   = 2,
        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur             = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },
    animations = {
        enabled = true,
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})

-- Default curves and animations
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "ctrl:nocaps",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "ALT + "
local ctlMod = "CONTROL + ALT + "
local shiftMod = "SHIFT + ALT + "

hl.bind(mainMod .. "Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "Q", hl.dsp.window.close())
hl.bind(mainMod .. "F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. "M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

hl.bind(mainMod .. "D", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. "E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "Y", hl.dsp.exec_cmd(terminalFile))
hl.bind(mainMod .. "B", hl.dsp.exec_cmd(browser))

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

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. "SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

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


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name      = "zen-browser-workspace-1",
    workspace = "1",
    match     = { class = "(zen-browser|zen|org.mozilla.Zen)" },
})

hl.window_rule({
    name      = "signal-workspace-7",
    workspace = "7",
    match     = { class = "signal" },
    opacity   = "0.90 0.80",
})

hl.window_rule({
    name      = "spotify-workspace-9",
    workspace = "9",
    match     = { class = "spotify" },
    opacity   = "0.90 0.80",
})

hl.window_rule({
    name  = "qalculate-float",
    match = { title = "^Qalculate!$" },
    size  = "600 600",
    float = true,
})

---------------------
-- THEME OVERRIDE --
---------------------

-- Load the active theme's hyprland override (e.g. ~/.config/themes/pinksky/hyprland.lua).
-- pcall so themes without a hyprland override (e.g. themes/skull) don't break the config.
pcall(require, "~/.config/themes/active/hyprland.lua")
