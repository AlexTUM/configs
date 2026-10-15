-- keybinds.lua
-- local hl = require("hyprland")

local mainMod = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"

-- default programs
local defaultBrowser = "firefox"
local defaultFileManager = "thunar"
local defaultTerminal = "kitty"

local function bind(keys, description, dispatcher, options)
    options = options or {}
    options.description = description
    hl.bind(keys, dispatcher, options)
end

local function exec(keys, description, command, options)
    bind(keys, description, hl.dsp.exec_cmd(command), options)
end

-- Common shortcuts
exec(mainMod .. "+D", "app launcher", "pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window")
exec(mainMod .. "+B", "open default browser", defaultBrowser)
exec(mainMod .. "+A", "desktop overview", scriptsDir .. "/OverviewToggle.sh")
exec(mainMod .. "+Return", "open terminal", defaultTerminal)
exec(mainMod .. "+E", "file manager", defaultFileManager)
exec(mainMod .. "+C", "SSH session manager", scriptsDir .. "/rofi-ssh-menu.sh")

-- FEATURES / EXTRAS
exec(mainMod .. " + ALT + R", "refresh bar and menus", scriptsDir .. "/Refresh.sh")
exec(mainMod .. " + ALT + E", "emoji menu", scriptsDir .. "/RofiEmoji.sh")
exec(mainMod .. " + S", "web search", scriptsDir .. "/RofiSearch.sh")
exec(mainMod .. " + CTRL + S", "window switcher", "rofi -show window")
exec(mainMod .. " + ALT + L", "toggle layouts", scriptsDir .. "/ChangeLayout.sh toggle")
exec(mainMod .. " + ALT + V", "clipboard manager", scriptsDir .. "/ClipManager.sh")
exec(mainMod .. " + SHIFT + H", "Toggle Mute/Unmute for Active-Window", scriptsDir .. "/Toggle-Active-Window-Audio.sh")

