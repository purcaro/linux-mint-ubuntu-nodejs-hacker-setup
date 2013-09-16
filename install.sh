# -*- mode: sh -*-
# vi: set ft=sh:
#!/usr/bin/env bash

# Linux Mint Node.js Hacker Setup
set -e

# Update initial dependencies on server
sudo apt-get update

# Accept MS Core Fonts EULA agreement
sudo sh -c "echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections"

# Install add-apt-repository command
sudo apt-get -y -q install \
  software-properties-common \
  python-software-properties \
  python \
  curl \
  g++ \
  make \
  libssl-dev \
  curl \
  build-essential \
  openssl \
  libssl-dev \
  git-core \
  pkg-config \
  ruby \
  ruby-dev \
  rubygems \
  ttf-inconsolata \
  ttf-mscorefonts-installer \
  vim \
  vim-gtk \
  zsh \
  gtk-redshift \
  xclip \
  sshuttle \
  cpulimit \
  acpi \
  clamav \
  clamtk \
  irssi \
  irssi-scripts \
  screen \
  openssh-server \
  cups \
  cups-pdf \
  lm-sensors

# Add MongoDB repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

# Add Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Add Sublime Text 2 PPA
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y

# Add TLP PPA
sudo add-apt-repository ppa:linrunner/tlp -y

# Add Variety PPA
sudo add-apt-repository ppa:peterlevi/ppa -y

# Add Clementine Dev PPA
sudo add-apt-repository ppa:me-davidsansome/clementine-dev -y

# Add Node.JS PPA
sudo add-apt-repository ppa:chris-lea/node.js -y

# Update repositories
sudo apt-get -y update

# Install previous packages from PPA's
sudo apt-get -y -q install \
  clementine \
  nodejs \
  redis-server \
  mongodb-10gen \
  tlp \
  smartmontools \
  ethtool \
  powertop \
  sublime-text \
  google-chrome-stable \
  variety

# Change default shell to zsh and setup oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
sed -i 's/(git)/(git ruby bower bundler coffee docker gem git-extras node npm nyan rand-quote vagrant google battery)/' ~/.zshrc
sed -i 's/robbyrussell/lambda/' ~/.zshrc
echo "RPROMPT='\$(battery_pct_prompt)'" >> ~/.oh-my-zsh/themes/lambda.zsh-theme
echo 'export EDITOR="vim"' >> ~/.zshrc

# vim plugins
sudo gem install rake
git clone https://github.com/niftylettuce/.vim.git
cd .vim
make install

# JSHint
sudo npm install -g jshint
cd ~/
wget https://raw.github.com/niftylettuce/development-environment-setup/master/.jshintrc

# One final upgrade for everything
sudo apt-get -y -q upgrade
sudo apt-get -y -q autoremove

# Start up Redshift on boot
mkdir -p ~/.config/autostart
wget -P ~/.config/autostart https://raw.github.com/niftylettuce/linux-mint-nodejs-hacker-setup/master/gtk-redshift.desktop

# Set DNS to Google Public DNS
sudo sed -i 's/208.67.222.222/8.8.8.8/' /etc/resolv.conf
sudo sed -i 's/208.67.220.220/8.8.4.4/' /etc/resolv.conf

# Enable UFW firewall
sudo ufw enable

# Finished
zenity --info --text "Setup is complete.  Please follow steps #4-6 now."

# monospace font
