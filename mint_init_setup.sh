#!/bin/bash

#install basics
sudo apt-get install vim
sudo apt-get install tmux

#install versioning systems
sudo apt-get install git
sudo apt-get install mercurial
sudo apt-get install svn 

#install oracle java
sudo apt-get update && apt-get purge openjdk-\*
sudo apt-get autoremove && sudo apt-get clean
cd ~/Downloads
url=$(wget -q -O- http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html | grep -o -e 'http://download.oracle.com/otn-pub/java/jdk/.*-linux-x64.tar.gz')
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com" $url -O 'current_java.tar.gz'
tar -zxvf current_java.tar.gz
filename=$(ls | grep -o -e 'jdk.*')
sudo mkdir -p /opt/java
sudo mv $filename /opt/java 
sudo update-alternatives --install "/usr/bin/java" "java" "/opt/java/$filename/bin/java" 1
sudo update-alternatives --set java /opt/java/$filename/bin/java
rm ~/Downloads/current_java.tar.gz

#install google chrome
cd ~/Downloads
sudo apt-get install libxss1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm ~/Downloads/google-chrome*.deb* 

#map h and w drives
#TODO: figure out how to write to the end of a file

#TODO: set up .hgrc, .bashrc, .vimrc, tmux key bindings
