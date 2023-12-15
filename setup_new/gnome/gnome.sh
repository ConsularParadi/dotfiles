# !/bin/bash
echo "--------------------------------------------------------------------------------"
echo 'Installing Dependencies'
echo "--------------------------------------------------------------------------------"

sudo dnf install gnome-extensions-app gnome-tweaks
pip install gnome-extensions-cli

##### Installing Extensions #####
echo "--------------------------------------------------------------------------------"
echo 'Setting up extensions'
echo "--------------------------------------------------------------------------------"

exts=""

while read line;do
exts="${exts} $line"
done < extensions.txt

gext i $exts

