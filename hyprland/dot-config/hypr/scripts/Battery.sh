#!/usr/bin/env bash
set -euo pipefail

shopt -s nullglob
capacity_files=(/sys/class/power_supply/BAT*/capacity)

for capacity_file in "${capacity_files[@]}"; do
    battery_dir=${capacity_file%/capacity}
    capacity=$(<"$capacity_file")
    status="Unknown"

    if [[ -r "$battery_dir/status" ]]; then
        status=$(<"$battery_dir/status")
    fi

    printf 'Battery: %s%% (%s)\n' "$capacity" "$status"
done
