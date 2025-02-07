# !/bin/bash

function envvars {
export USER="consularparadi"
export HOME="/home/$USER"
export PM="dnf"

export DNF_IY="sudo ${PM} install -y"
export DNF_RMY="sudo ${PM} remove -y"
export DNF_UP="sudo ${PM} update -y"
export addRepo="sudo ${PM} config-manager --add-repo"
export DNF_COPRE="sudo ${PM} copr enable -y"

export FLAT_IY="flatpak install -y flathub"

export DOTDIR="`cd ../../ && pwd`"
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

function cdback {
cd - 1> /dev/null
}

function check_sudo {
if [ $EUID -ne 0 ]
        then
                echo "This program must be run as root to function." 
                exit 1
fi
}
