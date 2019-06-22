##################
## GOLANG SETUP ##
##################

# Install Go with Snap - May be problematic
# sudo snap install go --classic

# Manual Go install
mkdir temp
cd temp
wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz
cd ../
sudo rm -r temp

# Setup workspace for golang stuff
mkdir ~/code
mkdir ~/code/go

###################
## MARIADB SETUP ##
###################

# Install and setup mariadb
sudo apt update
sudo apt install mariadb-server
sudo apt install mariadb-client
sudo apt install libmariadb-dev
# sudo mysql_secure_installation

##################
## VITESS SETUP ##
##################

# Disable apparmor - necessary by vitess docs
sudo service apparmor stop
sudo systemctl disable apparmor
sudo update-rc.d -f apparmor remove

# Install vitess dependencies
sudo apt install make \
	automake \
	libtool \
	python-dev \
	python-virtualenv \
	python-mysqldb \
	libssl-dev \
	g++ \
	git \
	pkg-config \
	bison \
	curl \
	unzip \
	default-jre \
	default-jdk \
	ant

go get -u github.com/kardianos/govendor

################
# SOURCE BUILD #
################

# UNCOMMENT IF CONTRIBUTING AND BUILD THIS WAY
# cd $GOPATH
# git clone https://github.com/vitessio/vitess.git \
#     src/vitess.io/vitess
# ln -s src/vitess.io ${HOME}/code/go/src/vitess.io
# cd ${HOME}/code/go/src/vitess.io/vitess

# Oddly enough I have to add this variable up-front due to a bug:
# https://github.com/vitessio/vitess/issues/4373
# BUILD_TESTS=0 ./bootstrap.sh

# unset PYTHONPATH
# ./bootstrap.sh

# source build.env
# source ./dev.env
# make build

####################
# END SOURCE BUILD #
####################

################
# Binary Build #
################

mkdir vitess-temp
cd vitess-temp
git clone https://github.com/planetscale/vitess-releases.git
cd vitess-releases/bin
./install_latest.sh
cd ../../../
sudo rm -r vitess-temp

# Install packages for testing
sudo apt install chromium-browser xvfb maven
