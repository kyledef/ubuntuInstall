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

sudo apt-get update

sudo apt-get install -y guake sublime-text-installer oracle-java8-installer nodejs git apache2 apache2-utils mysql-server libapache2-mod-auth-mysql php5-mysql php5 libapache2-mod-php5 php5-mcrypt php5-oauth php5-curl phpmyadmin python-pip python-virtualenv mongodb libc6:i386 libstdc++6:i386 ant lib32z1 lib32z1-dev nautilus-open-terminal python-dev libblas-dev liblapack-dev python-dev libatlas-base-dev gfortran gimp mongodb && sudo apt-get dist-upgrade -y

echo "Install Google Chrome Browser for development"
wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb -O google-chrome.deb
sudo dpkg -i google-chrome.deb

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
wget http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O android-sdk.tgz
tar -xvzf android-sdk.tgz
mkdir ~/tools
mv android-sdk-linux/ ~/tools/android-sdk

echo "Installing the Android Studio IDE"
wget https://dl.google.com/dl/android/studio/ide-zips/1.4.0.10/android-studio-ide-141.2288178-linux.zip -O android-studio.zip
unzip android-studio.zip
mv android-studio ~/tools/android-studio

echo "Installing Heroku (Without logging in)"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh


echo "Installing visual studio code"
wget https://az764295.vo.msecnd.net/public/0.9.1/VSCode-linux64.zip -O VScode.zip #Need to organize better download Link
unzip VScode.zip
mv VSCode-linux-x64 ~/tools/visual-studio-code

echo "Configuring Environment for VSCode"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
sudo sysctl --system

echo "export PATH=~/tools/android-studio/bin:~/tools/visual-studio-code:~/tools/android-sdk/tools:~/tools/android-sdk/platform-tools:$PATH" >> ~/.bashrc
source ~/.bashrc

echo "Testing Android Install"
android -h

echo "Attempting to pull down android packages"
android list sdk -u --all --extended

android update sdk --no-ui --filter android-23,android-22,tools,platform-tools,build-tools-23.0.1

echo "Configure Git for default message"
git config --global push.default simple



