#!/bin/bash

msgID="2345"
val=$1

# Toggle Mute
if [[ "$val" == "mute" ]]; then
    mute="$(wpctl get-volume @DEFAULT_SINK@ | awk -F ' ' '{print $3}')"
    wpctl set-mute @DEFAULT_SINK@ toggle
    if [[ "$mute" == "[MUTED]" ]]; then
        dunstify  "     OFF MUTE " -t 800 -r $msgID
    else
        dunstify  "     MUTED " -t 800 -r $msgID
    fi

# Inc/Dec Volume
else
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    if [[ "$val" == "up" ]]; then
        wpctl set-volume @DEFAULT_SINK@ 5%+
    elif [[ "$val" == "down" ]]; then
        wpctl set-volume @DEFAULT_SINK@ 5%-
    fi

    volume="$(wpctl get-volume @DEFAULT_SINK@)"
    vol_val=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9' | sed 's/^0\{1,2\}//')
    echo $vol_val

    if [ "$vol_val" -lt 33 ]; then
        dunstify  "    $volume" -t 800 -r $msgID
    elif [ "$vol_val" -lt 76 ]; then
        dunstify  "    $volume" -t 800 -r $msgID
    elif [ "$vol_val" -lt 133 ]; then
        dunstify  "    $volume" -t 800 -r $msgID
    else
        dunstify  "        $volume" -t 800 -r $msgID
    fi
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"
