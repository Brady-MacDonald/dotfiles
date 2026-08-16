----------------------
---- MY PROGRAMS ----
----------------------

-- App shortcuts are globals so other modules (e.g. keybinds) can use them.
terminal     = "ghostty"
terminalFile = "yazi"
fileManager  = "dolphin"
browser      = "zen-browser"

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
