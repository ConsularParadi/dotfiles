#!/bin/bash

while read line 
do
	if ping -c 2 $line
	then
		SSHPASS='hehe@boi' sshpass -e ssh pi@$line 'bash -s' < revert.sh
	fi
done < pi.txt
