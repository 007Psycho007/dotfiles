#!/usr/bin/env bash

script_path="${HOME}/.config/scripts/dmenu/scripts"

prompt="-p Menus:"

# list only executable non-binay files

run_dmenu="$(find $script_path/* -maxdepth 1 -type f -executable \
          -exec grep -Iq . {} \; -print \
          | sed 's|^'$script_path/'||' \
          | sort \
          | rofi -dmenu $prompt $lines $colors $font)"

eval "$script_path/$run_dmenu"

exit 0
