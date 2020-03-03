echo "**** INSTALLING PLEX MEDIA SERVER ON RASPBERRY PI ****"

echo "Updating System..."
sudo apt-get update
sudo apt-get upgrade

echo "Installing https-transport..."
sudo apt-get install apt-transport-https 

echo "Adding repo-keys..."
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt-get update

echo "Installing PLEX Server..."
sudo apt-get install plexmediaserver

echo "Adapting settings of PLEX Server for pi and restarting the service..."
sed -i -e 's/PLEX_MEDIA_SERVER_USER=plex/PLEX_MEDIA_SERVER_USER=pi/g' /etc/default/plexmediaserver.prev
sudo service plexmediaserver restart