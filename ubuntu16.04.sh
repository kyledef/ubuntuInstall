# Can be accessed @ https://goo.gl/0SvUnJ
sudo apt-get purge -y rhythmbox totem thunderbird* aisleriot gnome-mines gnome-mahjongg
sudo apt-get autoremove -y
sudo apt-get install -y build-essential
# http://www.webupd8.org/2015/05/drop-down-terminal-guake-070-released.html
sudo add-apt-repository -y ppa:webupd8team/unstable 
# http://www.webupd8.org/2013/07/sublime-text-3-ubuntu-ppa-now-available.html
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# https://launchpad.net/~webupd8team/+archive/ubuntu/java
sudo add-apt-repository -y ppa:webupd8team/java
# http://www.webupd8.org/2014/05/install-atom-text-editor-in-ubuntu-via-ppa.html
sudo add-apt-repository -y ppa:webupd8team/atom
# https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get update && sudo apt-get dist-upgrade -y

# Accept Oracle Liscense
sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections


sudo apt-get update
sudo apt-get install -y atom sublime-text-installer oracle-java8-installer nodejs git apache2 apache2-utils mysql-server php-mysql php libapache2-mod-php php-mcrypt php-oauth php-curl php-mbstring php-gettext phpmyadmin python-pip python-virtualenv mongodb libc6:i386 libstdc++6:i386 ant lib32z1 lib32z1-dev python-dev libblas-dev liblapack-dev python-dev libatlas-base-dev gfortran gimp mongodb zip && sudo apt-get dist-upgrade -y



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

echo "Installing Heroku (Without logging in)"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "Configure Git for default message"
git config --global push.default simple

# Installing Chrome
echo "Install Google Chrome Browser for development"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
# wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb -O google-chrome.deb
sudo dpkg -i google-chrome.deb


echo "Installing the Android SDK"
wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip -O android-sdk.zip
tar -xvzf android-sdk.zip
mkdir ~/tools
mv android-sdk-linux/ ~/tools/android-sdk

echo "Installing the Android Studio IDE"
wget https://dl.google.com/dl/android/studio/ide-zips/2.0.0.13/android-studio-ide-143.2602393-linux.zip -O android-studio.zip
unzip android-studio.zip
mv android-studio ~/tools/android-studio



echo "Installing visual studio code"
wget https://az764295.vo.msecnd.net/stable/db71ac615ddf9f33b133ff2536f5d33a77d4774e/VSCode-linux-x64-stable.zip -O VScode.zip #Need to organize better download Link
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

android update sdk --no-ui --filter android-23,tools,platform-tools,build-tools-23.0.2



# wget http://download.unity3d.com/download_unity/unity-editor-5.1.0f3+2015082501_amd64.deb
