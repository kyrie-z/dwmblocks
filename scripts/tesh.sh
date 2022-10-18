#!/bin/bash
switch_window () {
    cmd=$1
    judge="ps -ef | grep \"$cmd\" | grep -v grep"
    judge=${judge//\'/}
    echo $judge
    if [ "`eval $judge`" = "" ]; then
      eval $cmd #执行命令
    else
      ps -ef | grep "${cmd//\'/}" | grep -v grep | awk '{print $2}' | xargs kill #杀死进程
    fi
}

cmd="float-st -c float-st -g 60x25-300 -e top"
cmd="float-st -c float-st -g 130x40-0 -e ./bash-loop 'curl -s wttr.in/wuhan'"
#switch_window "$cmd"

source ./dwm_script_func.sh
run_or_kill "$cmd"



#$1
#curl -s wttr.in/wuhan
#
#while true
#do
#  read -n1 -p " press exit..." char
#  exit 0
#done
