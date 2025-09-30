#!/bin/sh

bash $HOME/.screenlayout/start.sh &
setxkbmap -option caps:escape &
streamdeck -n &
picom -f --config ~/.config/picom/picom.conf &
if [ -f "/usr/bin/noisetorch" ]; then
    noisetorch -s alsa_input.usb-M-Audio_AIR_192_6-00.analog-stereo -i
fi
kitty &
kitty &
kitty &
pacman -Syy
