
-- configs/laptop.lua

local hl = require("hyprland")
local hosts = require("hosts")

if not hosts.is_laptop then
    return
end

local home = os.getenv("HOME") or ""
local scripts_dir = home .. "/.config/hypr/scripts"

local function exec(script, args)
    local command = scripts_dir .. "/" .. script

    if args then
        command = command .. " " .. args
    end

    return hl.dsp.exec_cmd(command)
end

-- Keyboard brightness
hl.bind(
    "XF86KbdBrightnessDown",
    exec("BrightnessKbd.sh", "--dec"),
    { repeating = true }
)

hl.bind(
    "XF86KbdBrightnessUp",
    exec("BrightnessKbd.sh", "--inc"),
    { repeating = true }
)

-- Display brightness
hl.bind(
    "XF86MonBrightnessDown",
    exec("Brightness.sh", "--dec"),
    { repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    exec("Brightness.sh", "--inc"),
    { repeating = true }
)

-- Touchpad toggle
hl.bind(
    "XF86TouchpadToggle",
    exec("TouchPad.sh")
)

-- Optional screenshots using F6
-- hl.bind("SUPER + F6", exec("ScreenShot.sh", "--now"))
-- hl.bind("SUPER + SHIFT + F6", exec("ScreenShot.sh", "--area"))
-- hl.bind("ALT + F6", exec("ScreenShot.sh", "--active"))

-- Touchpad configuration
hl.device({
    -- NOTE: this probably needs to be changed accordingly
    name = "asue1209:00-04f3:319f-touchpad",
    enabled = true,
})
