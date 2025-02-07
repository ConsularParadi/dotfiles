# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This script sets up your terminal in Fedora OS.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up repos'
echo -e "--------------------------------------------------------------------------------"

repos=""

while read line;do
repos="${repos} $line"
done < terminal.copr

$DNF_COPRE $repos

echo -e "--------------------------------------------------------------------------------"
echo -e 'Installing base packages'
echo -e "--------------------------------------------------------------------------------"

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < terminal.dnf 

$DNF_IY $pkgs


echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up the shell and multiplexer'
echo -e "--------------------------------------------------------------------------------"

echo "Enter /usr/bin/fish"
chsh

sudo ln -s $SRCDIR/apps.bak/Zellij* /usr/local/bin/zellij


echo -e "--------------------------------------------------------------------------------"
echo -e 'Syncing configs'
echo -e "--------------------------------------------------------------------------------"

mv ~/.config/fish ~/.config/fish.original
ln -s $SRCDIR/config.bak/fish ~/.config/fish

ln -s $SRCDIR/config,bak/alacritty ~/.config/alacritty 
echo "x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
