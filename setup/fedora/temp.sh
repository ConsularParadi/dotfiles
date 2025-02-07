#!/usr/bin/bash
if [[ $(/sbin/lspci | grep -e "3D") ]]; then
echo "yes"
else
echo "no"
fi
