#!/bin/bash

### CONFIG ###
WALLPAPER_DIR=~/.config/wallpaper
HISTORY_FILE=~/.config/hypr/scripts/wallpaper_history.txt
INTERVAL=480  # 8 minutos = 480 segundos

### FUNCIONES ###
wait_for_hyprpaper() {
  while ! pgrep -x hyprpaper >/dev/null; do
    sleep 1
  done
}

get_random_wallpaper() {
  mapfile -t ALL_WALLS < <(find "$WALLPAPER_DIR" -type f)

  # Crear historial si no existe
  touch "$HISTORY_FILE"

  mapfile -t USED_WALLS < "$HISTORY_FILE"

  # Filtrar wallpapers no usados
  AVAILABLE=()
  for w in "${ALL_WALLS[@]}"; do
    if ! printf '%s\n' "${USED_WALLS[@]}" | grep -Fxq "$w"; then
      AVAILABLE+=("$w")
    fi
  done

  # Si ya se usaron todos → resetear historial
  if [ "${#AVAILABLE[@]}" -eq 0 ]; then
    echo "Resetting wallpaper history"
    : > "$HISTORY_FILE"
    AVAILABLE=("${ALL_WALLS[@]}")
  fi

  # Elegir uno al azar
  RANDOM_WALL="${AVAILABLE[RANDOM % ${#AVAILABLE[@]}]}"
  echo "$RANDOM_WALL"
}

set_wallpaper() {
  local WALL="$1"
  hyprctl hyprpaper wallpaper ",$WALL"

  echo "$WALL" >> "$HISTORY_FILE"
}

### MAIN ###
wait_for_hyprpaper

while true; do
  WALLPAPER=$(get_random_wallpaper)
  set_wallpaper "$WALLPAPER"
  sleep "$INTERVAL"
done

