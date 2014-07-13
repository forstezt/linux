#!/bin/bash

cd ~/Downloads
file_url=$(wget -q -O- http://eclipse.org/downloads/?osType=linux | grep -o -e '/technology/epp/downloads/release/.*/eclipse-standard-.*-linux-gtk-x86_64.tar.gz')
wget http://download.eclipse.org$file_url -O 'current_eclipse.tar.gz'
tar -zxvf current_eclipse.tar.gz
rm current_eclipse.tar.gz
sudo mv eclipse /opt
cd /usr/local/bin
sudo ln -s /opt/eclipse/eclipse
sudo cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm
