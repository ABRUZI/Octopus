#!/bin/bash
#**************************************************************************************************
#*    说明: 此文件为octopus的命令脚本，负责octopus的master与slaver实例的启动停止等维护操作        *
#*          执行方式   sh octopus action[start|stop|evict|active] node[master|slaver]             *
#*          action参数的意义分别是：                                                              *
#*              start:启动 stop:停止 evict:将当前节点从zk中移除 active:讲当前节点注册到zk中       *
#**************************************************************************************************
function printHelp(){
    echo  "Usage: octopus action node"
    echo  "       action is one of : "
    echo  "             start        "
    echo  "             stop         "
    echo  "             evict        "
    echo  "             active       "
    echo  "       node is one of   : "
    echo  "             master       "
    echo  "             slaver       "
}

ACTION_START="start"
ACTION_STOP="stop"
ACTION_EVICT="evict"
ACTIION_ACTIVE="active"
NODE_MASTER="master"
NODE_SLAVER="slaver"

if [[ "$OCTOPUS_HOME" = "" ]] 
then
	OCTOPUS_HOME=$(cd ../;pwd)
	export OCTOPUS_HOME
fi


if [[ $# -ne 2 ]] 
then
	echo "Illegal parameters"
	printHelp
	exit 0
fi

action=$1
node=$2

if [[ "${action}" = "${ACTION_START}" ]] 
then
	if [[ "${node}" = "${NODE_MASTER}" ]] 
	then 
		nohup java -jar ../share/master/*.jar &
	elif [[ "${node}" = "${NODE_SLAVER}" ]] 
	then
		nohup java -jar ../share/slaver/*.jar &
	else
		echo "UNKNOWN node name"
		printHelp
	fi 
elif [[ "${action}" = "${ACTION_STOP}" ]] 
	then 
        if [[ "${node}" = "${NODE_MASTER}" ]] 
	then
                java -classpath ../share/master/*.jar:../share/master/lib/*.jar #todo  shutdown
        elif [[ "${node}" = "${NODE_SLAVER}" ]] 
	then
                java -classpath ../share/slaver/*.jar:../share/slaver/lib/*.jar #todo  shutdown
        else
                echo "UNKNOWN node name"
                printHelp
        fi
elif [[ "${action}" = "${ACTION_EVICT}" ]] 
then
        if [[ "${node}" = "${NODE_MASTER}" ]] 
	then
		java -classpath ../share/master/*.jar:../share/master/lib/*.jar #todo  evict
        elif [[ "${node}" = "${NODE_SLAVER}" ]] 
	then
                java -classpath ../share/slaver/*.jar:../share/slaver/lib/*.jar #todo  evict
        else
                echo "UNKNOWN node name"
                printHelp
        fi
elif [[ "${action}" = "${ACTION_ACTIVE}" ]] 
then
        if [[ "${node}" = "${NODE_MASTER}" ]] 
	then
                java -classpath ../share/master/*.jar:../share/slaver/lib/*.jar #todo  active
        elif [[ "${node}" = "${NODE_SLAVER}" ]] 
	then
                java -classpath ../share/slaver/*.jar:../share/slaver/lib/*.jar #todo  active
        else
                echo "UNKNOWN node name"
                printHelp
        fi
else
	echo "UNKNOWN action name"
	printHelp
fi

exit 0
