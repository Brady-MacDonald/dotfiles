#!/bin/bash

# Stop running waybar
killall -q waybar

# wait for process to shut down
while pgrep -x waybar >/dev/null; do sleep 1; done

# launch waybar (in background process)
waybar &

# check for additional monitor
# if [[ $(xrandr -q | grep "HDMI-1 connected") ]]; then
# 	polybar external &
# fi
