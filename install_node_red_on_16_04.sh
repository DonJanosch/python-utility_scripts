echo "Installing Node-Red on Ubuntu 16.04"

sudo apt update
sudo apt upgrade -y

sudo apt-get install nodejs-legacy -y

sudo apt-get install npm -y

sudo npm install -g --unsafe-perm node-red node-red-admin

sudo apt update

sudo ufw allow 1880

echo "Now adding the node-red User, please provide a password:"

sudo adduser node-red

echo "[Unit]
Description=Node-RED
After=syslog.target network.target

[Service]
ExecStart=/usr/local/bin/node-red-pi --max-old-space-size=128 -v
Restart=on-failure
KillSignal=SIGINT

# log output to syslog as 'node-red'
SyslogIdentifier=node-red
StandardOutput=syslog

# non-root user to run as
WorkingDirectory=/home/node-red/
User=node-red
Group=node-red

[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/node-red.service

sudo systemctl enable node-red

sudo systemctl start node-red

sudo systemctl status node-red
