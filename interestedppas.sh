#!/bin/bash

sudo add-apt-repository -y ppa:libreoffice/ppa
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
sudo add-apt-repository -y ppa:alexlarsson/flatpak
sudo add-apt-repository -y ppa:linuxuprising/java
sudo add-apt-repository -y ppa:nathan-renniewaldock/flux
# sudo add-apt-repository -y ppa:indicator-multiload/stable-daily

sudo apt-get update
sudo apt-get upgrade -y

echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo apt-get install -y libreoffice gimp flatpak gnome-software-plugin-flatpak xdg-desktop-portal oracle-java10-installer oracle-java10-set-default fluxgui

sudo snap install heroku --classic
sudo snap install slack --classic
sudo snap install vlc --classic

# https://flatpak.org/setup/Ubuntu/
# Add Flatpak Repository to Gnome Sofware app
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install HydraPaper - https://github.com/GabMus/HydraPaper#installing-via-flatpak
flatpak install flathub org.gabmus.hydrapaper -y
# Install Steam
flatpak install flathub com.valvesoftware.Steam -y

# Installing VSCode PPA
# https://code.visualstudio.com/docs/setup/linux#_installation
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'