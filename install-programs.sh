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

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

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

# Install mono (C# development)
sudo pacman -Sy mono

# Install mono IDE
yay -S monodevelop-stable

# Install mono server for vim
yay -S omnisharp-roslyn

# Install dotnet core files
sudo pacman -Sy dotnet-runtime
sudo pacman -Sy dotnet-sdk

# Install Rider IDE (C#)
yay --editmenu -S rider

# Install Unity
yay -S unityhub
