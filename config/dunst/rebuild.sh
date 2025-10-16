#!/usr/bin/env bash
set -euo pipefail
# 1) Load your central palette
source "$HOME/.config/colors/current.env"
# 2) Render the template -> dunstrc
envsubst < "$HOME/.dotfiles/config/dunst/dunstrc.template" > "$HOME/.dotfiles/config/dunst/dunstrc"
# 3) Restart dunst (no systemd)
pkill dunst 2>/dev/null || true
nohup dunst >/dev/null 2>&1 &
echo "dunst reloaded with central colors."

