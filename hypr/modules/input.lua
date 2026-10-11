---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "de",
    	
        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },

        numlock_by_default = true,

    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
