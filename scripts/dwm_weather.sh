#!/bin/bash

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city

source /home/zzl/github/dwmblocks/scripts/dwm_func.sh

case $BUTTON in
    1)  wight="130"
        x=`xdotool getmouselocation --shell | grep X= | sed 's/X=//'`
        offset=$[x-(wight/2*7)] 
        run_or_kill "st-mini -c float-st -t weather -g ${wight}x40+$offset -e bash-loop 'curl -s wttr.in/wuhan'";;
esac

dwm_weather() {
    LOCATION=wuhan

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        #printf "%s" "$(curl -s wttr.in/$LOCATION?format=1)"
        printf "%s" "$(curl -s wttr.in/$LOCATION?lang=zh\&format="%C+%t")"
    else
        printf "WEA %s" "$(curl -s wttr.in/$LOCATION?format=1 | grep -o "[0-9].*")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_weather
