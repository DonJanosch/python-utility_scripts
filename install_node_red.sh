apt update && apt upgrade -y
bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)
systemctl enable nodered.service
git clone https://github.com/DonJanosch/node-red-flows.git flows && cd flows && bash unpack_libraries.sh
cd ~/.node-red && npm install node-red-contrib-state-machine node-red-dashboard node-red-contrib-opcua
echo "Successfully finished the Node-Red-Installer-Script, rebooting now. The System will be avaliable under http://"$(hostname -I | cut -d' ' -f1)":1880 after the reboot."
echo "WARNING: Be aware that this installation-script leaves you with an OPEN and UNPROTECTED installation of Node-Red and requires you to handle soch measures manually afterwards!"
reboot
