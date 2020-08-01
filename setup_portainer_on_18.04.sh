#!/bin/sh
# Script Settings

# Scipt body
# Information
echo "Script for installing Docker CE and Portainer to a Debian like Ubuntu 18.04"

# Instaling Docker
# First, update your existing list of packages:
sudo apt update #&& sudo apt upgrade -y
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Next, update the package database with the Docker packages from the newly added repo:
sudo apt update -y
# Finally, install Docker:
sudo apt install docker-ce -y
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
   echo "I have detected that u installed this script as ROOT-User which is a bad idea! This is only a test setup. Go talk to your trusted IoT-advisor of choice!" 
fi
echo "All Done, Portainer is up and running. Visite http://$(hostname -I | cut -d' ' -f1):9000"
