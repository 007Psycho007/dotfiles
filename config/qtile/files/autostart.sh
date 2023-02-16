#!/bin/bash

bash $HOME/.screenlayout/start.sh &
setxkbmap -option caps:escape &
streamdeck -n &
picom -f &
