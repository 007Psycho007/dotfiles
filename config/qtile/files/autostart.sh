#!/bin/bash

bash $HOME/.screenlayout/start.sh &
setxkbmap -option caps:escape &
streamdeck -n &
picom -f &
if [ -f "/usr/bin/noisetorch" ]; then
    noisetorch -s alsa_input.usb-M-Audio_AIR_192_6-00.analog-stereo -i
fi
kitty &
kitty &
kitty &
