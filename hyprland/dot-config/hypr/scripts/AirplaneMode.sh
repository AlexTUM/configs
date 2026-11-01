#!/usr/bin/env bash
set -euo pipefail

notif="$HOME/.config/swaync/images/ja.png"
wifi_state=$(nmcli -t -f WIFI radio)

if [[ "$wifi_state" == "enabled" ]]; then
    nmcli radio wifi off
    notify-send -u low -i "$notif" "Airplane mode" "Wi-Fi: off"
else
    nmcli radio wifi on
    notify-send -u low -i "$notif" "Airplane mode" "Wi-Fi: on"
fi

