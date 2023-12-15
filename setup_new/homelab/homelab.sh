# !/bin/bash

echo "--------------------------------------------------------------------------------"
echo 'Installing Dependencies'
echo "--------------------------------------------------------------------------------"

curl -fsSL https://tailscale.com/install.sh | sh

curl -fsSL https://get.docker.com -o get-docker.sh


echo "--------------------------------------------------------------------------------"
echo 'Installing Docker and Dependencies'
echo "--------------------------------------------------------------------------------"
sudo sh get-docker.sh
