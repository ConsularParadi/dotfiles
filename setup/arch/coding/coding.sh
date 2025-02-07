# !/bin/bash
source ../utils.sh
export CWD=`pwd`

echo "--------------------------------INFO--------------------------------------------"
echo 'This script sets up the coding environment.'
echo "--------------------------------INFO--------------------------------------------"

yesno

echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up Symbolic Links'
echo -e "--------------------------------------------------------------------------------"

su 
tgt="$HOME/Coding"
src="/mnt/data/Coding"
[ ! -L $tgt ] && ln -s $src $tgt


echo -e "--------------------------------------------------------------------------------"
echo -e 'Installing Dependencies'
echo -e "--------------------------------------------------------------------------------"

[ ! command -v conda --version > /dev/null 2>&1 ] && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda.sh && bash conda.sh

PKGS=""

while read line;do
PKGS="${PKGS} $line"
done < coding.yay

$YAY_IY $PKGS

PKGS=""

while read line;do
PKGS="${PKGS} $line"
done < coding.flat

$FLAT_IY $PKGS

firefox --new-tab https://exercism.org/settings/api_cli

echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up your Development Environment'
echo -e "--------------------------------------------------------------------------------"

[ ! -e "$HOME/Coding/Dev/rust/.cargo/env.fish" ] && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
yay -S go
yay -S npm


echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up DevOps environment'
echo -e "--------------------------------------------------------------------------------"

PKGS=""

while read line;do
PKGS="${PKGS} $line"
done < devops.yay

$YAY_IY $PKGS

echo -e "--------------------------------------------------------------------------------"
echo -e 'Setting up GPU'
echo -e "--------------------------------------------------------------------------------"

#if lspci -k | grep -A 2 -E "(VGA|3D)" | grep -qi nvidia; then
#	$YAY_IY nvidia nvidia-utils
#      fi
#echo $YAY_IY
#$YAY_IY nvidia nvidia-utils

echo -e "--------------------------------------------------------------------------------"
echo -e 'Running cleanup'
echo -e "--------------------------------------------------------------------------------"
rm -rf $CWD/conda.sh
#pkgs=""
#while read line; do
#pkgs="${pkgs} $line"
#done < cleanup.txt
echo "x-x-x-x-x-x-x-x-x-x-x-x-x------Script Ended------x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x"
