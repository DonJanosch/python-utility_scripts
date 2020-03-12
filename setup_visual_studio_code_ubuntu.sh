# Script Settings
SETTINGS_PATH=$HOME/.config/Code/User/
SETTINGS_FILENAME=settings.json

# Scipt body
pkgs='code'
if ! dpkg -s $pkgs >/dev/null 2>&1;
then
    echo "Installing VisualStudio Code on Ubuntu for Jan Macenka"
    sudo snap install --classic code # or code-insiders
else
    echo "VisualStudio Code seems to be installed already."
fi

echo "Installing VisualStudio Code Extensions for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/extensions.list | grep -v '^#' | xargs -L1 code --install-extension 

echo "Pulling settings.json into '$SETTINGS_PATH$SETTINGS_FILENAME' for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/settings.json >> $SETTINGS_PATH

echo "All done. Opening VS Code."

code $SETTINGS_PATH