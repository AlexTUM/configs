-- decorations.lua
-- Decoration and color configuration

-- local hl = require("hyprland")

local home = os.getenv("HOME") or ""
local hypr_dir = home .. "/.config/hypr"

package.path = table.concat({
    hypr_dir .. "/?.lua",
    hypr_dir .. "/?/init.lua",
    package.path,
}, ";")

local colors = require("themes.catppuccin-macchiato")
local active = colors.mauve
local inactive = colors.lavender

hl.config({
    general = {
        border_size = 2,
        gaps_in = 2,
        gaps_out = 4,

        col = {
            active_border = active,
            inactive_border = inactive,
        },
    },

    decoration = {
        rounding = 10,

        active_opacity = 1.0,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,

        dim_inactive = true,
        dim_strength = 0.1,
        dim_special = 0.8,

        shadow = {
            enabled = true,
            range = 3,
            render_power = 1,

            color = active,
            color_inactive = inactive,
        },

        blur = {
            enabled = true,
            size = 6,
            passes = 3,
            new_optimizations = true,
            xray = true,
            ignore_opacity = true,
            special = true,
            popups = true,
        },
    },

    group = {
        col = {
            border_active = colors.flamingo,
        },

        groupbar = {
            col = {
                active = colors.surface0,
            },
        },
    },
})
