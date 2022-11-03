#!/bin/bash


source /home/zzl/github/dwmblocks/scripts/dwm_func.sh 

case $BUTTON in
    1) run_or_kill "st-mini -c float-st -t top -g 40x5-500 -e bash-loop 'get-ip'" ;;
    3) notify-send "test";;
esac



function get_bytes {
    interface=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5}')
    line=$(grep $interface /proc/net/dev | cut -d ':' -f2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
    eval $line
    now=$(date +%s%N)
}


function get_velocity {
    value=$1
    old_value=$2
    now=$3
    timediff=$(($now - $old_time))
    velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
    if test "$velKB" -gt 1024
    then
        echo $(echo "scale=2; $velKB/1024" |bc)MB/s
    else
        echo ${velKB}KB/s
    fi
}

get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

get_bytes

vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

if [[ "$(nmcli -a)" == *"Wired connection"* ]];then
#    printf " %s %s" "$CONNAME" "$PRIVATE"
    echo " $vel_recv⬇ $vel_trans⬆"
else
#    printf "直%s %s" "$CONNAME" "$PRIVATE"
    echo "直 $vel_recv⬇ $vel_trans⬆"
fi
#echo "$vel_recv⬇ $vel_trans⬆"
