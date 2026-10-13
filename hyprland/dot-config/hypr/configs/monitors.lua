-- monitors.lua
-- Monitor configuration

-- local hl = require("hyprland")

-- Main monitor
hl.monitor({
    output = "DP-2",
    mode = "2560x1440@99.95",
    position = "0x0",
    scale = 1.0,
})

-- Secondary monitor
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    position = "auto-left",
    scale = 0.75,
})

-- Fallback rule for additional monitors.
-- An empty output selector corresponds to `monitor=, ...`.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto-right",
    scale = 1.0,
})

-- QEMU/KVM, VirtualBox, or VMware example:
--
-- hl.monitor({
--     output = "Virtual-1",
--     mode = "1920x1080@60",
--     position = "auto",
--     scale = 1.0,
-- })

-- Mirror-main-monitor example:
--
-- hl.monitor({
--     output = "",
--     mode = "preferred",
--     position = "auto",
--     scale = 1.0,
--     mirror = "DP-2",
-- })
