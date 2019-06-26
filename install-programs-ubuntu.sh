#!/bin/sh

# Make sure we are up to date before starting
sudo apt update

# Install curl
sudo apt install curl

# Install git
sudo apt install git

# Setup git
git config --global user.name "Peter Farr"
git config --global user.email "Peter@PrismaPhonic.com"

# Install tmux
sudo apt install tmux

# Install Compton
sudo apt install compton

# Install feh for wallpapers in bspwm
sudo apt install feh

# Install rofi
sudo apt install rofi

# Install ranger
sudo apt install ranger caca-utils highlight atool w3m poppler-utils mediainfo

# Install spacefm for bspwm
sudo apt install spacefm

# Install polybar dependencies
sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2

# Install polybar
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh
cd ../
sudo rm -r polybar

# Install sound tray for bspwm
sudo apt install pasystray

## BSPWM INSTALL

./install-bspwm-ubuntu.sh

## TODO: Manual install for networkmanager-dmenu

# Install custom zevv-peep font
mkdir font-temp
cd font-temp
wget http://zevv.nl/play/code/zevv-peep//zevv-peep-iso8859-15-07x14.bdf
wget http://zevv.nl/play/code/zevv-peep//zevv-peep-iso8859-15-08x16.bdf
wget http://zevv.nl/play/code/zevv-peep//zevv-peep-iso8859-15-10x20.bdf
sudo cp zevv-peep-iso8859* /usr/share/fonts/X11/misc/
sudo mkfontdir /usr/share/fonts/X11/misc
sudo xset +fp /usr/share/fonts/X11/misc
cd ../
rm -r font-temp

# Manually install ionicons since Ubuntu doesn't have a package
mkdir font-temp
cd font-temp
wget -qO- https://github.com/ionic-team/ionicons/archive/v4.5.8.tar.gz | tar xzf
cd ionicons-4.5.8
sudo mkdir /usr/local/share/fonts/TTF
sudo mv docs/fonts/ionicons.ttf /usr/local/share/fonts/TTF/ionicons.ttf
sudo chown root:staff /usr/local/share/fonts/TTF -R
sudo chmod 644 /usr/local/share/fonts/TTF/* -R
sudo chmod 755 /usr/local/share/fonts/TTF
cd ../../
rm -r font-temp

## TODO: Look up what rootmenu is from bspwm manjaro project

# Install lemonpanel dependencies
sudo apt install rxvt-unicode \
	zenity \
	conky-cli \
	wireless-tools \
	xdotool \
	suckless-tools \
	wmctrl \
	xtitle \
	fonts-powerline \
	xdg-utils \
	update-notifier \
	dash

# Install lemonpanel
mkdir temp
cd temp
git clone https://github.com/Chrysostomus/lemonpanel.git
sudo cp lemonpanel/bin/lemonpanel /usr/bin/lemonpanel
sudo chmod 755 /usr/bin/lemonpanel
sudo cp -r lemonpanel/bin /usr
sudo chmod a+x /usr/bin
cd ../../
sudo rm -r temp

# Install powerline and addons
sudo apt install powerline
sudo apt install python3-powerline

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# Install pip
sudo apt install python-dev python-pip python3-dev python3-pip

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Setup vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install rust
curl https://sh.rustup.rs -sSf | sh

# Install nightly rust
rustup install nightly

# Install RLS
rustup component add rls rust-analysis rust-src

# Make sure cargo is available for rest of installs
export PATH="$PATH:$HOME/.cargo/bin"

# Install neovim npm module globally
npm install -g neovim

# Install gitflow
sudo apt install git-flow

# Install gulp
npm install -g gulp

# Install eslint and prettier
npm install -g eslint
npm install -g prettier

# Install yarn (planetscale dev)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn
echo "alias node=nodejs" >> ~/.zshrc

# Install mono (C# development)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel

# Install mono IDE
sudo apt install monodevelop

# Install dotnet core files
sudo snap install dotnet-sdk --classic

# Install Snappy
sudo apt install snapd snapd-xdg-open

# Install Visual Studio Code
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# Install Webstorm
sudo snap install webstorm --classic

# Install Goland
sudo snap install goland --classic

# Fix Ownership on HomeDIR (might not be necessary)
sudo gpgconf --kill dirmngr
sudo chown -R $USER:$USER ~/.gnupg

# Install Lastpass
mkdir temp
cd temp && wget https://download.cloud.lastpass.com/linux/lplinux.tar.bz2 && tar xjvf lplinux.tar.bz2
./install_lastpass.sh
cd ../ && sudo rm -r temp


# Install fonts
sudo apt install xfonts-terminus console-terminus

# Install stterm
sudo apt install stterm

# Install ripgrep
cargo install ripgrep

# Install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty

# Install Firefox Developer Edition
# Must be done manually - desktop file for launching will be auto linked when
# you run the main dotfile script installer

# To install manually, download the tar from firefox website, and extract the
# contents of the firefox folder into a firefox-developer-edition folder inside
# of /opt

# Install and setup docker
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo adduser pmfarr docker

# Install kubectl
sudo snap install kubectl --classic

# Install postman
sudo snap install postman

# Install slack
sudo snap install slack --classic

# Install video and audio codecs
sudo apt install libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg

# Commenting out for now because I keep getting a bug when installing this
# sudo apt install ubuntu-restricted-extras

# Install emacs because apparently it's necessary at Planetscale
sudo snap install emacs --classic

# Install minikube and all dependencies
./install-minikube.sh

# Get neofetch for coolness factor
sudo apt install neofetch

# Colorpicker 
sudo snap install pick-colour-picker

# Install markdown editor/viewer
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora
