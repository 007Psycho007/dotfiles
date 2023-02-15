#!/bin/bash

bash $HOME/.screenlayout/start.sh &
setxkbmap -option caps:escape &
streamdeck -n &
feh --no-fehbg --bg-fill $HOME/.config/i3/wp.png &
picom -f &
