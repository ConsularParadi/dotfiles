# !/bin/bash

#Imports
source ./utils.sh

check_sudo
envvars

echo -e "This script sets syncs gnome settings using dconf editor and dump file. Also install gnome-specific apps."

yesno

echo "---------------------------------------------------------------------------------"

$iy gnome-tweaks
$fiy ca.desrt.dconf-editor

echo "x-x-x-x-x-x-x-x-x-x-x-x-x------Script Ended------x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"

