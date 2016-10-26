#!/bin/bash

# Get the list of processes and format it.
oldIFS="$IFS"
IFS=$'\n'
processList=$(ps axo comm,pid,ppid,start,user | awk 'NR>1 {print $1 " PID:" $2 " PPID:" $3 " Started:" $4 " by:" $5}')

# This will be the recursive function that sorts the processes into "tree" form.
# Right now it just prints the full process list (unsorted)
function processSort {
	echo "$*"
}

processSort $processList

IFS=$oldIFS
