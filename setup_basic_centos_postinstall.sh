echo "NOW: Updating the current system..."
sudo yum check-update
sudo yum clean all
sudo yum -y update
sudo yum -y upgrade
echo "DONE: Finished updating the system"

echo "NOW: Applying basic server configuration"
echo "CentOS_planemos_frontend">>/etc/hostname
sudo firewall-cmd --add-service=http
sudo firewall-cmd -permanent -add-port=3221/tcp
sudo firewall-cmd --reload
sudo yum install wget git

echo "NOW: Installing docker..."
curl -fsSL https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $(whoami)
