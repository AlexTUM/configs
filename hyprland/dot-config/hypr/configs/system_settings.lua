-- System and layout settings

local hl = require("hyprland")
local hosts = require("hosts")

local home = os.getenv("HOME") or ""
local scripts_dir = home .. "/.config/hypr/scripts"

-- ---------------------------------------------------------------------------
-- Layouts
-- ---------------------------------------------------------------------------

hl.config({
    dwindle = {
        preserve_split = true,
        smart_resizing = true,
        use_active_for_splits = true,
        smart_split = false,

        -- creates balanced splits; set 1 for splits of thirds
        default_split_ratio = 0.5,

        split_bias = 0,
        precise_mouse_move = false,
        special_scale_factor = 0.8,
    },

    master = {
        new_status = "slave",
        new_on_top = true,
        new_on_active = "none",
        orientation = "left",
        mfact = 0.55,
        smart_resizing = false,
        drop_at_cursor = true,
        always_keep_position = false,
    },

    scrolling = {
        column_width = 0.80,
        fullscreen_on_one_column = true,
        direction = "right",
        follow_focus = true,
    },

    general = {
        resize_on_border = true,
        layout = "master",
    },
})

-- ---------------------------------------------------------------------------
-- Input
-- ---------------------------------------------------------------------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        repeat_rate = 50,
        repeat_delay = 300,

        -- -1.0 to 1.0; 0 means no sensitivity modification.
        sensitivity = 0,

        numlock_by_default = true,
        left_handed = false,
        follow_mouse = 1,
        float_switch_override_focus = false,
    },
})

-- setup touchpad on laptops
if hosts.is_laptop then
    hl.config({
        input = {
            touchpad = {
                disable_while_typing = true,
                natural_scroll = true,
                clickfinger_behavior = false,
                middle_button_emulation = false,
                tap_to_click = true,
                drag_lock = false,
            },
        },
    })
end

-- ---------------------------------------------------------------------------
-- Gestures - Only for laptops
-- ---------------------------------------------------------------------------

if hosts.is_laptop then
    hl.config({
        gestures = {
            workspace_swipe_distance = 300,
            workspace_swipe_touch = false,
            workspace_swipe_invert = true,
            workspace_swipe_min_speed_to_force = 30,
            workspace_swipe_cancel_ratio = 0.5,
            workspace_swipe_create_new = true,
            workspace_swipe_direction_lock = true,
            workspace_swipe_forever = false,
            workspace_swipe_use_r = false,
            close_max_timeout = 100,
        },
    })

    hl.gesture({
        fingers = 3,
        direction = "horizontal",
        action = "workspace",
    })

    hl.gesture({
        fingers = 3,
        direction = "up",
        action = hl.dsp.exec_cmd(
            [[
            hyprctl keyword cursor:zoom_factor "$(
                hyprctl getoption cursor:zoom_factor |
                awk 'NR==1 {
                    factor = $2
                    if (factor < 1) factor = 1
                    print factor * 1.5
                }'
            )
            ]]
        ),
    })

    hl.gesture({
        fingers = 3,
        direction = "down",
        action = hl.dsp.exec_cmd(
            [[
            hyprctl keyword cursor:zoom_factor "$(
                hyprctl getoption cursor:zoom_factor |
                awk 'NR==1 {
                    factor = $2
                    if (factor < 1) factor = 1
                    print factor / 1.5
                }'
            )
            ]]
        ),
    })

    hl.gesture({
        fingers = 4,
        direction = "up",
        action = hl.dsp.exec_cmd(scripts_dir .. "/OverviewToggle.sh"),
    })

    hl.gesture({
        fingers = 4,
        direction = "down",
        action = "float",
    })
end

-- ---------------------------------------------------------------------------
-- Miscellaneous behavior
-- ---------------------------------------------------------------------------

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,

        vrr = 2,

        mouse_move_enables_dpms = true,

        enable_swallow = false,
        swallow_regex = "^kitty$",

        focus_on_activate = false,

        -- 0 = disabled.
        initial_workspace_tracking = 0,

        middle_click_paste = true,

        enable_anr_dialog = true,
        anr_missed_pings = 15,

        allow_session_lock_restore = true,

        -- 1 = a newly focused window takes over fullscreen.
        -- 2 = the fullscreen window remains above it.
        on_focus_under_fullscreen = 1,
    },

    ecosystem = {
        no_donation_nag = true,
    },
})

-- ---------------------------------------------------------------------------
-- Binds and XWayland
-- ---------------------------------------------------------------------------

hl.config({
    binds = {
        workspace_back_and_forth = true,
        allow_workspace_cycles = false,
        pass_mouse_when_bound = false,
        workspace_center_on = 1,
    },

    xwayland = {
        enabled = true,
        force_zero_scaling = true,
    },

    render = {
        direct_scanout = 1,
    },
})

-- ---------------------------------------------------------------------------
-- Cursor
-- ---------------------------------------------------------------------------

hl.config({
    cursor = {
        sync_gsettings_theme = true,

        no_hardware_cursors = 0,

        enable_hyprcursor = true,
        warp_on_change_workspace = 2,
        no_warps = true,

        no_break_fs_vrr = false,
        min_refresh_rate = 24,
        hotspot_padding = 1,

        inactive_timeout = 0,

        default_monitor = "DP-2",

        zoom_factor = 1.0,
        zoom_rigid = false,
        zoom_detached_camera = true,

        hide_on_key_press = true,
        hide_on_touch = false,
    },
})

-- nvidia specific settings for rendering
if hosts.is_nvidia then
    hl.config({
        render = {
            direct_scanout = 0,
        },

        cursor = {
            no_hardware_cursors = 1,
            use_cpu_buffer = 2,
        },
    })
end


