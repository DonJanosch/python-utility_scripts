apt update && apt upgrade -y
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
systemctl enable nodered.service
git clone https://github.com/DonJanosch/node-red-flows.git .
bash unpack_libraries.sh
cd ~/.node-red
npm install node-red-contrib-state-machine node-red-dashboard node-red-contrib-opcua
reboot
