#!/bin/bash

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

source /home/zzl/github/dwmblocks/scripts/dwm_func.sh

#case $BUTTON in
#    1)  wight="20"
#        x=`xdotool getmouselocation --shell | grep X= | sed 's/X=//'`
#        offset=$[x-(wight/2*7)]
#        run_or_kill "st-mini -c float-st -t weather -g ${wight}x2+$offset -e bash-loop 'battery -a'";;
#esac

dwm_battery () {
    # Change * to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT*/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT*/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Discharging" -a "$CHARGE" = "Full" ];then
                printf " "
        else
          if [ "$STATUS" = "Charging" ]; then
              printf " %s%%" "$CHARGE"
          elif [ "$STATUS" = "" ]; then
              printf " " 
          else
              printf " %s%%" "$CHARGE"
          fi
        fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

#dwm_battery

STATUS=$(cat /sys/class/power_supply/BAT*/status)
if [ "$STATUS" = "Charging" ]; then
    echo " $(battery)"
elif [ "$STATUS" = "" ]; then
    echo " $(battery)" 
else
    echo " $(battery)"
fi
