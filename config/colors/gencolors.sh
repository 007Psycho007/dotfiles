#!/usr/bin/env bash
# Generates color configs for Kitty, Waybar, and Hyprland from one source
set -euo pipefail

# --- Paths (change if you keep a different layout) ---
BASE_DIR="$HOME/.config/colors"
THEMES_DIR="$BASE_DIR/themes"
CURRENT_ENV="$BASE_DIR/current.env"
WALL_DIR="$HOME/.config/files"          # where we keep the "active" wallpaper
# (hyprpaper/swww/etc. can point here)

usage() {
  cat <<EOF
Usage: $(basename "$0") <theme-name>

Example:
  $(basename "$0") cyberpunk

This looks for:
  - \$THEMES_DIR/<theme-name>/colors.env
  - \$THEMES_DIR/<theme-name>/wall.(png|jpg|jpeg|webp|bmp)

Then it:
  - copies colors.env -> $CURRENT_ENV
  - copies wallpaper  -> $WALL_DIR/current.<ext>

Current config:
  THEMES_DIR = $THEMES_DIR
  CURRENT_ENV= $CURRENT_ENV
  WALL_DIR   = $WALL_DIR
EOF
}

# List available themes (those with a colors.env)
list_themes() {
  echo "Available themes:"
  shopt -s nullglob
  local had=0
  for d in "$THEMES_DIR"/*/ ; do
    if [[ -f "$d/colors.env" ]]; then
      had=1
      printf "  - %s\n" "$(basename "$d")"
    fi
  done
  shopt -u nullglob
  [[ $had -eq 1 ]] || echo "  (none found in $THEMES_DIR)"
}

# --- Arg parsing ---
if [[ $# -lt 1 ]] || [[ "${1:-}" == "-h" ]] || [[ "${1:-}" == "--help" ]]; then
  usage
  echo
  list_themes
  exit 0
fi

# ---- Zen/Firefox colors.css (userChrome) ----
write_zen_colors() {
  # Find active profile's chrome dir; if you know it, set ZEN_CHROME explicitly.
  local ZEN_CHROME="${ZEN_CHROME:-$HOME/.mozilla/firefox}"  # fallback path style
  local target=""
  # Try to auto-pick the default profile
  if [[ -d "$ZEN_CHROME" ]]; then
    # Grab the profile that has a chrome/ dir or the one marked default in installs.ini
    target="$(find "$ZEN_CHROME" -maxdepth 1 -type d -name '*.default*' | head -n1)"
  fi
  # Allow explicit override
  target="${ZEN_CHROME_OVERRIDE:-$target}"

  if [[ -z "$target" || ! -d "$target" ]]; then
    echo "• Skipping Zen colors: could not locate profile. Set ZEN_CHROME_OVERRIDE to your profile dir."
    return 0
  fi

  mkdir -p "$target/chrome"

  # helper to read env with fallback
  get() { local n="$1" d="$2"; eval "printf '%s' \"\${$n:-$d}\""; }

  cat > "$target/chrome/colors.css" <<EOF
:root{
  --bg:       $(get COLOR_BACKGROUND "#1a1b26");
  --bg-alt:   $(get COLOR_BG_ALT "#24283b");
  --bg-alt2:  $(get COLOR_BG_ALT2 "#313244");
  --fg:       $(get COLOR_FOREGROUND "#c0caf5");
  --fg-alt:   $(get COLOR_FG_ALT "#a9b1d6");
  --fg-alt2:  $(get COLOR_FG_ALT2 "#bac2de");
  --black:    $(get COLOR_BLACK "#15161e");
  --gray:     $(get COLOR_GRAY "#585b70");
  --red:      $(get COLOR_RED "#f7768e");
  --green:    $(get COLOR_GREEN "#9ece6a");
  --yellow:   $(get COLOR_YELLOW "#e0af68");
  --blue:     $(get COLOR_BLUE "#7aa2f7");
  --magenta:  $(get COLOR_MAGENTA "#bb9af7");
  --cyan:     $(get COLOR_CYAN "#7dcfff");
  --white:    $(get COLOR_WHITE "#a9b1d6");
  --accent:   $(get COLOR_ACCENT "#7aa2f7");
}
EOF

  echo "✓ Wrote Zen colors: $target/chrome/colors.css"
}


THEME_NAME="$(basename -- "$1")"    # sanitize (no path traversal)
THEME_DIR="$THEMES_DIR/$THEME_NAME"
ENV_SRC="$THEME_DIR/colors.env"

if [[ ! -d "$THEME_DIR" ]]; then
  echo "Error: theme '$THEME_NAME' not found at $THEME_DIR" >&2
  echo
  list_themes
  exit 1
fi
if [[ ! -f "$ENV_SRC" ]]; then
  echo "Error: $ENV_SRC is missing (each theme must provide colors.env)" >&2
  exit 1
fi

# --- Ensure target dirs exist ---
mkdir -p "$BASE_DIR"
mkdir -p "$WALL_DIR"

# --- Copy colors.env ---
cp -f "$ENV_SRC" "$CURRENT_ENV"
echo "✓ Copied palette: $ENV_SRC  ->  $CURRENT_ENV"

# --- Copy wallpaper (best-match extension) ---
wall_src=""
for ext in png jpg jpeg webp bmp; do
  cand="$THEME_DIR/wall.$ext"
  if [[ -f "$cand" ]]; then
    wall_src="$cand"
    break
  fi
done

if [[ -n "$wall_src" ]]; then
  ext="${wall_src##*.}"
  wall_dst="$WALL_DIR/wall.$ext"
  cp -f "$wall_src" "$wall_dst"
  echo "✓ Copied wallpaper: $wall_src  ->  $wall_dst"
else
  echo "• No wallpaper found in $THEME_DIR (looked for wallpaper.(png|jpg|jpeg|webp|bmp))"
fi
source ~/.dotfiles/config/colors/current.env

# --- Generate Kitty Colors ---
cat > ~/.dotfiles/config/kitty/colors.kitty <<EOF
background ${COLOR_BACKGROUND}
foreground ${COLOR_FOREGROUND}
color0 ${COLOR_BLACK}
color1 ${COLOR_RED}
color2 ${COLOR_GREEN}
color3 ${COLOR_YELLOW}
color4 ${COLOR_BLUE}
color5 ${COLOR_MAGENTA}
color6 ${COLOR_CYAN}
color7 ${COLOR_WHITE}
color8 ${COLOR_WHITE}
selection_background ${COLOR_BLUE}
cursor ${COLOR_ACCENT}
EOF

# --- Generate Waybar colors (GTK CSS) ---
cat > ~/.dotfiles/config/waybar/colors.css <<EOF
@define-color color-background ${COLOR_BACKGROUND};
@define-color color-surface ${COLOR_SURFACE};
@define-color color-foreground ${COLOR_FOREGROUND};
@define-color color-accent ${COLOR_ACCENT};
@define-color color-red ${COLOR_RED};
@define-color color-green ${COLOR_GREEN};
@define-color color-yellow ${COLOR_YELLOW};
@define-color color-blue ${COLOR_BLUE};
@define-color color-magenta ${COLOR_MAGENTA};
@define-color color-cyan ${COLOR_CYAN};
EOF
# --- Generate Hyprland Colors ---
strip_hash() { echo "${1#\#}"; }

cat > ~/.dotfiles/config/hypr/colors.conf <<EOF
\$color_bg = rgb($(strip_hash "$COLOR_BACKGROUND"))
\$color_fg = rgb($(strip_hash "$COLOR_FOREGROUND"))
\$color_accent = rgb($(strip_hash "$COLOR_ACCENT"))
\$color_red = rgb($(strip_hash "$COLOR_RED"))
\$color_green = rgb($(strip_hash "$COLOR_GREEN"))
\$color_yellow = rgb($(strip_hash "$COLOR_YELLOW"))
\$color_blue = rgb($(strip_hash "$COLOR_BLUE"))
\$color_magenta = rgb($(strip_hash "$COLOR_MAGENTA"))
\$color_cyan = rgb($(strip_hash "$COLOR_CYAN"))
EOF

# write palette.toml for starship
cat > ~/.dotfiles/config/starship/palette.toml <<EOF
[palettes.tokyonight]
bg      = "${COLOR_BACKGROUND}"
fg      = "${COLOR_FOREGROUND}"
bgdim   = "${COLOR_BLACK}"
accent  = "${COLOR_ACCENT}"
black   = "${COLOR_BLACK}"
red     = "${COLOR_RED}"
green   = "${COLOR_GREEN}"
yellow  = "${COLOR_YELLOW}"
blue    = "${COLOR_BLUE}"
magenta = "${COLOR_MAGENTA}"
cyan    = "${COLOR_CYAN}"
white   = "${COLOR_WHITE}"
EOF

# stitch final config
cat ~/.dotfiles/config/starship/starship.toml ~/.dotfiles/config/starship/palette.toml > ~/.dotfiles/config/starship/starship-generated.toml

# Change Rofi Colors
cat > ~/.dotfiles/config/rofi/colors.rasi <<EOF
* {
  bg:       ${COLOR_BACKGROUND};
  bg-alt:   ${COLOR_SURFACE};
  fg:       ${COLOR_FOREGROUND};
  fg-alt:   ${COLOR_WHITE};
  accent:   ${COLOR_ACCENT};
  red:      ${COLOR_RED};
  green:    ${COLOR_GREEN};
  yellow:   ${COLOR_YELLOW};
  blue:     ${COLOR_BLUE};
  magenta:  ${COLOR_MAGENTA};
  cyan:     ${COLOR_CYAN};
}
EOF

awk -v bg="$COLOR_BACKGROUND" \
    -v fg="$COLOR_FOREGROUND" \
    -v accent="$COLOR_ACCENT" \
    -v red="$COLOR_RED" '
function hex2rgb(h,   r,g,b) {
  sub(/^#/,"",h)
  r = strtonum("0x" substr(h,1,2))
  g = strtonum("0x" substr(h,3,2))
  b = strtonum("0x" substr(h,5,2))
  return "rgb(" r "," g "," b ")"
}
BEGIN {
  bg_rgb     = hex2rgb(bg)
  fg_rgb     = hex2rgb(fg)
  accent_rgb = hex2rgb(accent)
  red_rgb    = hex2rgb(red)

  print "#########################################"
  print "# ~/.config/hypr/hyprlock.conf"
  print "# Self-contained: palette + config (no import)"
  print "#########################################\n"
  print "# ---- BEGIN AUTO-GENERATED PALETTE (from central scheme) ----"
  print "$bg        = " bg_rgb "   # " bg
  print "$fg        = " fg_rgb "   # " fg
  print "$accent    = " accent_rgb "   # " accent
  print "$red       = " red_rgb "   # " red
  print "$bg_hex     = " bg
  print "$fg_hex     = " fg
  print "$accent_hex = " accent
  print "$red_hex    = " red
  print "# ---- END AUTO-GENERATED PALETTE ----\n"
}
{ print }
' ~/.config/hypr/hyprlock.body.conf > ~/.config/hypr/hyprlock.conf

~/.config/dunst/rebuild.sh
write_zen_colors
echo "Colors updated. Reloading applications"

# ---------- helpers (no systemd) ----------
kill_proc() {
  # kill all PIDs of given executable name quietly
  local exe="$1"
  pkill -x "$exe" >/dev/null 2>&1 || true
  # wait up to 2s for it to die
  for _ in {1..20}; do
    pgrep -x "$exe" >/dev/null || return 0
    sleep 0.1
  done
}

spawn_bg() {
  # run command detached w/ inherited env
  nohup "$@" >/dev/null 2>&1 &
}

# ---------- Hyprland reload ----------
if command -v hyprctl >/dev/null 2>&1; then
  hyprctl reload >/dev/null 2>&1 || true
  echo "↻ Hyprland reloaded"
else
  echo "• hyprctl not found; skip Hyprland reload"
fi

# ---------- hyprpaper restart (no systemd) ----------
HYPRPAPER_CMD="${HYPRPAPER_CMD:-hyprpaper}"
if command -v hyprpaper >/dev/null 2>&1; then
  kill_proc "hyprpaper"
  spawn_bg $HYPRPAPER_CMD
  echo "↻ hyprpaper restarted"
else
  echo "• hyprpaper not installed; skip"
fi

pkill cava
# ---------- Waybar restart (no systemd) ----------
WAYBAR_CMD="${WAYBAR_CMD:-waybar}"
if command -v waybar >/dev/null 2>&1; then
  kill_proc "waybar"
  spawn_bg $WAYBAR_CMD
  echo "↻ Waybar restarted"
else
  echo "• waybar not installed; skip"
fi

pkill -x dunst >/dev/null 2>&1 || true
nohup dunst >/dev/null 2>&1 &
echo "↻ dunst restarted"

# ---------- optional notify ----------
if command -v notify-send >/dev/null 2>&1; then
  notify-send "Theme switched" "Now using: ${THEME_NAME}" -t 2000
fi

source ~/.config/colors/current.env
echo "✓ Done."
