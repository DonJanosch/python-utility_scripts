# Script Settings
SETTINGS_PATH=$HOME/.config/Code/User/
SETTINGS_FILENAME=settings.json

# Scipt body
echo "##SCRIPT FOR INSTALLING VSCode WITH EXTENSIONS##"
prompt=$(sudo -nv 2>&1)
if [ $(id -u) = 0 ]; then
   echo "Cant run this script as root. Change user first. Aborting script-execution..." 
   return 0
elif ! [ $? -eq 0  || echo $prompt | grep -q '^sudo:' ]; then
  echo "The current user needs sudo permissions for this script to work. Aborting script-execution..."
  return 0
fi

if ! 'code' -s $pkgs >/dev/null 2>&1;then
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
