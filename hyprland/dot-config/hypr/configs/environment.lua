local function hostname()
    local pipe = io.popen("/bin/uname -n")
    if not pipe then
        return ""
    end

    local name = pipe:read("*l") or ""
    pipe:close()
    return name
end

local function set_env(name, value)
    hl.env(name, value)
end

-- Common environment variables
set_env("GDK_BACKEND", "wayland,x11")
set_env("CLUTTER_BACKEND", "wayland")

-- Qt
set_env("QT_QPA_PLATFORM", "wayland;xcb")
set_env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
set_env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
set_env("QT_QPA_PLATFORMTHEME", "qt6ct")
set_env("QT_STYLE_OVERRIDE", "kvantum")
set_env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")

-- Xwayland scaling
set_env("GDK_SCALE", "1")
set_env("QT_SCALE_FACTOR", "1")

-- Hyprcursor
set_env("HYPRCURSOR_THEME", "Future-Cyan-Hyprcursor_Theme")
set_env("HYPRCURSOR_SIZE", "42")

-- Xcursor fallback
set_env("XCURSOR_THEME", "Future Cursors")
set_env("XCURSOR_SIZE", "30")

-- Firefox
set_env("MOZ_ENABLE_WAYLAND", "1")

-- Electron
set_env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA-only environment variables
local nvidia_hosts = {
    ["alexdesk"] = true,
}

if nvidia_hosts[hostname()] then
    set_env("LIBVA_DRIVER_NAME", "nvidia")
    set_env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
    set_env("NVD_BACKEND", "direct")
    set_env("GSK_RENDERER", "ngl")
end
