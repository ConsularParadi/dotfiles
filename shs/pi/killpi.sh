#!/bin/bash

while read line
do
	if ping -c 2 $line
	then
       		SSHPASS='raspberry' sshpass -e ssh pi@$line 'bash -s' < kill.sh
	fi
done < pi.txt
