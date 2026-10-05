-- animations taken from KoolDots project https://github.com/LinuxBeginnings

-- animations.lua

local hl = require("hyprland")

-- Custom Bézier curves
hl.curve("wind", {
    type = "bezier",
    points = {
        { 0.05, 0.90 },
        { 0.10, 1.05 },
    },
})

hl.curve("winIn", {
    type = "bezier",
    points = {
        { 0.10, 1.10 },
        { 0.10, 1.10 },
    },
})

hl.curve("winOut", {
    type = "bezier",
    points = {
        { 0.30, -0.30 },
        { 0.00, 1.00 },
    },
})

hl.curve("liner", {
    type = "bezier",
    points = {
        { 1.00, 1.00 },
        { 1.00, 1.00 },
    },
})

hl.curve("overshot", {
    type = "bezier",
    points = {
        { 0.05, 0.90 },
        { 0.10, 1.05 },
    },
})

hl.curve("smoothOut", {
    type = "bezier",
    points = {
        { 0.50, 0.00 },
        { 0.99, 0.99 },
    },
})

hl.curve("smoothIn", {
    type = "bezier",
    points = {
        { 0.50, -0.50 },
        { 0.68, 1.50 },
    },
})

-- Animations
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 6,
    bezier = "wind",
    style = "slide",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "winIn",
    style = "slide",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
    style = "slide",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 5,
    bezier = "wind",
    style = "slide",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 1,
    bezier = "liner",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 3,
    bezier = "smoothOut",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "overshot",
})

hl.animation({
    leaf = "workspacesIn",
    enabled = true,
    speed = 5,
    bezier = "winIn",
    style = "slide",
})

hl.animation({
    leaf = "workspacesOut",
    enabled = true,
    speed = 5,
    bezier = "winOut",
    style = "slide",
})
