local hl = require("hyprland")

local function window_rule(match, properties)
    properties = properties or {}
    properties.match = match
    hl.window_rule(properties)
end

local function layer_rule(match, properties)
    properties = properties or {}
    properties.match = match
    hl.layer_rule(properties)
end

-- Workspace and monitor assignment
window_rule({ tag = "email.*" }, {
    workspace = "1",
})

window_rule({ tag = "browser.*" }, {
    workspace = "2",
})

window_rule({ tag = "multimedia.*" }, {
    workspace = "3 silent",
})

window_rule({ tag = "gamestore.*" }, {
    workspace = "4",
})

window_rule({ content = "3" }, {
    monitor = "DP-1",
})

-- Browser tags
window_rule({ class = [=[^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr|[Ff]irefox-bin)$]=] }, {
    tag = "+browser",
})

window_rule({ class = [=[^([Cc]hromium)$]=] }, {
    tag = "+browser",
})

window_rule({ class = [=[^([Bb]rave-browser(-beta|-dev|-unstable)?)$]=] }, {
    tag = "+browser",
})

window_rule({ class = [=[^([Tt]horium-browser|[Cc]achy-browser)$]=] }, {
    tag = "+browser",
})

window_rule({ class = [=[^(zen-alpha|zen)$]=] }, {
    tag = "+browser",
})

-- Notification tags
window_rule({
    class = [=[^(swaync-control-center|swaync-notification-window|swaync-client|class)$]=],
}, {
    tag = "+notif",
})

-- Terminal tags
window_rule({
    class = [=[^(ghostty|wezterm|Alacritty|kitty|kitty-dropterm)$]=],
}, {
    tag = "+terminal",
})

-- Email tags
window_rule({
    class = [=[^([Tt]hunderbird|org.mozilla.Thunderbird)$]=],
}, {
    tag = "+email",
})

window_rule({
    class = [=[^(eu.betterbird.Betterbird)$]=],
}, {
    tag = "+email",
})

-- Coding tags
window_rule({
    class = [=[^(codium|codium-url-handler|VSCodium)$]=],
}, {
    tag = "+coding",
})

window_rule({
    class = [=[^(VSCode|code|code-url-handler)$]=],
}, {
    tag = "+coding",
})

-- Screen-sharing tags
window_rule({
    class = [=[^(com.obsproject.Studio)$]=],
}, {
    tag = "+screenshare",
})

-- IM tags
window_rule({
    class = [=[^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$]=],
}, {
    tag = "+im",
})

window_rule({
    class = [=[^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$]=],
}, {
    tag = "+im",
})

window_rule({
    class = [=[^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$]=],
}, {
    tag = "+im",
})

-- Game tags
window_rule({
    class = [=[^(gamescope)$]=],
}, {
    tag = "+games",
})

window_rule({
    class = [=[^(steam_app_\d+)$]=],
}, {
    tag = "+games",
})

window_rule({
    xdg_tag = [=[^(proton-game)$]=],
}, {
    tag = "+games",
})

-- Game-store tags
window_rule({
    class = [=[^([Ss]team)$]=],
}, {
    tag = "+gamestore",
})

window_rule({
    title = [=[^([Ll]utris)$]=],
}, {
    tag = "+gamestore",
})

window_rule({
    class = [=[^(com.heroicgameslauncher.hgl)$]=],
}, {
    tag = "+gamestore",
})

window_rule({ class = [=[^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$]=] }, {
    tag = "+file-manager",
})

window_rule({ class = [=[^([Ww]aytrogen)$]=] }, {
    tag = "+wallpaper",
})

window_rule({ class = [=[^([Aa]udacious)$]=] }, {
    tag = "+multimedia",
})

window_rule({ class = [=[^([Mm]pv|vlc)$]=] }, {
    tag = "+multimedia_video",
})

window_rule({ class = [=[^(wihotspot(-gui)?)$]=] }, {
    tag = "+settings",
})

window_rule({ class = [=[^([Bb]aobab|org.gnome.[Bb]aobab)$]=] }, {
    tag = "+settings",
})

window_rule({ class = [=[^(gnome-disks)$]=] }, {
    tag = "+settings",
})

window_rule({ title = "Kvantum Manager" }, {
    tag = "+settings",
})

window_rule({ class = [=[^(file-roller|org.gnome.FileRoller)$]=] }, {
    tag = "+settings",
})

