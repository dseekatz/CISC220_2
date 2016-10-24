#!/bin/bash

oldIFS="$IFS"
IFS=$'\n'
processList=($(ps axo comm,pid,ppid,start,user | awk 'NR>1 {print $0}' | sort -n -k 3,3 -k 2,2))
IFS="$oldIFS"

for (( i=1; i<=${#processList[*]}; i++ )) ; do
	echo "${processList[i]}"
done
