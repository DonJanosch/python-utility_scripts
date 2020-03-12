# Script Settings
SETTINGS_PATH=~/.config/Code/User/
SETTINGS_FILENAME=settings.json

# Scipt body
pkgs='code'
if ! dpkg -s $pkgs >/dev/null 2>&1;
then
    echo "Installing VisualStudio Code on Ubuntu for Jan Macenka"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install code -y
else
    echo "VisualStudio Code seems to be installed already."
fi

echo "Installing VisualStudio Code Extensions for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/extensions.list | grep -v '^#' | xargs -L1 code --install-extension 

echo "Pulling settings.json into '$SETTINGS_PATH$SETTINGS_FILENAME' for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/settings.json >> $SETTINGS_PATH

echo "All done. Opening VS Code."

code $SETTINGS_PATH
