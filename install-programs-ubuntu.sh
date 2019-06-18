#!/bin/sh

# Install curl
sudo apt-get install curl

# Install tmux
sudo apt-get install tmux

# Install Zshell
sudo apt-get install zsh
sudo chsh -s /usr/bin/zsh root
sudo chsh -s /usr/bin/zsh pmfarr

# Install oh-my-zsh
sudo apt-get install wget git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install z-shell plugins
sudo apt-get install zsh-syntax-highlighting
sudo mkdir /usr/share/zsh/plugins
sudo cp -R /usr/share/zsh-syntax-highlighting /usr/share/zsh/plugins/zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-history-substring-search.git /usr/share/zsh/plugins/zsh-history-substring-search
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git /usr/share/zsh/plugins/zsh-autosuggestions

# Install powerline and addons
sudo apt-get install powerline
sudo apt-get install python3-powerline

# Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Install pip
sudo apt-get install python-dev python-pip python3-dev python3-pip

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
sudo apt-get install git-flow

# Install gulp
npm install -g gulp

# Install mono (C# development)
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
sudo apt install mono-devel

# Install mono IDE
sudo apt-get install monodevelop

# Install dotnet core files
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
