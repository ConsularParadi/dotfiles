# !/bin/bash

SYM_PATH=$1
TGT_PATH=$2

function envvars {
export USER="consularparadi"
export HOME="/home/$USER"
export PM="yay"
export YAY_IY="${PM} -S"
export YAY_RMY="${PM} -R"
export PAC_YAY_UP="sudo pacman -Syu && yay -Syu"

export FLAT_IY="sudo flatpak install -y flathub"

export DOTDIR="$HOME/.dotfiles"
export SRCDIR="`pwd`"
}


function yesno {
read -p "Do you wish to continue?[y/n] " -n 1 yn
case $yn in
y|Y ) echo -e "\nProceeding"; break;;
n|N ) echo -e "\nExiting"; exit;;
* ) echo -e "\nInvalid response"; exit;;
esac
}


function check_sudo {
if [ $EUID -ne 0 ]
        then
                echo "This program must be run as root to function." 
                exit 1
fi
}


function cdback {
cd - 1> /dev/null
}

function symln {
	echo "Inside Symln"
	echo $SYM_PATH $TGT_PATH
	sudo [ ! -e $TGT_PATH ] && sudo ln -s $SYM_PATH $TGT_PATH
}
	
