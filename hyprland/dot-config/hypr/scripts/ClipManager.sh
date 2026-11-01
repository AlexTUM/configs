#!/usr/bin/env bash
# ==================================================
#  KoolDots (2026)
#  Project URL: https://github.com/LinuxBeginnings
#  License: GNU GPLv3
#  SPDX-License-Identifier: GPL-3.0-or-later
# ==================================================
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.

set -u

rofi_theme="$HOME/.config/rofi/config-clipboard.rasi"
msg='note: Ctrl+Delete = delete entry; Alt+Delete = wipe history'

# Optional toggle behavior: close this picker instead of launching another.
if pkill -x rofi 2>/dev/null; then
    exit 0
fi

while true; do
    result=$(
        rofi -i -dmenu \
            -kb-custom-1 'Control+Delete' \
            -kb-custom-2 'Alt+Delete' \
            -config "$rofi_theme" \
            -mesg "$msg" \
            < <(cliphist list)
    )
    status=$?

    case "$status" in
        1) exit 0 ;;  # Escape/cancel
        0)
            [[ -z "$result" ]] && continue
            printf '%s\n' "$result" | cliphist decode | wl-copy
            exit
            ;;
        10)
            [[ -n "$result" ]] && printf '%s\n' "$result" | cliphist delete
            ;;
        11)
            cliphist wipe
            ;;
        *)
            printf 'Rofi exited with status %s\n' "$status" >&2
            exit "$status"
            ;;
    esac
done
