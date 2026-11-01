#!/usr/bin/env bash
set -euo pipefail

CLASS="kitty-dropdown"
SPECIAL="dropdown"
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/dropdown-terminal.lock"

# Ignore overlapping invocations while a terminal is being started.
exec 9>"$LOCK_FILE"
flock -n 9 || exit 0

find_window_address() {
    hyprctl -j clients 2>/dev/null |
        jq -r --arg class "$CLASS" \
            '.[] | select(.class == $class) | .address' |
        head -n 1
}

address="$(find_window_address || true)"

if [[ -z "$address" ]]; then
    kitty \
        --class "$CLASS" \
        --start-as normal \
        --override remember_window_size=no \
        --override initial_window_width=120c \
        --override initial_window_height=35c \
        >/dev/null 2>&1 &

    # Wait for Hyprland to register the new window.
    for _ in {1..100}; do
        address="$(find_window_address || true)"
        [[ -n "$address" ]] && break
        sleep 0.05
    done

    if [[ -z "$address" ]]; then
        echo "Timed out waiting for the dropdown Kitty window." >&2
        exit 1
    fi
fi

monitor="$(hyprctl -j monitors |
    jq -r '.[] | select(.focused == true) | .name' |
    head -n 1)"

if [[ -n "$monitor" ]]; then
    # Keep the terminal on the currently focused monitor and in its scratchpad.
    hyprctl dispatch "hl.dsp.window.move({ window = 'address:$address', workspace = 'special:$SPECIAL', follow = false })"

    hyprctl dispatch "hl.dsp.workspace.toggle_special('$SPECIAL')"
    hyprctl dispatch "hl.dsp.focus({ window = 'address:$address' })"

fi

hyprctl dispatch "hl.dsp.workspace.toggle_special('$SPECIAL')"

