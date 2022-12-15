#!/bin/bash
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down 
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


export MONITOR_1=DP-1-3
export MONITOR_2=DP-1-2
export MONITOR_3=eDP-1

source $HOME/.config/polybar/block/theme.sh
polybar -c $HOME/.config/polybar/block/config.ini main &
polybar -c $HOME/.config/polybar/block/config.ini second &
