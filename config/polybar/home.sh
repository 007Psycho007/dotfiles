#!/bin/bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar -c $HOME/.config/polybar/own/config.ini main &
polybar -c $HOME/.config/polybar/own/config.ini second &
