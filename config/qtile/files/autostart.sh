#!/bin/bash

bash $HOME/.screenlayout/start.sh &
setxkbmap -option caps:escape &
streamdeck -n &
feh --no-fehbg --bg-fill $HOME/.config/qtile/files/wallpaper.jpg &
picom -f &
