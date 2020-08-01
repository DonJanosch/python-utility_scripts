#!/bin/sh
# Script Settings

# Scipt body
# Information
if [ $(id -u) = 0 ]; then
   echo "For security reasons dont run this scipt as root. Create another user and add him to sudoers for that purpous and restart the script." 
   return 0
fi
echo "Script for installing Docker CE and Portainer to a Debian like Ubuntu 18.04"
echo "This is not a production great script! It will leave your installation vurnerable as it will not take care of any security precautions!"

# Instaling Docker
# First, update your existing list of packages:
sudo apt update
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common
# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Add the Docker repository to APT sources:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
# Next, update the package database with the Docker packages from the newly added repo:
sudo apt update
# Finally, install Docker:
sudo apt install docker-ce
# Adding current user to docker group
sudo usermod -aG docker ${USER}
# Prepare portainer
docker volume create portainer_data
# Deploy portainer
docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer