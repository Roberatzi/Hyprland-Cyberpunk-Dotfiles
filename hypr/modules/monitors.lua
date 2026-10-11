------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DVI-D-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "auto",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = "auto",
})

hl.config({
    cursor = {
        no_hardware_cursors = 1,
    },
})

hl.workspace_rule({ workspace = 1, monitor = "DVI-D-1", persistent = true })
hl.workspace_rule({ workspace = 2, monitor = "DVI-D-1", persistent = true })
hl.workspace_rule({ workspace = 3, monitor = "DVI-D-1", persistent = true })
hl.workspace_rule({ workspace = 4, monitor = "DVI-D-1", persistent = true })
hl.workspace_rule({ workspace = 5, monitor = "DVI-D-1", persistent = true })

hl.workspace_rule({ workspace = 6, monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = 7, monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = 8, monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = 9, monitor = "HDMI-A-1", persistent = true })
hl.workspace_rule({ workspace = 10, monitor = "HDMI-A-1", persistent = true })




