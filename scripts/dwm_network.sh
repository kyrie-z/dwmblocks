#!/bin/bash

# A dwm_bar function to show the current network connection/SSID, private IP, and public IP
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: NetworkManager, curl

source /home/zzl/github/dwmblocks/scripts/dwm_func.sh 

case $BUTTON in
    1) run_or_kill "st-mini -c float-st -t top -g 40x5-400 -e bash-loop 'get-ip'" ;;
    3) notify-send "test";;
esac


dwm_network () {
    CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
    if [ "$CONNAME" = "" ]; then
        CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
    fi

    PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
    #PUBLIC=$(curl -s https://ipinfo.io/ip)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [[ "$(nmcli -a)" == *"Wired connection"* ]];then
            printf " %s %s" "$CONNAME" "$PRIVATE"
        else
            printf "直%s %s" "$CONNAME" "$PRIVATE"
        fi
    else
        printf "NET %s %s" "$CONNAME" "$PRIVATE"
    fi
    printf "%s\n" "$SEP2"
}

dwm_network
