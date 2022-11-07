#!/bin/bash

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Date is formatted like like this: "[Mon 01-01-00 00:00:00]"

source /home/zzl/github/dwmblocks/scripts/dwm_func.sh

case $BUTTON in
    1)  wight="22"
        x=`xdotool getmouselocation --shell | grep X= | sed 's/X=//'`
        offset=$[x-(wight/2*7)] 
        run_or_kill "st-mini -c float-st -t date -g ${wight}x10+$offset -e bash-loop 'ncal -M'" ;;
    # 1) notify-send "`curl -s wttr.in/wuhan?format=1`";;
esac


dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " %s" "$(date "+%Y-%d-%m %T %a")"
    else
        printf "DAT %s" "$(date "+%a %d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
