#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl

# http://www.webupd8.org/2015/05/drop-down-terminal-guake-070-released.html
sudo add-apt-repository -y ppa:webupd8team/unstable 
# http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# https://launchpad.net/~webupd8team/+archive/ubuntu/java
sudo add-apt-repository -y ppa:webupd8team/java
# http://www.omgubuntu.co.uk/2015/05/how-to-install-microsoft-visual-studio-code-in-ubuntu
sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make

# https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

sudo apt-get install -y guake sublime-text-installer oracle-java8-installer nodejs git apache2 apache2-utils mysql-server libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt php5-oauth php5-curl phpmyadmin python-pip python-virtualenv mongodb libc6:i386 libstdc++6:i386 ant lib32z1 lib32z1-dev nautilus-open-terminal python-dev libblas-dev liblapack-dev python-dev libatlas-base-dev gfortran

# Configure MYSQL DB
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation

# Configure Apache
sudo a2enmod rewrite
echo "Change the default.conf file to AllowOverride All"
sed -i '/AllowOverride None/c AllowOverride All' /etc/apache2/sites-available/default.confg
sudo service apache2 restart

# Configure Mongodb
sudo service mongod start

# Configure PHP
echo "Installing Composer ... "
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version


#Configure Node
echo "Installing Mobile Dev Tools"
sudo npm install -g cordova ionic yo grunt-cli bower nodemon gulp

echo "Testing Node Packages Installs"
cordova -v
ionic -v
yo --version
grunt --version
bower -v
nodemon -v
gulp -v

echo "Installing the Android SDK"
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
tar -xvzf android-sdk_r24.2-linux.tgz
mkdir ~/tools
mv android-sdk-linux/ ~/tools/android-sdk

echo "Installing visual studio code"
wget http://go.microsoft.com/fwlink/?LinkID=534108 -O VScode.zip
unzip VScode.zip
mv VSCode-linux-x64 ~/tools/visual-studio-code

echo "export PATH=~/tools/visual-studio-code:~/tools/android-sdk/tools:~/tools/android-sdk/platform-tools:$PATH" >> ~/.bashrc
source ~/.bashrc

echo "Testing Android Install"
android -h

echo "Attempting to pull down android packages"
android list sdk -u --all --extended

android update sdk --no-ui --filter android-22,android-19,tools,platform-tools,build-tools 

echo "Configure Git for default message"
git config --global push.default simple


echo "Installing Heroku (Without logging in)"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
