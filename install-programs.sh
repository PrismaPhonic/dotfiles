#!/bin/sh

# Install neovim
sudo pacman -Sy neovim

# Install pip
sudo pacman -Sy python-pip

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

# Install ripgrep
cargo install ripgrep

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Install Yarn
yay -S yarn

# Install Node with NVM
nvm install node
nvm use node

# Install neovim npm module globally
npm install -g neovim

# Install yay
sudo pacman -Sy yay

# Install gitflow
yay -S gitflow-avh-git

# Install gulp
npm install -g gulp

# Instlal instant markdown mini-server
npm install -g instant-markdown-d

# Install mono (C# development)
sudo pacman -Sy mono

# Install mono IDE
yay -S monodevelop-stable

# Install mono server for vim
yay -S omnisharp-roslyn

# Install mono xsp web server
yay -S xsp

# Install dotnet core files
sudo pacman -Sy dotnet-sdk

# Setup git
git config --global user.name "Peter Farr"
git config --global user.email "Peter@PrismaPhonic.com"

# Install polybar
yay -S polybar

# Install powerline
yay -S powerline

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Install yarn (planetscale dev)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn
echo "alias node=nodejs" >> ~/.zshrc

# Install Goland IDE (Gor)
yay -S goland

# Install and setup docker
yay -S docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a pmfarr docker

# Install kubectl
yay -S kubectl

# Install Slack
yay -S slack-desktop

# Install postman
yay -S postman-bin

# Install neofetch for coolness factor
yay -S neofetch

# Install Thunderbird
yay -S thunderbird

# Install Rider IDE (C#)
# yay --editmenu -S rider

# Install Unity
# yay -S unityhub
