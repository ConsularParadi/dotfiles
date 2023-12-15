# !/bin/bash

function envvars {
export pm="dnf"
export iy="sudo ${pm} install -y"
export addRepo="sudo ${pm} config-manager --add-repo"
export uy="sudo ${pm} remove -y"
export fiy="flatpak install -y flathub"
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
