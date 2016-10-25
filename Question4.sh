#!/bin/bash

for n in {0..255}; do
	for m in {0..255}; do  
		addr=$(nslookup 130.15.$n.$m | grep 'name = ' | awk '{print $4}')
		if ((${#addr}!=0));then
			echo 130.15.$n.$m = $addr;
		fi
	done
done


