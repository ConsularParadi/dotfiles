# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This is the base system installation script for Arch OS.'
echo "--------------------------------INFO--------------------------------------------"

envvars

echo -e 'This script sets up Niri WM, Waybar, Swaylock'
yesno

echo "--------------------------------------------------------------------------------"
echo 'Installing packages using yay'
echo "--------------------------------------------------------------------------------"

cd $CWD

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < wm.yay

$YAY_IY $pkgs

echo "--------------------------------------------------------------------------------"
echo 'Syncing Dotfiles'
echo "--------------------------------------------------------------------------------"

[ ! -e $HOME/.config/.bak ] && mkdir $HOME/.config/.bak

while read line;do
[ -e $HOME/.config/$line ] && mv $HOME/.config/$line $HOME/.config/.bak/
[ -L $HOME/.config/$line ] && unlink $HOME/.config/$line
ln -s $DOTDIR/config/$line $HOME/.config/
done < wm.dot

echo "--------------------------------------------------------------------------------"
echo 'Syncing System Configuration'
echo "--------------------------------------------------------------------------------"

[ ! -e /etc/.bak ] && sudo mkdir /etc/.bak

while read line;do
[ -f /etc/$line ] && sudo mv /etc/$line /etc/.bak/
sudo cp $DOTDIR/config/sys/$line /etc/
done < wm.sys

sudo systemctl stop display-manager
sudo systemctl enable greetd
sudo systemctl enable --now pipewire-pulse
