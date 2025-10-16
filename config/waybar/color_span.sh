#!/usr/bin/env bash
# Usage: color_span.sh "<icon>" <color>
#  - <icon> : any text/glyph (quote it), e.g. " " or " "
#  - <color>: hex (#RRGGBB), palette key (accent, red, ...), or env name (COLOR_MAGENTA)

# Pull in your central palette (if present)
source ~/.config/colors/current.env 2>/dev/null

# Lowercase helper (bash 4+)
lower() { printf '%s' "$1" | tr '[:upper:]' '[:lower:]'; }

resolve_color() {
  local key="$(lower "$1")"
  case "$key" in
    accent)   echo "${COLOR_ACCENT:-#7aa2f7}" ;;
    fg)       echo "${COLOR_FOREGROUND:-#c0caf5}" ;;
    bg)       echo "${COLOR_BACKGROUND:-#1a1b26}" ;;
    black)    echo "${COLOR_BLACK:-#15161e}" ;;
    red)      echo "${COLOR_RED:-#f7768e}" ;;
    green)    echo "${COLOR_GREEN:-#9ece6a}" ;;
    yellow)   echo "${COLOR_YELLOW:-#e0af68}" ;;
    blue)     echo "${COLOR_BLUE:-#7aa2f7}" ;;
    magenta|purple) echo "${COLOR_MAGENTA:-#bb9af7}" ;;
    cyan)     echo "${COLOR_CYAN:-#7dcfff}" ;;
    white)    echo "${COLOR_WHITE:-#a9b1d6}" ;;
    \#*)      echo "$1" ;;                         # raw hex like #ff00aa
    color_*)  eval "echo \${$1}" ;;                # explicit env var name
    *)        echo "$1" ;;                         # pass-through (named Pango color)
  esac
}

icon="${1:-?}"
color_in="${2:-fg}"
color="$(resolve_color "$color_in")"

# Output Pango markup (Waybar needs escape=false for this module)
printf '<span foreground="%s">%s</span>\n' "$color" "$icon"

