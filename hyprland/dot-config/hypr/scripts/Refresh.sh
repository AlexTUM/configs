#!/usr/bin/env bash
# ==================================================
#  KoolDots (2026)
#  Project URL: https://github.com/LinuxBeginnings
#  License: GNU GPLv3
#  SPDX-License-Identifier: GPL-3.0-or-later
# ==================================================
# Scripts for refreshing ags, waybar, rofi, swaync, wallust

SCRIPTSDIR=$HOME/.config/hypr/scripts

# Define file_exists function
file_exists() {
  if [ -e "$1" ]; then
    return 0 # File exists
  else
    return 1 # File does not exist
  fi
}

# Kill already running processes (exclude waybar to avoid double reloads)
_ps=(rofi swaync ags)
for _prs in "${_ps[@]}"; do
  if pidof "${_prs}" >/dev/null; then
    pkill "${_prs}"
  fi
done

# Clean up any Waybar-spawned cava instances (unique temp conf names)
pkill -f 'waybar-cava\..*\.conf' 2>/dev/null || true


# quit ags & relaunch ags
#ags -q && ags &

# quit quickshell & relaunch quickshell
pkill qs && qs &

# some process to kill (exclude waybar to avoid restart loops)
for pid in $(pidof rofi swaync ags swaybg); do
  kill -SIGUSR1 "$pid"
  sleep 0.1
done

# Reload or start waybar once
if pidof waybar >/dev/null; then
  if command -v waybar-msg >/dev/null 2>&1; then
    waybar-msg cmd reload >/dev/null 2>&1 || true
  else
    killall -SIGUSR2 waybar 2>/dev/null || true
  fi
else
  waybar &
fi

# relaunch swaync
sleep 0.3
swaync >/dev/null 2>&1 &
# reload swaync
swaync-client --reload-config

exit 0
