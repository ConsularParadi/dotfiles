# !/bin/bash

#Imports
source ../utils.sh

envvars

echo "--------------------------------------------------------------------------------"
echo 'Installing packages using dnf'
echo "--------------------------------------------------------------------------------"

$iy rclone 

echo "--------------------------------------------------------------------------------"
echo 'Setting up cron jobs and configuring first remote drive'
echo "--------------------------------------------------------------------------------"

cp $home/.dotfiles/cron_jobs/cron.bak/rclone.sh $home/.dotfiles/cron_jobs/daily 

mkdir -p $home/Cloud/Google-Drive
rclone config


