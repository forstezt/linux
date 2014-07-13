#!/bin/bash

sudo apt-get install mercurial
#if the .hgrc file doesn't exist, create it
if [ ! -f ~/.hgrc ]
    then
        touch ~/.hgrc
fi
echo "[ui]" >> ~/.hgrc
echo "username = Zach Forster forstezt@uwec.edu" >> ~/.hgrc
