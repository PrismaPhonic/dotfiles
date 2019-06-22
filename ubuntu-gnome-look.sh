# Set background to within
sudo cp backgrounds/within.png /usr/share/backgrounds/within.png
gsettings set org.gnome.desktop.background picture-uri /usr/share/background/within.png

# Install some cool themes
git clone https://github.com/addy-dclxvi/gtk-theme-collections ~/.themes

# Install gnome shell extensions
sudo apt install gnome-shell-extensions
sudo apt install gnome-tweak-tool
sudo apt install chrome-gnome-shell

# go here to get gTile: https://extensions.gnome.org/extensions/28/gtile/

# Get some swanky icons
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

# Install plank for that beautiful app bar look
sudo apt install plank
sudo cp /usr/share/applications/plank.desktop ~/.config/autostart/plank.desktop
plank &

# Permananetly hide the stock Ubuntu dock
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

# Set GTK theme to Fantome
gsettings set org.gnome.desktop.interface gtk-theme "Fantome"

# Set icon theme to Papirus
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
