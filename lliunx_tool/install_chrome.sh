#!/bin/bash

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google*
sudo apt-get -y install -f
sudo apt-get -y remove chrome-chrome-stable
sudo apt -y autoremove
rm google-chrome*
echo "google-chrome install ok !"
