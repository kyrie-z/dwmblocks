#!/bin/bash

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city

source /home/zzl/github/dwmblocks/scripts/dwm_func.sh

case $BUTTON in
    1) run_or_kill "st-mini -c float-st -g 130x40-0 -e /home/zzl/github/dwmblocks/scripts/bash-loop 'curl -s wttr.in/wuhan'";;
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
