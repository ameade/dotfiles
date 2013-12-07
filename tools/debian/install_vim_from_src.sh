#First, install all the prerequisite libraries, including Mercurial. For a Debian-like Linux distribution like Ubuntu, that would be the following:

sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
#Remove vim if you have it already.
sudo apt-get remove vim vim-runtime gvim
#On Ubuntu 12.04.2 you probably have to remove these packages as well:
sudo apt-get remove vim-tiny vim-common vim-gui-common
#Once everything is installed, getting the source is easy. If you're not using vim 7.3, make sure to set the VIMRUNTIMEDIR variable correctly below (for instance, with vim 7.4a, use /usr/share/vim/vim74a):
cd /tmp
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7-config \
            --enable-perlinterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
