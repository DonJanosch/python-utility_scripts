apt update && apt upgrade -y
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
systemctl enable nodered.service
cd ~/.node-red
npm install node-red-contrib-state-machine node-red-dashboard node-red-contrib-opcua
cd lib/flows/
git clone https://github.com/DonJanosch/node-red-flows.git .
reboot
