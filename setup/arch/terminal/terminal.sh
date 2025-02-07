source ../utils.sh


CWD=`pwd`
echo $CWD

envvars

echo -e 'This script sets up your terminal with necessary tools, changes emulator to ALACRITTY and sets XONSH/FISH shell as default'
yesno

echo "--------------------------------------------------------------------------------"
echo 'Installing required dependencies'
echo "--------------------------------------------------------------------------------"


echo "--------------------------------------------------------------------------------"
echo 'Adding Repositories'
echo "--------------------------------------------------------------------------------"

echo "--------------------------------------------------------------------------------"
echo 'Installing packages using yay'
echo "--------------------------------------------------------------------------------"

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < terminal.yay

$YAY_IY $pkgs

#echo "--------------------------------------------------------------------------------"
#echo 'Installing packages using cargo'
#echo "--------------------------------------------------------------------------------"

#pkgs=""

#while read line;do
#pkgs="${pkgs} $line"
#done < cargo-apps.txt

#$ciy $pkgs

echo "--------------------------------------------------------------------------------"
echo 'Syncing Dotfiles'
echo "--------------------------------------------------------------------------------"

[ ! -e $HOME/.config/.bak ] && mkdir $HOME/.config/.bak

while read line;do
[ -f $HOME/.config/$line ] && mv $HOME/.config/$line $HOME/.config/.bak/
[ -L $HOME/.config/$line ] && unlink $HOME/.config/$line
ln -s $DOTDIR/config/$line $HOME/.config/
done < terminal.dot

echo "--------------------------------------------------------------------------------"
echo 'Setting up services'
echo "--------------------------------------------------------------------------------"

chsh -s /usr/bin/fish
[ ! -L /usr/local/bin/zellij ] && sudo ln -s ~/.dotfiles/Apps/zellij /usr/local/bin/zellij
