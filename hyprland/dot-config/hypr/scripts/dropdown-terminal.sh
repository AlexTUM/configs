#!/usr/bin/env bash
set -euo pipefail

CLASS="kitty-dropdown"
SPECIAL="dropdown"
LOCK_FILE="${XDG_RUNTIME_DIR:-/tmp}/dropdown-terminal.lock"

exec 9>"$LOCK_FILE"
flock -n 9 || exit 0

find_window_address() {
    hyprctl -j clients |
        jq -r --arg class "$CLASS" \
            '[.[] | select(.class == $class) | .address][0] // ""'
}

get_focused_special() {
    hyprctl -j monitors |
        jq -r '[.[] | select(.focused == true) |
            .specialWorkspace.name][0] // ""'
}

# Check whether the dropdown is currently visible.
visible="$(get_focused_special)"

if [[ "$visible" == "special:$SPECIAL" || "$visible" == "$SPECIAL" ]]; then
    hyprctl dispatch "hl.dsp.workspace.toggle_special('$SPECIAL')"
    exit 0
fi

# Find or create Kitty.
address="$(find_window_address)"

if [[ -z "$address" ]]; then
    kitty \
        --class "$CLASS" \
        --start-as normal \
        --override remember_window_size=no \
        --override initial_window_width=120c \
        --override initial_window_height=35c \
        9>&- \
        >/dev/null 2>&1 &

    for _ in {1..100}; do
        address="$(find_window_address)"
        [[ -n "$address" ]] && break
        sleep 0.05
    done

    if [[ -z "$address" ]]; then
        echo "Timed out waiting for Kitty." >&2
        exit 1
    fi
fi

# Ensure Kitty belongs to the special workspace.
workspace="$(hyprctl -j clients |
    jq -r --arg address "$address" \
        '[.[] | select(.address == $address) |
            .workspace.name][0] // ""')"

echo "VISIBLE='$visible'" >&2
if [[ "$workspace" != "special:$SPECIAL" ]]; then
    hyprctl dispatch \
        "hl.dsp.window.move({ window = 'address:$address', workspace = 'special:$SPECIAL', follow = false })"
fi

# Show dropdown and focus Kitty.
hyprctl dispatch "hl.dsp.workspace.toggle_special('$SPECIAL')"
hyprctl dispatch "hl.dsp.focus({ window = 'address:$address' })"

