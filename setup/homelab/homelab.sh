# !/bin/bash

echo "--------------------------------------------------------------------------------"
echo 'Installing Dependencies'
echo "--------------------------------------------------------------------------------"

sudo apt install git curl python3-apt python3-debian pandoc make pip -y

curl -fsSL https://tailscale.com/install.sh | sh

gh auth login

git config --global user.name "Homelab"
git config --gloabl user.email "consularparadi@gmail.com"

echo "--------------------------------------------------------------------------------"
echo 'Setting up Nala Package Manager'
echo "--------------------------------------------------------------------------------"

git clone https://gitlab.com/volian/nala.git
cd nala/
sudo make install
sudo nala install neofetch -y
cd .. && sudo rm -r nala/

echo "--------------------------------------------------------------------------------"
echo 'Installing Docker and Dependencies'
echo "--------------------------------------------------------------------------------"
sudo sh get-docker.sh
