SETTINGS_PATH=~/.config/Code/User/settings.json

echo "Installing VisualStudio Code Extensions for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/extensions.list | grep -v '^#' | xargs -L1 code --install-extension 

echo "Pulling settings.json into '$SETTINGS_PATH' for Jan Macenka"

curl https://raw.githubusercontent.com/jmacenka/vscode-extensions/master/settings.json >> $SETTINGS_PATH

echo "All done. Opening VS Code."

code .