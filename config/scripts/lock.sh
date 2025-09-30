#!/usr/bin/env bash

# Check if XDG_SESSION_TYPE is set to "wayland"
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # Execute hyprlock
    hyprlock
else
    i3lock-color -k \
        --indicator \
        --inside-color 282C34FF \
        --ring-color 61AFEF \
        --insidever-color 61AFEF \
        --ringver-color 61AFEF \
        --insidewrong-color E86681 \
        --ringwrong-color E86671 \
        --keyhl-color 98C379 \
        --bshl-color E86671 \
        -c 282C34FF \
        --time-color 61AFEF \
        --date-color 61AFEF
fi
