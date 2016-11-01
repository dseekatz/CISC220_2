#!/bin/bash
#David Seekatz 	    16das4 20037710
#Sean Eylott	    13se18 10141657
#Simon Ungar         14seau 10149546
#Brooke Resendes     13brr2 10141112

# Question1
# This script lists all active processes.  If a process has children, then its children are listed underneath it.
# Note that this is not a true process "tree", as many processes are listed more than once.

# Get the list of processes and format it.
oldIFS="$IFS"
IFS=$'\n'
processList=$(ps axo comm,pid,ppid,start,user | awk 'NR>1 {print $1 " PID:" $2 " PPID:" $3 " Started:" $4 " by:" $5}')

# This is the recursive function that prints the process list
function processSort {
	for line in $* ; do
		echo "$line"
		pid=$(echo "$line" | awk '{print "P" $2}')		# Get the PID for the current process
		myVar=$(echo "${processList[*]:1}" | grep "$pid")	# Get processes which have PPID=PID
		processSort $myVar					# Run the function on those processes
	done
}

processSort $processList

#Put the IFS back to normal
IFS=$oldIFS
