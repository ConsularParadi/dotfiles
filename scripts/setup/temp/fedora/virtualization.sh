# !/bin/bash

#Imports
source ../utils.sh

check_sudo
envvars

echo -e "This script installs dependencies for running qemu/kvm virtual machines and sets up a windows 10 vm.\n Requirements:\n  1) Intel CPU\n  2) Windows ISO"
yesno

echo "--------------------------------------------------------------------------------"

echo 'Installing dependencies'
$iy @virtualization
git clone https://github.com/BigAnteater/KVM-GPU-Passthrough/ && cd KVM-GPU-Passthrough
sleep 2s
echo "--------------------------------------------------------------------------------"

echo 'Configuring system for VM GPU passthrough'

systemctl enable libvirtd
systemctl start libvirtd
chmod +x grub_setup_intel.sh &&  sudo ./grub_setup_intel.sh
read -p "\nEnter username: " uname
echo -e "Adding $uname to kvm and libvirt group"
gpasswd -M $uname kvm
gpasswd -M $uname libvirt
sleep 1s
echo "Configuring /etc/libvirt/libvirtd.conf"
mv /etc/libvirt/libvirtd.conf /etc/libvirt/libvirtd.conf.old
mv libvirtd.conf /etc/libvirt
sleep 1s
echo "Configuring /etc/libvirt/qemu.conf"
mv /etc/libvirt/qemu.conf /etc/libvirt/qemu.conf.old
mv qemu.conf /etc/libvirt
systemctl restart libvirtd

echo "--------------------------------------------------------------------------------"

echo "Cleanup in progress"
cd .. && rm KVM-GPU-Passthrough

