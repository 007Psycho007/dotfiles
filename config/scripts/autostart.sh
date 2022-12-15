#!/bin/bash

streamdeck -n &
if [ -f "/usr/bin/noisetorch" ]; then
    noisetorch -s alsa_input.usb-M-Audio_AIR_192_6-00.analog-stereo -i
fi
