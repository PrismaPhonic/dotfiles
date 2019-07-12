# Install awesome
sudo apt install awesome

# Install roboto font
sudo apt install fonts-roboto

# Install compiz fork build deps
sudo apt install libx11-6 \
	libx11-dev \
	libxcomposite1 \
	libxcomposite-dev \
	libxdamage1 \
	libxdamage-dev \
	libxfixes3 \
	libxfixes-dev \
	libxext6 \
	libxext-dev \
	libxrender1 \
	libxrender-dev \
	libxrandr2 \
	libxrandr-dev \
	libxinerama1 \
	libxinerama-dev \
	pkg-config \
	make \
	x11proto-dev \
	x11-utils \
	libconfig9 \
	libdrm-common \
	libdrm2 \
	libdrm-dev \
	libdbus-1-dev \
	libconfig-dev \
	asciidoc

# Install compiz fork
mkdir compton-temp
cd compton temp
git clone https://github.com/tryone144/compton.git
cd compton
make
sudo make install
cd ../../
sudo rm -r compton-temp

# Install rofi
sudo apt install rofi

# Install materia theme
sudo apt install materia-gtk-theme

# Install papyrus icon theme for papyrus dark
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install papirus-icon-theme

# Install lxappearance
sudo apt install lxappearance

# Install awesome materia
git clone https://github.com/PapyElGringo/material-awesome.git ~/.config/awesome

# Once you boot into awesome run lxappearance and set the icon theme to papyrus
# dark and the gtk theme to materia

