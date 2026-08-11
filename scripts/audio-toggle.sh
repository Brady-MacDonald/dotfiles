#!/bin/bash
# Toggle the default audio sink between HDMI monitor speakers and the front
# headphone jack (routed via the analog "line out" path, which is what actually
# drives the front-panel jack on this machine).

set -u

HDMI="alsa_output.pci-0000_05_00.1.hdmi-stereo-extra1"
ANALOG="alsa_output.pci-0000_05_00.6.analog-stereo"

CUR="$(pactl get-default-sink 2>/dev/null)"

if [ "$CUR" = "$HDMI" ]; then
  TARGET="$ANALOG"
  TARGET_LABEL="front headphones"
else
  TARGET="$HDMI"
  TARGET_LABEL="HDMI speakers"
fi

pw-metadata -n default 0 default.configured.audio.sink "{\"name\":\"$TARGET\"}" >/dev/null
pw-metadata -n default 0 default.audio.sink "{\"name\":\"$TARGET\"}" >/dev/null

if [ "$TARGET" = "$ANALOG" ]; then
  pactl set-sink-port "$ANALOG" analog-output-lineout >/dev/null 2>&1
fi

echo "Audio switched to: $TARGET_LABEL"
command -v notify-send >/dev/null && notify-send -t 1500 "Audio" "Switched to $TARGET_LABEL"
