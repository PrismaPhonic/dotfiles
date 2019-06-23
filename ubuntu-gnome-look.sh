# Set background to within
gsettings set org.gnome.desktop.background picture-uri /usr/share/backgrounds/within.png

# Install some cool themes
git clone https://github.com/addy-dclxvi/gtk-theme-collections ~/.themes
sudo apt install arc-theme

# Install gnome shell extensions
sudo apt install gnome-shell-extensions
sudo apt install gnome-tweak-tool
sudo apt install chrome-gnome-shell

# Install and enable gTile
git clone https://github.com/gTile/gTile.git ~/.local/share/gnome-shell/extensions/gTile@vibou
dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
gnome-shell-extension-tool -e gTile@vibou

# Get some swanky icons
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install papirus-icon-theme
sudo apt install numix-icon-theme
sudo apt install numix-icon-theme-circle

# For some reason the above doesn't seem to be working for numix right now so
# manually installing
mkdir icon-temp
cd icon-temp
wget https://github.com/numixproject/numix-icon-theme-circle/archive/19.05.07.tar.gz
sudo tar -xzf 19.05.07.tar.gz
sudo rm -Rf 19.05.07.tar.gz
sudo mv numix-icon-theme-circle-19.05.07/Numix-Circle /usr/share/icons
cd ../
sudo rm -r icon-temp

# Install dash to dock
mkdir dash-to-dock-temp
cd dash-to-dock-temp
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
make && make install
dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()'
gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com
cd ../../
sudo rm -r dash-to-dock-temp

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

dconf load / < dconf-settings.ini
