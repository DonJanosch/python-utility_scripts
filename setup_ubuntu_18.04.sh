sudo apt update
sudo apt install apt-transport-https software-properties-common curl wget flatpak -y

cd ~/Downloads
sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i ~/Downloads/nordvpn-release_1.0.0_all.deb
sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
sudo add-apt-repository -y ppa:projectatomic/ppa
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee/etc/apt/sources.list.d/etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

sudo apt update
snap install postman
sudo apt install brave-browser etcher-electron podman nordvpn git google-chrome-stable opera-stable torbrowser-launcher -y

curl https://get.docker.com | sudo bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl https://raw.githubusercontent.com/jmacenka/utility-scripts/master/setup_visual_studio_code_ubuntu.sh | sh

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
