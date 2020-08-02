#!/bin/sh
# Script Settings
#No variables required in this script

# Scipt body
# INFORMATION
# This script may look more impressing than it is. I just googled "how to install Docker on 18.04" and "how to deploy portainer"
# Here I foud these results "https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04" and "https://portainer.readthedocs.io/en/stable/deployment.html"
# Then I literally just Copy&Pasted the tutorials there into this unified shell-script, added some comment lines and uploaded it to GitHub for easy access... thats it.
# Everyone whith experience in IT, especially OpenSource and/or Linux should be able to do the same. Thats no special skill. Combined with an engineering-
# spirit and the general ability to read thats all you need ;-) Go ask the Linux and/or IoT Comunity for help. They are great!
# UPDATE: I changed the script to instead use the non distro dependent way of installing via a convenience-script
echo "Script for installing Docker CE and Portainer to a Debian like Ubuntu 18.04"

# Instaling Docker
# First, update your existing list of packages:
sudo apt update #&& sudo apt upgrade -y
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# Installing docker the non distro dependent way with a convenience script
curl -fsSL https://get.docker.com/ | sh
# Adding current user to docker group
sudo usermod -aG docker ${USER}

# Install portainer
# Prepare portainer
docker volume create portainer_data
# Deploy portainer
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# Final messages
echo ""
echo "*************************"
echo "This is not a production great script! It will leave your installation vurnerable as it will not take care of any security precautions!"
if [ $(id -u) = 0 ]; then
   echo "I have detected that you installed this script as ROOT-User which is a bad idea! This is only a test setup. Go talk to your trusted IoT-advisor of choice!" 
fi
echo "All Done, Portainer is up and running. Visite http://$(hostname -I | cut -d' ' -f1):9000"
