echo "Trying to install docker, requires root-privileges and will add current user to docker-group."
bash <(curl https://get.docker.com)
eval "sudo usermod -aG docker $(whoami)"
echo "Installed docker: $(docker --version)"
echo "Trying to install docker-compose."
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Installed docker-compose: &(docker-compose --version)"
