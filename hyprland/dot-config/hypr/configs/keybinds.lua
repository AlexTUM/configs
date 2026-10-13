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
exec(mainMod .. " + CTRL + O", "toggle active window opacity", "hyprctl dispatch setprop active opaque toggle")

exec("ALT_L + SHIFT_L", "switch keyboard layout globally", scriptsDir .. "/KeyboardLayout.sh switch", { locked = true })
exec(
	"SHIFT_L + ALT_L",
	"switch keyboard layout per-window",
	scriptsDir .. "/Tak0-Per-Window-Switch.sh",
	{ locked = true }
)

exec(mainMod .. " + ALT + C", "calculator", scriptsDir .. "/RofiCalc.sh")

-- System
exec("CTRL+ALT+Delete", "exit Hyprland", "hyprctl dispatch exit 0")
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
exec(mainMod .. " + CTRL + F9", "move workspace to left monitor", "hyprctl dispatch movecurrentworkspacetomonitor l")
exec(mainMod .. " + CTRL + F10", "move workspace to right monitor", "hyprctl dispatch movecurrentworkspacetomonitor r")
exec(mainMod .. " + CTRL + F11", "move workspace to up monitor", "hyprctl dispatch movecurrentworkspacetomonitor u")
exec(mainMod .. " + CTRL + F12", "move workspace to down monitor", "hyprctl dispatch movecurrentworkspacetomonitor d")

-- SYSTEM
exec("CTRL + ALT + Delete", "exit Hyprland", "hyprctl dispatch exit 0")
exec(mainMod .. " + Q", "close active window", "hyprctl dispatch killactive")
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
exec(mainMod .. " + P", "toggle pseudo (dwindle)", "hyprctl dispatch pseudo")

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

-- Resize windows
exec(mainMod .. " + SHIFT + Left", "resize left (-50)", "hyprctl dispatch resizeactive -50 0", { repeating = true })
exec(mainMod .. " + SHIFT + Right", "resize right (+50)", "hyprctl dispatch resizeactive 50 0", { repeating = true })
exec(mainMod .. " + SHIFT + Up", "resize up (-50)", "hyprctl dispatch resizeactive 0 -50", { repeating = true })
exec(mainMod .. " + SHIFT + Down", "resize down (+50)", "hyprctl dispatch resizeactive 0 50", { repeating = true })

-- Move windows
exec(mainMod .. " + CTRL + Left", "move window left", "hyprctl dispatch movewindow l")
exec(mainMod .. " + CTRL + Right", "move window right", "hyprctl dispatch movewindow r")
exec(mainMod .. " + CTRL + Up", "move window up", "hyprctl dispatch movewindow u")
exec(mainMod .. " + CTRL + Down", "move window down", "hyprctl dispatch movewindow d")

-- Swap windows
exec(mainMod .. " + ALT + Left", "swap window left", "hyprctl dispatch swapwindow l")
exec(mainMod .. " + ALT + Right", "swap window right", "hyprctl dispatch swapwindow r")
exec(mainMod .. " + ALT + Up", "swap window up", "hyprctl dispatch swapwindow u")
exec(mainMod .. " + ALT + Down", "swap window down", "hyprctl dispatch swapwindow d")

-- Group
exec(mainMod .. " + G", "toggle group", "hyprctl dispatch togglegroup")

-- Navigate within a group
exec(mainMod .. " + Tab", "Change Group Forward", "hyprctl dispatch changegroupactive f")
exec(mainMod .. " + CTRL + Tab", "change active in group", "hyprctl dispatch changegroupactive")
exec(mainMod .. " + ALT + Tab", "Change Group Back", "hyprctl dispatch changegroupactive b")

-- Move window into/out of group
exec(mainMod .. " + CTRL + K", "Move left into group", "hyprctl dispatch movewindoworgroup l")
exec(mainMod .. " + CTRL + L", "Move Right into group", "hyprctl dispatch movewindoworgroup r")
exec(mainMod .. " + CTRL + H", "Move active out of group", "hyprctl dispatch moveoutofgroup")

-- Move focus
exec(mainMod .. " + Left", "focus left", "hyprctl dispatch movefocus l")
exec(mainMod .. " + Right", "focus right", "hyprctl dispatch movefocus r")
exec(mainMod .. " + Up", "focus up", "hyprctl dispatch movefocus u")
exec(mainMod .. " + Down", "focus down", "hyprctl dispatch movefocus d")

-- Workspaces related
exec(mainMod .. " + Tab", "next workspace", "hyprctl dispatch workspace m+1")
exec(mainMod .. " + SHIFT + Tab", "previous workspace", "hyprctl dispatch workspace m-1")

-- Special workspace
exec(mainMod .. " + SHIFT + U", "move to special workspace", "hyprctl dispatch movetoworkspace special")
exec(mainMod .. " + U", "toggle special workspace", "hyprctl dispatch togglespecialworkspace")

-- Workspace keycodes: code:10 through code:19 map to workspaces 1 through 10.
for workspace = 1, 10 do
	local code = workspace + 9

	exec(mainMod .. " + code:" .. code, "workspace " .. workspace, "hyprctl dispatch workspace " .. workspace)

	exec(
		mainMod .. " + SHIFT + code:" .. code,
		"move to workspace " .. workspace,
		"hyprctl dispatch movetoworkspace " .. workspace
	)

	exec(
		mainMod .. " + CTRL + code:" .. code,
		"move silently to workspace " .. workspace,
		"hyprctl dispatch movetoworkspacesilent " .. workspace
	)
end

-- Move to previous/next workspace
exec(mainMod .. " + SHIFT + Comma", "move to previous workspace", "hyprctl dispatch movetoworkspace -1")
exec(mainMod .. " + SHIFT + Period", "move to next workspace", "hyprctl dispatch movetoworkspace +1")

-- Move silently to previous/next workspace
exec(mainMod .. " + CTRL + Comma", "move silently to previous workspace", "hyprctl dispatch movetoworkspacesilent -1")
exec(mainMod .. " + CTRL + Period", "move silently to next workspace", "hyprctl dispatch movetoworkspacesilent +1")

-- Scroll through existing workspaces
exec(mainMod .. " + mouse_down", "next workspace", "hyprctl dispatch workspace e+1")
exec(mainMod .. " + mouse_up", "previous workspace", "hyprctl dispatch workspace e-1")
exec(mainMod .. " + Period", "next workspace", "hyprctl dispatch workspace e+1")
exec(mainMod .. " + Comma", "previous workspace", "hyprctl dispatch workspace e-1")

-- Move/resize windows with mainMod + LMB/RMB and dragging
exec(mainMod .. " + mouse:272", "move window", "hyprctl dispatch movewindow", { drag = true })
exec(mainMod .. " + mouse:273", "resize window", "hyprctl dispatch resizewindow", { drag = true })
