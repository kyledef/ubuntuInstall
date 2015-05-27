#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl

# http://www.webupd8.org/2015/05/drop-down-terminal-guake-070-released.html
sudo add-apt-repository -y ppa:webupd8team/unstable 
# http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# https://launchpad.net/~webupd8team/+archive/ubuntu/java
sudo add-apt-repository -y ppa:webupd8team/java
# https://nodesource.com/blog/nodejs-v012-iojs-and-the-nodesource-linux-repositories
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -

sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

sudo apt-get install -y guake sublime-text-installer oracle-java8-installer nodejs git apache2 apache2-utils mysql-server libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt php5-oauth php5-curl phpmyadmin python-pip python-virtualenv mongodb

# Configure MYSQL DB
sudo mysql_install_db
sudo /usr/bin/mysql_secure_installation

# Configure Apache
sudo a2enmod rewrite
sudo service apache2 restart
echo "Change the default.conf file to AllowOverride All"

# Configure Mongodb
sudo service mongod start

# Configure PHP
echo "Installing Composer ... "
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version


#Configure Node
echo "Installing Mobile Dev Tools"
sudo npm install -g cordova ionic yo grunt-cli
cordova -v




