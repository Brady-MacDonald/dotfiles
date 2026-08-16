--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
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
