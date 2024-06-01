#!/bin/bash

# Stop running polybars
killall -q polybar

# wait for process to shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch polybar (in background process)
polybar main &

# check for additional monitor
if [[ $(xrandr -q | grep "HDMI-1 connected") ]]; then
	polybar external &
fi
