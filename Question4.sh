#!/bin/bash

# This program will loop through all of the IP addresses belonging to Queen's (130.15.00.00 - 130.15.255.255)
# and it will print all addresses that were assigned a name.
# ***THIS PROGRAM TAKES A LOT OF TIME TO RUN***
# Completed by Simon Ungar, Wednesday October 26th, 2016

# The outer loop iterates through 130.15.0-255
for n in {0..255}; do
# The inner loop iterates through 130.15.###.0-255
	for m in {0..255}; do
# Each IP address is searched for using nslookup, and then the line containing the name is piped into awk, which selects just the name.
		addr=$(nslookup 130.15.$n.$m | grep 'name = ' | awk '{print $4}')
# If the name is not empty, then it is printed out along with the IP.
		if ((${#addr}!=0));then
			echo 130.15.$n.$m = $addr;
		fi
	done
done


