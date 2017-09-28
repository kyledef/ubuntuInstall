#!/bin/bash
sudo apt-get update
sudo apt-get install -y curl

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y build-essential nodejs

echo "Installing Visual Studio code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get update
sudo apt-get install -y code

echo "Installing CLI tools for angular"
sudo npm install -g @angular/cli

echo "Installing mysql/mariadb"
sudo apt install -y apache2 phpmyadmin mysql-client mysql-server

echo "Installing python tools"
sudo apt install -y python3-pip python3-django libmysqlclient-dev python3-mysql.connector

sudo pip3 install virtualenv
sudo pip install virtualenv
