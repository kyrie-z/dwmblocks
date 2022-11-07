#!/bin/bash


# ${cmd%+*} , 由于offset不是固定值，只取+号前面字符串。
# 例：cmd    = st-mini -c float-st -t top -g 44x5+offset -e bash-loop get-ip
#     cmd%+* = st-mini -c float-st -t top -g 44x5

run_or_kill () {
    cmd=$1
    judge="ps -ef | grep \"${cmd%+*}\" | grep -v grep"
    judge=${judge//\'/}  # 删除命令中 ' 符号
    if [ "`eval $judge`" = "" ]; then
      eval $cmd #执行命令
    else
      ps -ef | grep "${cmd%+*}" | grep -v grep | awk '{print $2}' | xargs kill #杀死进程
    fi
}
