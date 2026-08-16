----------------
---- INPUT ----
----------------

hl.config({
    input = {
        kb_layout    = "us",
        kb_options   = "ctrl:nocaps",
        follow_mouse = 1,
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
