#!/bin/bash

# Get the list of processes and sort them by PPID, then by PID
oldIFS="$IFS"
IFS=$'\n'
processList=($(ps axo comm,pid,ppid,start,user | awk 'NR>1 {print $1 " PID:" $2 " PPID:" $3 " Started:" $4 " by:" $5}'))
IFS="$oldIFS"

# Get a list of just the process IDs
for (( i=0; i<=${#processList[*]}; i++ )) ; do
	processIDs[i]=$(echo "${processList[i]}" | awk '{print $2}')
done

# Display the tree
for (( i=0; i<=${#processList[*]}; i++ )) ; do
	echo "${processList[i]}"
done

#for (( i=0; i<=${#processIDs[*]}; i++ )) ; do
#	echo "${processIDs[i]}"
#done
