#!/bin/sh

# install ohmyzsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# check brew
brew doctor

# install cask
brew tap phinze/homebrew-cask
brew install brew-cask

# install git
brew install git

# install st2 & subl
brew cask install sublime-text
mkdir -p ~/bin && ln -s "/opt/homebrew-cask/Caskroom/sublime-text/2.0.2/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
echo 'export PATH=~/bin:$PATH' >> ~/.zshrc

# install iterm2
brew cask install iterm2

# install node
brew install node

# install yo grunt & bower
npm install -g yo grunt-cli bower	

# install phantom
brew install phantomjs

#install fuse
brew install fuse4x fuse4x-kext s3fs
sudo /bin/cp -rfX /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext /Library/Extensions
sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load_fuse4x
brew cask install osxfuse

# install php
brew tap homebrew/dupes
brew tap josegonzalez/homebrew-php
brew install autoconf automake
brew install php54 php54-mcrypt php54-apc php54-memcached php54-xdebug phpunit
sudo sed -i .bak 's,#LoadModule php5_module libexec/apache2/libphp5.so,LoadModule php5_module /usr/local/opt/php54/libexec/apache2/libphp5.so,g' /etc/apache2/httpd.conf
sudo apachectl restart

# install mysql
brew install mysql
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

# install virtualhost.sh
brew install virtualhost.sh

# install latest ruby
brew install rbenv ruby-build
rbenv install 2.0.0-p247
rbenv rehash
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
rbenv global 2.0.0-p247

# install sass & compass
gem install sass compass

# install aws tools
brew install aws-elasticbeanstalk s3cmd 

# install alfred
brew cask install alfred
brew cask alfred link

# standard softwares...
brew cask install charles 
brew cask install colloquy 
brew cask install cord 
brew cask install cyberduck 
brew cask install diffmerge 
brew cask install dropbox 
brew cask install firefox 
brew cask install google-chrome 
brew cask install google-chrome-canary 
brew cask install imageoptim 
brew cask install sequel-pro 
brew cask install sourcetree 
brew cask install vlc 
brew cask install virtualbox 
brew cask install vagrant

# install IE test VM's (large! ~7.5G)
# https://github.com/xdissent/ievms
#curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
