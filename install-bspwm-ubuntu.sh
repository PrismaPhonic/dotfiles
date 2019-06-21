# Install bspwm dependencies
sudo apt install git \
                      xcb \
                      libxcb-util0-dev \
                      libxcb-ewmh-dev \
                      libxcb-randr0-dev \
                      libxcb-icccm4-dev \
                      libxcb-keysyms1-dev \
                      libxcb-xinerama0-dev \
		      libxcb-shape0-dev \
                      libasound2-dev \
                      gcc \
                      make \
                      libxcb-xtest0-dev \
                      libxft-dev \
                      libx11-xcb-dev

# Install bspwm and utils
mkdir ~/development
mkdir ~/development/github.com
mkdir ~/development/github.com/defektive
mkdir ~/development/github.com/baskerville
mkdir ~/development/github.com/krypt-n
cd  ~/development/github.com/baskerville
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
git clone https://github.com/baskerville/sutils.git
git clone https://github.com/baskerville/xtitle.git
git clone https://github.com/baskerville/xdo.git

cd  ~/development/github.com/baskerville
cd bspwm/ && make && sudo make install
cd ../sxhkd/ && make && sudo make install
cd ../sutils/ && make && sudo make install
cd ../xtitle/ && make && sudo make install
cd ../xdo/ && make && sudo make install

# patched lemonbar
cd ~/development/github.com/krypt-n
git clone https://github.com/krypt-n/bar.git
cd bar && make && sudo make install

# Add bspwm to xsessions
sudo cp ~/development/github.com/baskerville/bspwm/contrib/freedesktop/bspwm.desktop /usr/share/xsessions/bspwm.desktop
