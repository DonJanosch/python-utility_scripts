echo "Trying to install docker, requires root-privileges and will add current user to docker-group."
curl -sSL https://get.docker.com | sh
sudo usermod -aG $USER
sudo systemctl start docker
echo "Installed docker: $(docker --version)"
echo "Installing required dependencies."
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
sudo apt-get remove python-configparser
echo "Trying to install docker-compose."
sudo pip3 -v install docker-compose
echo "Installed docker-compose: $(docker-compose --version)"
