
-- local hl = require("hyprland")

local home = os.getenv("HOME") or ""
local hypr_dir = home .. "/.config/hypr"
local scripts_dir = hypr_dir .. "/scripts"

local function startup(command)
    hl.exec_cmd(command)
end

hl.on("hyprland.start", function()
    -- Wallpaper
    startup("hyprpaper")

    -- D-Bus and systemd user environment
    startup("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    startup("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Desktop services
    startup(scripts_dir .. "/Dropterminal.sh kitty")
    startup(scripts_dir .. "/Polkit.sh")
    startup("nm-applet --indicator")
    startup("swaync")
    startup("waybar")
    startup("qs -c overview")
    startup("hypridle")
    startup(scripts_dir .. "/Hyprsunset.sh init")

    -- Clipboard manager
    startup("wl-paste --type text --watch cliphist store")
    startup("wl-paste --type image --watch cliphist store")

    -- Keyboard-layout initialization
    startup(scripts_dir .. "/KeybindsLayoutInit.sh")
end)