bind(mainMod .. " + SHIFT + F", "fullscreen", hl.dsp.window.fullscreen())
bind(mainMod .. " + CTRL + F", "maximize window", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
bind(mainMod .. " + SPACE", "Float current window", hl.dsp.window.float({ action = "toggle" }))
exec(mainMod .. " + ALT + SPACE", "Float all windows", scriptsDir .. "/Float-all-Windows.sh")
exec(mainMod .. " + SHIFT + Return", "DropDown terminal", scriptsDir .. "/Dropterminal.sh " .. defaultTerminal)

-- Preserve the original Hyprland setprop command via hyprctl.
bind(mainMod .. " + CTRL + O", "toggle active window opacity", function()
    hl.dispatch("setprop", "active", "opaque", "toggle")
end)

exec("ALT_L + SHIFT_L", "switch keyboard layout globally", scriptsDir .. "/KeyboardLayout.sh switch", { locked = true })
exec(
    "SHIFT_L + ALT_L",
    "switch keyboard layout per-window",
    scriptsDir .. "/Tak0-Per-Window-Switch.sh",
    { locked = true }
)

exec(mainMod .. " + ALT + C", "calculator", scriptsDir .. "/RofiCalc.sh")

-- System
bind("CTRL + ALT + Delete", "exit Hyprland", hl.dsp.exit())
exec(mainMod .. "+L", "lock screen", scriptsDir .. "/LockScreen.sh")
exec("CTRL+ALT+P", "powermenu", scriptsDir .. "/Wlogout.sh")

-- Desktop zooming or magnifier
exec(
    mainMod .. " + ALT + mouse_down",
    "zoom in",
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')]]
)
exec(
    mainMod .. " + ALT + mouse_up",
    "zoom out",
    [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')]]
)

-- Waybar / Bar related
exec(mainMod .. " + CTRL + ALT + B", "toggle waybar on/off", "pkill -SIGUSR1 waybar")

-- Night light toggle (Hyprsunset)
exec(mainMod .. " + N", "toggle night light", scriptsDir .. "/Hyprsunset.sh toggle")

-- Move current workspaces to monitors
bind(mainMod .. " + CTRL + F9", "move workspace to left monitor", hl.dsp.workspace.move({ monitor = "left" }))
bind(mainMod .. " + CTRL + F10", "move workspace to right monitor", hl.dsp.workspace.move({ monitor = "right" }))
bind(mainMod .. " + CTRL + F11", "move workspace to up monitor", hl.dsp.workspace.move({ monitor = "up" }))
bind(mainMod .. " + CTRL + F12", "move workspace to down monitor", hl.dsp.workspace.move({ monitor = "down" }))

-- SYSTEM
bind("CTRL + ALT + Delete", "exit Hyprland", hl.dsp.exit())
bind(mainMod .. " + Q", "close active window", hl.dsp.window.close())
exec(mainMod .. " + SHIFT + Q", "Terminate active process", scriptsDir .. "/KillActiveProcess.sh")
exec(mainMod .. " + L", "lock screen", scriptsDir .. "/LockScreen.sh")
exec("CTRL + ALT + P", "powermenu", scriptsDir .. "/Wlogout.sh")
exec(mainMod .. " + SHIFT + N", "notification panel", "swaync-client -t -sw")

-- Master Layout
bind(mainMod .. " + CTRL + D", "remove master", hl.dsp.layout("removemaster"))
bind(mainMod .. " + I", "add master", hl.dsp.layout("addmaster"))

-- j/k cycle windows globally
bind(mainMod .. " + J", "cycle next", hl.dsp.layout("cyclenext"))
bind(mainMod .. " + K", "cycle previous", hl.dsp.layout("cycleprev"))
bind(mainMod .. " + CTRL + Return", "swap with master", hl.dsp.layout("swapwithmaster"))

-- Dwindle Layout
bind(mainMod .. " + SHIFT + I", "toggle split (dwindle)", hl.dsp.layout("togglesplit"))
bind(mainMod .. " + P", "toggle pseudo (dwindle)", hl.dsp.window.pseudo())

-- Layout-aware keybinds: run when this Lua config is loaded.
hl.exec_cmd(scriptsDir .. "/ChangeLayout.sh init")

-- Direct layout binds
exec(mainMod .. " + ALT + 1", "layout dwindle", scriptsDir .. "/ChangeLayout.sh dwindle")
exec(mainMod .. " + ALT + 2", "layout master", scriptsDir .. "/ChangeLayout.sh master")
exec(mainMod .. " + ALT + 3", "layout scrolling", scriptsDir .. "/ChangeLayout.sh scrolling")
exec(mainMod .. " + ALT + 4", "layout monocle", scriptsDir .. "/ChangeLayout.sh monocle")

-- Cycle windows; if floating bring to top
exec("ALT + Tab", "cycle next window", "hyprctl dispatch cyclenext")
exec("ALT + Tab", "bring active to top", "hyprctl dispatch bringactivetotop")

-- Special Keys / Hot Keys
exec("XF86AudioRaiseVolume", "volume up", scriptsDir .. "/Volume.sh --inc", { locked = true, repeating = true })
exec("XF86AudioLowerVolume", "volume down", scriptsDir .. "/Volume.sh --dec", { locked = true, repeating = true })
exec(
    "ALT + XF86AudioRaiseVolume",
    "volume up precise",
    scriptsDir .. "/Volume.sh --inc-precise",
    { locked = true, repeating = true }
)
exec(
    "ALT + XF86AudioLowerVolume",
    "volume down precise",
    scriptsDir .. "/Volume.sh --dec-precise",
    { locked = true, repeating = true }
)

exec("XF86AudioMicMute", "toggle mic mute", scriptsDir .. "/Volume.sh --toggle-mic", { locked = true })
exec("XF86AudioMute", "toggle mute", scriptsDir .. "/Volume.sh --toggle", { locked = true })
exec("XF86Sleep", "sleep", "systemctl suspend", { locked = true })
exec("XF86Rfkill", "airplane mode", scriptsDir .. "/AirplaneMode.sh", { locked = true })

-- Media controls using keyboards
exec("XF86AudioPause", "pause", scriptsDir .. "/MediaCtrl.sh --pause", { locked = true })
exec("XF86AudioPlay", "play", scriptsDir .. "/MediaCtrl.sh --pause", { locked = true })
exec("XF86AudioNext", "next track", scriptsDir .. "/MediaCtrl.sh --nxt", { locked = true })
exec("XF86AudioPrev", "previous track", scriptsDir .. "/MediaCtrl.sh --prv", { locked = true })
exec("XF86AudioStop", "stop", scriptsDir .. "/MediaCtrl.sh --stop", { locked = true })

-- Screenshot keybindings (you may need to press Fn as well)
exec("Print", "screenshot area", "hyprshot -m region")
exec(mainMod .. " + Print", "screenshot window", "hyprshot -m window")
exec(mainMod .. " + ALT + Print", "screenshot active", "hyprshot -m active")
exec(mainMod .. " + CTRL + Print", "screenshot monitor", "hyprshot -m output")

-- Move windows
bind(mainMod .. " + CTRL + left", "move window left", hl.dsp.window.move({ direction = "left" }))
bind(mainMod .. " + CTRL + right", "move window right", hl.dsp.window.move({ direction = "right" }))
bind(mainMod .. " + CTRL + up", "move window up", hl.dsp.window.move({ direction = "up" }))
bind(mainMod .. " + CTRL + down", "move window down", hl.dsp.window.move({ direction = "down" }))

-- Resize windows by 50 px
bind(
    mainMod .. " + SHIFT + left",
    "resize left (-50)",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
    { repeating = true }
)
bind(
    mainMod .. " + SHIFT + right",
    "resize right (+50)",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
    { repeating = true }
)
bind(
    mainMod .. " + SHIFT + up",
    "resize up (-50)",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
    { repeating = true }
)
bind(
    mainMod .. " + SHIFT + down",
    "resize down (+50)",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
    { repeating = true }
)

-- Swap windows
bind(mainMod .. " + ALT + left", "swap window left", hl.dsp.window.swap({ direction = "left" }))
bind(mainMod .. " + ALT + right", "swap window right", hl.dsp.window.swap({ direction = "right" }))
bind(mainMod .. " + ALT + up", "swap window up", hl.dsp.window.swap({ direction = "up" }))
bind(mainMod .. " + ALT + down", "swap window down", hl.dsp.window.swap({ direction = "down" }))

-- Move focus
bind(mainMod .. " + left", "focus left", hl.dsp.focus({ direction = "left" }))
bind(mainMod .. " + right", "focus right", hl.dsp.focus({ direction = "right" }))
bind(mainMod .. " + up", "focus up", hl.dsp.focus({ direction = "up" }))
bind(mainMod .. " + down", "focus down", hl.dsp.focus({ direction = "down" }))

-- Group
bind(mainMod .. " + G", "toggle group", hl.dsp.group.toggle())
bind(mainMod .. " + CTRL + Tab", "change active in group", hl.dsp.group.next())
bind(mainMod .. " + ALT + Tab", "change group back", hl.dsp.group.prev())

-- Move window into / out of a group
bind(mainMod .. " + CTRL + K", "move left into group", hl.dsp.window.move({ into_group = "left" }))
bind(mainMod .. " + CTRL + L", "move right into group", hl.dsp.window.move({ into_group = "right" }))
bind(
    mainMod .. " + CTRL + H",
    "move active out of group to the left",
    hl.dsp.window.move({ direction = "left", group_aware = true })
)

-- Workspaces related
bind(mainMod .. " + Tab", "next workspace", hl.dsp.focus({ workspace = "m+1" }))
bind(mainMod .. " + SHIFT + Tab", "previous workspace", hl.dsp.focus({ workspace = "m-1" }))

-- Special workspace
bind(mainMod .. " + SHIFT + U", "move to special workspace", hl.dsp.window.move({ workspace = "special" }))
bind(mainMod .. " + U", "toggle special workspace", hl.dsp.workspace.toggle_special())

-- Workspace keycodes: code:10 through code:19 map to workspaces 1 through 10.
for workspace = 1, 10 do
    local code = workspace + 9

    bind(mainMod .. " + code:" .. code, "workspace " .. workspace, hl.dsp.focus({ workspace = workspace }))

    bind(
        mainMod .. " + SHIFT + code:" .. code,
        "move to workspace " .. workspace,
        hl.dsp.window.move({ workspace = workspace })
    )

    bind(
        mainMod .. " + CTRL + code:" .. code,
        "move silently to workspace " .. workspace,
        hl.dsp.window.move({ workspace = workspace, silent = true })
    )
end

-- Move to previous/next workspace
bind(mainMod .. " + SHIFT + Comma", "move to previous workspace", hl.dsp.window.move({ workspace = "-1" }))
bind(mainMod .. " + SHIFT + Period", "move to next workspace", hl.dsp.window.move({ workspace = "+1" }))
bind(
    mainMod .. " + CTRL + Comma",
    "move silently to previous workspace",
    hl.dsp.window.move({ workspace = "-1", silent = true })
)
bind(
    mainMod .. " + CTRL + Period",
    "move silently to next workspace",
    hl.dsp.window.move({ workspace = "+1", silent = true })
)

-- Scroll through existing workspaces
bind(mainMod .. " + mouse_down", "next workspace", hl.dsp.focus({ workspace = "e+1" }))
bind(mainMod .. " + mouse_up", "previous workspace", hl.dsp.focus({ workspace = "e-1" }))
bind(mainMod .. " + Period", "next workspace", hl.dsp.focus({ workspace = "e+1" }))
bind(mainMod .. " + Comma", "previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
bind(mainMod .. " + mouse:272", "move window", hl.dsp.window.drag(), { mouse = true, drag = true })
bind(mainMod .. " + mouse:273", "resize window", hl.dsp.window.resize(), { mouse = true, drag = true })
