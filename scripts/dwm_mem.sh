#!/bin/bash

# A dwm_bar function to display information regarding system memory, CPU temperature, and storage
# Joe Standring <git@joestandring.com>
# GNU GPLv3

source /usr/local/bin/dwm_func.sh

case $BUTTON in
    1)  wight="90"
        x=`xdotool getmouselocation --shell | grep X= | sed 's/X=//'`
        offset=$[x-(wight/2*7)] 
        run_or_kill "st-mini -c float-st -t mem -g ${wight}x35+$offset -e top" ;;
    3) notify-send "test";;
esac


dwm_resources () {
    # Used and total memory
    MEMUSED=$(free -h | awk '(NR == 2) {print $3}')
    MEMTOT=$(free -h |awk '(NR == 2) {print $2}')

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf " %s/%s" "$MEMTOT" "$MEMUSED" 
    else
        printf "MEM %s/%s " "$MEMTOT" "$MEMUSED" 
    fi
    printf "%s\n" "$SEP2"
}

dwm_resources
