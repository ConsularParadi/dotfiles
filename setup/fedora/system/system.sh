# !/bin/bash
source ../utils.sh
export CWD=`pwd`


echo "--------------------------------INFO--------------------------------------------"
echo 'This scipt installs necessary system components in Fedora OS.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up RPM Fusion.'
echo -e "--------------------------------------------------------------------------------"

$DNF_IY https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264


echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up NVIDIA & CUDA.'
echo -e "--------------------------------------------------------------------------------"

if [[ $(/sbin/lspci | grep -e "3D") ]]; then
	$DNF_UP	
	
	pkgs=""

	while read line;do
	pkgs="${pkgs} $line"
	done < system.nvidia

	$DNF_IY $pkgs
	sudo systemctl enable nvidia-{suspend,resume,hibernate}

else
	echo "Nvidia graphics card not detected."
fi


echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up battery optimization management.'
echo -e "--------------------------------------------------------------------------------"



echo "x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-END-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
