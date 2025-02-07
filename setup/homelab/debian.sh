# !/bin/bash

echo "--------------------------------------------------------------------------------"
echo 'Setting up Github with authentication'
echo "--------------------------------------------------------------------------------"

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && sudo apt update && sudo apt install gh -y

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
