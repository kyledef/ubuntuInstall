#!/bin/bash

sudo apt-get purge -y thunderbird* rhythmbox totem gnome-orca gnome-mines gnome-sudoku gnome-video-effects gnome-mahjongg transmission-gtk deja-dup cups cups-daemon aisleriot libreoffice-impress libreoffice-avmedia-backend-gstreamer libreoffice-draw libreoffice-math unity-webapps-common gnome-contacts shotwell simple-scan brasero printer-driver-*

sudo apt-get autoremove -y && sudo apt-get autoclean
