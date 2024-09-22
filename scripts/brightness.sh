msgID="2346"

if [[ "$1" == "up" ]]; then
    brightnessctl set 5%+
    dunstify  "󰃞    Brightness UP " -t 800 -r $msgID
elif [[ "$1" = "down" ]]; then
    brightnessctl set 5%-
    dunstify  "󰃟     Brightness DOWN " -t 800 -r $msgID
elif [[ "$1" = "max" ]]; then
    brightnessctl set 100%+
    dunstify  "󰃠     Brightness MAX " -t 800 -r $msgID
fi
