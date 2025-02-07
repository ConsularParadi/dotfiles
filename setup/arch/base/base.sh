# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This is the base system installation script for Arch OS.'
echo "--------------------------------INFO--------------------------------------------"

envvars

echo -e 'This script installs basic system packages for Arch Linux OS, changes the default shell to Fish and installs the following packages:-\n1)Vivaldi-browser\n2)Librefox-browser\n3)VS-Code-Insiders'
yesno

echo "--------------------------------------------------------------------------------"
echo 'Installing required dependencies'
echo "--------------------------------------------------------------------------------"

sudo pacman -S cmake gcc
[ ! -e /usr/bin/yay ] && sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si 

echo "--------------------------------------------------------------------------------"
echo 'Adding Repositories'
echo "--------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------"
echo 'Installing packages using yay'
echo "--------------------------------------------------------------------------------"

cd $CWD

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < base.yay

$YAY_IY $pkgs

echo -e "--------------------------------------------------------------------------------"
echo -e 'Installing packages using flatpak'
echo -e "--------------------------------------------------------------------------------"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < base.flat
$FLAT_IY $pkgs


echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up symbolic links'
echo -e "--------------------------------------------------------------------------------"

tgt=$DOTDIR
src="/mnt/data/.dotfiles"
[ ! -L $tgt ] && ln -s $src $tgt

echo -e "--------------------------------------------------------------------------------"
echo -e 'Running helper modules'
echo -e "--------------------------------------------------------------------------------"

#echo -e "--------------------------------------------------------------------------------"
#echo -e 'Setting up required system services'
#echo -e "--------------------------------------------------------------------------------"

#systemctl start crond && systemctl enable crond

#echo -e "--------------------------------------------------------------------------------"
#echo -e 'Setting up cron jobs'
#echo -e "--------------------------------------------------------------------------------"

#cd /etc
#rm -r cron.hourly cron.daily cron.weekly cron.monthly
#ln -s $home/.dotfiles/cron_jobs/hourly ./cron.hourly
#ln -s $home/.dotfiles/cron_jobs/daily ./cron.daily
#ln -s $home/.dotfiles/cron_jobs/weekly ./cron.weekly
#ln -s $home/.dotfiles/cron_jobs/monthly ./cron.monthly
#cd -

echo -e "--------------------------------------------------------------------------------"
echo -e 'Running cleanup'
echo -e "--------------------------------------------------------------------------------"
rm -rf $CWD/yay
#pkgs=""
#while read line; do
#pkgs="${pkgs} $line"
#done < cleanup.txt
#$uy $pkgs
echo "x-x-x-x-x-x-x-x-x-x-x-x-x------Script Ended------x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
