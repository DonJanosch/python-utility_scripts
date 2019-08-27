sudo apt update
sudo apt install software-properties-common curl flatpak -y

cd ~/Downloads
sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i ~/Downloads/nordvpn-release_1.0.0_all.deb
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -qO- https://deb.opera.com/archive.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=i386,amd64] https://deb.opera.com/opera-stable/ stable non-free"
sudo add-apt-repository ppa:ubuntu-toolchain-r/ppa
sudo add-apt-repository -y ppa:projectatomic/ppa

sudo apt update
snap install postman
snap install atom --classic
sudo apt install podman nordvpn mate-desktop-environment git python3.7 google-chrome-stable opera-stable -y

curl https://get.docker.com | sudo bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
