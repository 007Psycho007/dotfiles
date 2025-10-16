#!/bin/bash

# Get current player status (e.g., "Playing", "Paused", "Stopped")
status=$(playerctl status 2>/dev/null)

# Choose icons — you can change these to whatever you prefer
icon_playing="  "
icon_paused="  "
icon_stopped="  "

# Output the appropriate icon for Waybar
case "$status" in
    "Playing")
        echo "$icon_playing"
        ;;
    "Paused")
        echo "$icon_paused"
        ;;
    *)
        echo "$icon_stopped"
        ;;
esac
