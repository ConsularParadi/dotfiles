#!/bin/bash

echo -e "-------------------------------------------------------------------------------"
echo -e "			       	Bluetooth                                       "
echo -e "-------------------------------------------------------------------------------"
sudo systemctl start bluetooth && sudo systemctl enable bluetooth


echo -e "-------------------------------------------------------------------------------"
echo -e "			   GRandUnifiedBootloader                               "
echo -e "-------------------------------------------------------------------------------"
sudo mkdir /boot/grub/themes
sudo cp -r ./grub_themes/* /boot/grub/themes/
sudo cp /etc/default/grub /etc/default/grub.bak
#Create a cron job to cycle grub themes

echo -e "-------------------------------------------------------------------------------"
echo -e "			   PowerManagement                                                        "
echo -e "-------------------------------------------------------------------------------"
#Know more about powertop, tpl, auto-cpufreq
