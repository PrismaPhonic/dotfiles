#!/bin/sh

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

# Install Zshell
sudo apt install zsh
sudo chsh -s /usr/bin/zsh root
sudo chsh -s /usr/bin/zsh pmfarr

# Install oh-my-zsh
sudo apt install wget git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install z-shell plugins
sudo apt install zsh-syntax-highlighting
sudo mkdir /usr/share/zsh/plugins
sudo cp -R /usr/share/zsh-syntax-highlighting /usr/share/zsh/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-history-substring-search.git /usr/share/zsh/plugins/zsh-history-substring-search
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/share/zsh/plugins/zsh-autosuggestions

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

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install Node with NVM
nvm install node
nvm use node

# Install neovim npm module globally
npm install -g neovim

# Install gitflow
sudo apt install git-flow

# Install gulp
npm install -g gulp

# Install mono (C# development)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel

# Install mono IDE
sudo apt install monodevelop

# Install dotnet core files
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

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

# Setup Golang tooling
sudo snap install go --classic

# Setup workspace for golang stuff
mkdir ~/code
mkdir ~/code/go

# Fix Ownership on HomeDIR (might not be necessary)
# sudo gpgconf --kill dirmngr
# sudo chown -R $USER:$USER ~/.gnupg

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

