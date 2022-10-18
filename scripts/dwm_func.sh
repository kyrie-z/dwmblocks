#!/bin/bash


run_or_kill () {
    cmd=$1
    judge="ps -ef | grep \"$cmd\" | grep -v grep"
    judge=${judge//\'/}  # 删除命令中 ' 符号
    if [ "`eval $judge`" = "" ]; then
      eval $cmd #执行命令
    else
      ps -ef | grep "${cmd//\'/}" | grep -v grep | awk '{print $2}' | xargs kill #杀死进程
    fi
}
