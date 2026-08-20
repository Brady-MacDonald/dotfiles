#!/bin/bash
# Toggle the default audio sink between:
# HDMI monitor speakers, 
# front headphone jack (routed via the analog "line out" path, which is what actually drives the front-panel jack on this machine), 
# JBL Flip 4 Bluetooth speaker
# Cycles: HDMI -> front headphones -> JBL Flip 4 -> HDMI

set -u

HDMI="alsa_output.pci-0000_05_00.1.hdmi-stereo-extra1"
ANALOG="alsa_output.pci-0000_05_00.6.analog-stereo"
BT_MAC="78:5E:A2:AC:F4:73"   # JBL Flip 4
BT="bluez_output.78_5E_A2_AC_F4_73.1"

CUR="$(pactl get-default-sink 2>/dev/null)"

case "$CUR" in
  "$HDMI")
    TARGET="$ANALOG"
    TARGET_LABEL="front headphones"
    ;;
  "$ANALOG")
    TARGET="$BT"
    TARGET_LABEL="JBL Flip 4"
    ;;
  *)
    TARGET="$HDMI"
    TARGET_LABEL="HDMI speakers"
    ;;
esac

bt_sink_present() {
  pactl list short sinks 2>/dev/null | awk '{print $2}' | grep -qx "$BT"
}

# If JBL is selected but not connected, bring it up first and wait for PipeWire to register its sink.
if [ "$TARGET" = "$BT" ] && ! bt_sink_present; then
  echo "Connecting to JBL Flip 4..."
  command -v notify-send >/dev/null && notify-send -t 2000 "Audio" "Connecting to JBL Flip 4..."
  bluetoothctl connect "$BT_MAC" >/dev/null 2>&1
  for _ in $(seq 1 20); do   # wait up to ~10s for the sink to appear
    bt_sink_present && break
    sleep 0.5
  done
  if ! bt_sink_present; then
    echo "Failed to connect to JBL Flip 4" >&2
    command -v notify-send >/dev/null && notify-send -t 3000 -u critical "Audio" "Could not connect to JBL Flip 4"
    exit 1
  fi
fi

pw-metadata -n default 0 default.configured.audio.sink "{\"name\":\"$TARGET\"}" >/dev/null
pw-metadata -n default 0 default.audio.sink "{\"name\":\"$TARGET\"}" >/dev/null

if [ "$TARGET" = "$ANALOG" ]; then
  pactl set-sink-port "$ANALOG" analog-output-lineout >/dev/null 2>&1
fi

echo "Audio switched to: $TARGET_LABEL"
command -v notify-send >/dev/null && notify-send -t 1500 "Audio" "Switched to $TARGET_LABEL"