window_rule({
    class = [=[^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$]=],
}, {
    tag = "+settings",
})

window_rule({ class = [=[^(qt5ct|qt6ct)$]=] }, {
    tag = "+settings",
})

window_rule({ class = "xdg-desktop-portal-gtk" }, {
    tag = "+settings",
})

window_rule({
    class = [=[^(org.kde.polkit-kde-authentication-agent-1)$]=],
}, {
    tag = "+settings",
})

window_rule({ class = [=[^([Rr]ofi)$]=] }, {
    tag = "+settings",
})

window_rule({ class = [=[^(btrfs-assistant)$]=] }, {
    tag = "+settings",
})

window_rule({ class = [=[^(timeshift-gtk)$]=] }, {
    tag = "+settings",
})

window_rule({ class = [=[^(evince)$]=] }, {
    tag = "+viewer",
})

window_rule({ class = [=[^(eog|org.gnome.Loupe)$]=] }, {
    tag = "+viewer",
})

-- Multimedia overrides
window_rule({ tag = "multimedia_video" }, {
    no_blur = true,
})

window_rule({ tag = "multimedia" }, {
    no_blur = true,
})

-- Floating applications
window_rule({ class = "(onedriver|onedriver-launcher)" }, {
    float = true,
})

window_rule({
    class = [=[^(mpv|com.github.rafostar.Clapper)$]=],
}, {
    float = true,
})

window_rule({ class = [=[^([Qq]alculate-gtk)$]=] }, {
    float = true,
})

-- Dialogues
window_rule({ title = [=[^(Authentication Required)$]=] }, {
    float = true,
    center = true,
})

window_rule({
    class = [=[^(xfce-polkit|mate-polkit|polkit-mate-authentication-agent-1)$]=],
    title = [=[^(Authentication required|Authentication Required)$]=],
}, {
    float = true,
    center = true,
    size = "monitor_w*0.35 monitor_h*0.35",
})

window_rule({
    class = "(codium|codium-url-handler|VSCodium)",
    title = "negative:(.*codium.*|.*VSCodium.*)",
}, {
    float = true,
})

window_rule({
    class = [=[^(com.heroicgameslauncher.hgl)$]=],
    title = "negative:(Heroic Games Launcher)",
}, {
    float = true,
})

window_rule({
    class = [=[^([Ss]team)$]=],
    title = [=[negative:^([Ss]team)$]=],
}, {
    float = true,
})

window_rule({ title = [=[^(Add Folder to Workspace)$]=] }, {
    float = true,
    size = "monitor_w*0.7 monitor_h*0.6",
    center = true,
})

window_rule({ title = [=[^(Save As)$]=] }, {
    float = true,
    size = "monitor_w*0.7 monitor_h*0.6",
    center = true,
})

window_rule({ initial_title = "Open Files" }, {
    float = true,
    size = "monitor_w*0.7 monitor_h*0.6",
})

window_rule({ title = [=[^(SDDM Background)$]=] }, {
    float = true,
    center = true,
    size = "monitor_w*0.16 monitor_h*0.12",
})

window_rule({ class = "^(yad)$" }, {
    float = true,
    center = true,
    size = "monitor_w*0.2 monitor_h*0.2",
})

-- Centering
window_rule({ title = [=[^(Keybindings)$]=] }, {
    center = true,
})

window_rule({
    class = [=[^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$]=],
}, {
    center = true,
})

window_rule({ class = "^(nm-connection-editor)$" }, {
    center = true,
})

window_rule({
    class = "^(nm-applet)$",
    title = [=[^(Wi-Fi Network Authentication Required)$]=],
}, {
    center = true,
})

window_rule({ fullscreen = true }, {
    idle_inhibit = "fullscreen",
})

window_rule({ class = ".*" }, {
    idle_inhibit = "fullscreen",
})

window_rule({ title = ".*" }, {
    idle_inhibit = "fullscreen",
})

-- Opacity
window_rule({ tag = "browser" }, {
    opacity = "1.0 0.8",
})

window_rule({ tag = "projects" }, {
    opacity = "1.0 0.8",
})

window_rule({ tag = "im" }, {
    opacity = "0.95 0.8",
})

window_rule({ tag = "multimedia" }, {
    opacity = "1.0 0.9",
})

