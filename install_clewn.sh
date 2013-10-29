#!/bin/bash

tar -xzvf 'clewn*'
mkdir ~/Documents/program_files
rm 'clewn*tar*'
mv 'clewn*' ~/Documents/program_files
cd '~/Documents/program_files/clewn*'
sudo apt-get install libreadline-dev
sudo apt-get install libncurses5-dev
./configure
make
sudo make install 
