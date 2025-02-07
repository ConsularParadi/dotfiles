# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This is the base system installation script for Fedora OS.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Configuring System'
echo -e "--------------------------------------------------------------------------------"

$DNF_IY dnf-plugins-core util-linux-user cmake gcc python3-devel cronie cronie-anacron

unlink $HOME/.dotfiles
ln -s $DOTDIR $HOME/.dotfiles

systemctl start crond && systemctl enable crond

cd /etc
sudo rm -rf cron.hourly cron.daily cron.weekly cron.monthly
sudo ln -s $SRCDIR/cron.bak/hourly ./cron.hourly
sudo ln -s $SRCDIR/cron.bak/daily ./cron.daily
sudo ln -s $SRCDIR/cron.bak/weekly ./cron.weekly
sudo ln -s $SRCDIR/cron.bak/monthly ./cron.monthly
cdback


echo "--------------------------------------------------------------------------------"
echo 'Installing base packages'
echo "--------------------------------------------------------------------------------"

# DNF
pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < base.dnf

$DNF_IY $pkgs

# FLATPAK
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < base.flat
$FLAT_IY $pkgs

# RPM
$DNF_IY $SRCDIR/apps.bak/NoMachine*

echo -e "--------------------------------------------------------------------------------"
echo -e 'Running cleanup'
echo -e "--------------------------------------------------------------------------------"
pkgs=""
while read line; do
pkgs="${pkgs} $line"
done < base.rmv
$DNF_RMY $pkgs

echo "x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
