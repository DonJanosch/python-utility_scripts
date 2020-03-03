echo "**** INSTALLING PLEX MEDIA SERVER ON RASPBERRY PI ****"

echo "Updating System..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing https-transport..."
sudo apt-get install apt-transport-https 

echo "Adding repo-keys..."
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt-get update

echo "Installing PLEX Server..."
sudo apt-get install plexmediaserver

echo "Adapting settings of PLEX Server for pi and restarting the service..."
sudo mkdir -p /home/pi/plexmedia
sudo chown -R plex: /home/pi/plexmedia
sudo service plexmediaserver restart

echo "All Done, PLEX is up and running. Visite http://$(hostname -I | cut -d' ' -f1):32400/web"
echo "Mount the NAS to /home/pi/plexmedia by entering it to /etc/fstab"
