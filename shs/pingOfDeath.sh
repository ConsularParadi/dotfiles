#!/bin/bash

ip=$1

for i in range 1..10
do
	ping -q -s 65500 10.1.17.49&
done
