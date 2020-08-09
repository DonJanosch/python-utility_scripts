#!/bin/sh
# Script Settings
#No variables required in this script

# Scipt body
# INFORMATION
# Script for setting up QEMU and Virtmanager for remote usage.
echo "Script for installing QEMU and Virtmanager for remote usage on a Debian like Ubuntu 18.04"

# Instaling QEMU
# First, update your existing list of packages:
sudo apt update #&& sudo apt upgrade -y
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt-get install qemu-kvm qemu libvirt-bin -y
# Installing Virtmanager for remote usage
sudo apt install virt-manager virt-viewer ssh-askpass-gnome --no-install-recommends -y

# Final messages
echo ""
echo "*************************"
echo "This is not a production great script! It will leave your installation vurnerable as it will not take care of any security precautions!"
if [ $(id -u) = 0 ]; then
   echo "I have detected that you installed this script as ROOT-User which is a bad idea! This is only a test setup. Go talk to your trusted IoT-advisor of choice!" 
fi
echo "All Done, Virtmanager is up and running. Connect to the system with the following command: "
echo "virt-manager -c 'qemu+ssh://${USER}@$(hostname -I | cut -d' ' -f1):2222/system?keyfile=id_rsa'"