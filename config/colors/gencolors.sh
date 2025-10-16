#!/usr/bin/env bash
# Generates color configs for Kitty, Waybar, and Hyprland from one source

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
cat > ~/.config/waybar/colors.css <<EOF
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

cat > ~/.config/hypr/colors.conf <<EOF
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

echo "Colors updated. Reload Hyprland to apply: hyprctl reload"
