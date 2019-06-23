# Set background to within
gsettings set org.gnome.desktop.background picture-uri /usr/share/backgrounds/within.png

# Install some cool themes
git clone https://github.com/addy-dclxvi/gtk-theme-collections ~/.themes
sudo apt install arc-theme

# Install gnome shell extensions
sudo apt install gnome-shell-extensions
sudo apt install gnome-tweak-tool
sudo apt install chrome-gnome-shell

# go here to get gTile: https://extensions.gnome.org/extensions/28/gtile/

# Get some swanky icons
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install papirus-icon-theme
sudo apt install numix-icon-theme
sudo apt install numix-icon-theme-circle

# Install dash to dock
mkdir dash-to-dock-temp
cd dash-to-dock-temp
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
make && make install
dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com

# Set up dash to dock to look nice
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true

# Set GTK theme to Fantome
gsettings set org.gnome.desktop.interface gtk-theme "Fantome"

# Set icon theme to Numix-Circle
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
