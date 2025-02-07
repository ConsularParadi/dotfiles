# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This is the configuration script for Gnome DE on Arch linux.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Installing base packages'
echo -e "--------------------------------------------------------------------------------"

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < gnome.yay

$YAY_IY $pkgs

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

pipx run gnome-extensions-cli i $exts


echo "x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
