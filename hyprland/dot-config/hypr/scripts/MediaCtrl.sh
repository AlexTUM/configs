#!/usr/bin/env bash

music_icon="$HOME/.config/swaync/icons/music.png"

notify() {
  local summary=$1
  local body=$2
  local -a options=(-u low --transient)

  [[ -r "$music_icon" ]] && options+=(-i "$music_icon")
  notify-send "${options[@]}" "$summary" "$body"
}

show_music_notification() {
  local status title artist

  if ! status=$(playerctl status 2>/dev/null); then
    return 1
  fi

  case "$status" in
    Playing)
      title=$(playerctl metadata title 2>/dev/null || true)
      artist=$(playerctl metadata artist 2>/dev/null || true)

      [[ -n "$title" ]] || title="Unknown track"
      if [[ -n "$artist" ]]; then
        notify "Now playing:" "$title — $artist"
      else
        notify "Now playing:" "$title"
      fi
      ;;
    Paused)
      notify "Playback:" "Paused"
      ;;
  esac
}

if ! command -v playerctl >/dev/null 2>&1; then
  printf 'Error: playerctl is not installed or not in PATH\n' >&2
  exit 127
fi

if ! command -v notify-send >/dev/null 2>&1; then
  printf 'Error: notify-send is not installed or not in PATH\n' >&2
  exit 127
fi

case "${1-}" in
  --nxt)   action=next ;;
  --prv)   action=previous ;;
  --pause) action=play-pause ;;
  --stop)  action=stop ;;
  *)
    printf 'Usage: %s [--nxt|--prv|--pause|--stop]\n' "$0" >&2
    exit 2
    ;;
esac

if ! playerctl "$action"; then
  printf 'Error: playerctl %s failed (is a media player available?)\n' "$action" >&2
  exit 1
fi

if [[ "$action" == stop ]]; then
  notify "Playback:" "Stopped"
else
  if [[ "$action" == play-pause ]]; then
    sleep 0.1
  fi

  if ! show_music_notification; then
    printf 'Error: could not read playback status\n' >&2
    exit 1
  fi
fi

