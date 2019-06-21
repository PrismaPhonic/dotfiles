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
