# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This is the configuration script for Gnome DE on Fedora OS.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Installing base packages'
echo -e "--------------------------------------------------------------------------------"

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < gnome.dnf

$DNF_IY $pkgs

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < gnome.pipx

pipx install $pkgs


echo "--------------------------------------------------------------------------------"
echo 'Setting up extensions'
echo "--------------------------------------------------------------------------------"

exts=""

while read line;do
exts="${exts} $line"
done < gnome.gext

gext i $exts


echo "x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