window_rule({ tag = "file-manager" }, {
    opacity = "0.9 0.8",
})

window_rule({ tag = "terminal" }, {
    opacity = "0.9 0.8",
})

window_rule({ class = "^(gedit)$" }, {
    opacity = "0.9 0.8",
})

window_rule({ class = "^(deluge)$" }, {
    opacity = "0.9 0.8",
})

window_rule({ class = "^(seahorse)$" }, {
    opacity = "0.9 0.8",
})

layer_rule({ namespace = "rofi" }, {
    blur = true,
    dim_around = true,
    animation = "slide",
})

layer_rule({ namespace = "notifications" }, {
    blur = true,
    above_lock = true,
    no_screen_share = true,
    animation = "slide",
})

layer_rule({ namespace = "quickshell:overview" }, {
    blur = true,
    ignore_alpha = 0.5,
})

hl.window_rule({
    name = "Picture-in-Picture",

    match = {
        title = [=[^[Pp]icture-in-[Pp]icture$]=],
    },

    float = true,
    move = "72% 7%",
    opacity = "0.95 0.75",
    pin = true,
    keep_aspect_ratio = true,
    size = "monitor_w*0.3 monitor_h*0.3",
})

hl.window_rule({
    name = "Mainline Kernels",

    match = {
        class = "^(mainline-gtk)$",
        title = "^(Mainline Kernels)$",
        initial_class = "^(mainline-gtk)$",
        initial_title = "^(Mainline Kernels)$",
    },

    float = true,
    center = true,
    size = "monitor_w*0.45 monitor_h*0.55",
})

hl.window_rule({
    name = "Kwallet",

    match = {
        class = "^(org.kde.kwalletmanager)$",
        title = "^(Wallet Manager)$",
        initial_class = "^(org.kde.kwalletmanager)$",
        initial_title = "^(Wallet Manager)$",
    },

    float = true,
    center = true,
    size = "monitor_w*0.6 monitor_h*0.6",
})

hl.window_rule({
    name = "NVIDIA Settings",

    match = {
        class = "^(nvidia-settings)$",
        title = "^(NVIDIA Settings)$",
        initial_class = "^(nvidia-settings)$",
        initial_title = "^(NVIDIA Settings)$",
    },

    float = true,
    center = true,
    size = "monitor_w*0.6 monitor_h*0.6",
})

hl.window_rule({
    name = "KooL Cheat (tag)",

    match = {
        tag = "KooL_Cheat",
    },

    float = true,
    center = true,
    size = "monitor_w*0.65 monitor_h*0.9",
})

hl.window_rule({
    name = "Wallpaper (tag)",

    match = {
        tag = "wallpaper",
    },

    float = true,
    center = true,
    size = "monitor_w*0.7 monitor_h*0.7",
    opacity = "0.9 0.7",
})

hl.window_rule({
    name = "Settings (tag)",

    match = {
        tag = "settings",
    },

    float = true,
    center = true,
    size = "monitor_w*0.7 monitor_h*0.7",
    opacity = "0.8 0.7",
})

hl.window_rule({
    name = "Viewer (tag)",

    match = {
        tag = "viewer",
    },

    float = true,
    center = true,
    opacity = "0.82 0.75",
})

hl.window_rule({
    name = "Multimedia Video (tag)",

    match = {
        tag = "multimedia_video",
    },

    no_blur = true,
    opacity = "1.0",
})

hl.window_rule({
    name = "Games (tag)",

    match = {
        tag = "games",
    },

    no_blur = true,
    fullscreen = false,
})

hl.window_rule({
    name = "Calculators",

    match = {
        class = "(org.gnome.Calculator|qalculate-gtk)",
    },

    float = true,
    center = true,
    size = "monitor_w*0.55 monitor_h*0.45",
})

hl.window_rule({
    name = "Thunar Dialogs",

    match = {
        class = "([Tt]hunar)",
        title = "negative:(.*[Tt]hunar.*)",
    },

    float = true,
    center = true,
})

hl.window_rule({
    name = "Bitwarden",

    match = {
        class = "^(Bitwarden)$",
        title = "^(Bitwarden)$",
        initial_class = "^(Bitwarden)$",
        initial_title = "^(Bitwarden)$",
    },

    float = true,
    center = true,
    size = "monitor_w*0.6 monitor_h*0.6",
})
