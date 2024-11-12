time=2500

if [[ "$1" == "up" ]]; then
    brightnessctl set 5%+
    notify-send -u normal -p -t $time "󰃞  Brightness UP " "Keeps getting brighter" 
elif [[ "$1" = "down" ]]; then
    brightnessctl set 5%- > /dev/null
    notify-send -u normal -t $time "󰃟     Brightness DOWN " "Keeps getting darker" 
elif [[ "$1" = "max" ]]; then
    brightnessctl set 100%
    notify-send -u normal -t $time "󰃠     Brightness MAX " "Always up" 
elif [[ "$1" = "min" ]]; then
    brightnessctl set 5%
    notify-send -u normal -t $time "󰃠     Brightness MIN " "Soon it will be brighter days" 
else
    notify-send -u critical -t $time "Unknown brightness command" "Why did you send this: $1" 
fi
