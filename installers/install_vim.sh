#!/bin/bash

sudo apt-get install vim

# if the ~/.vimrc file doesn't exist, add it
if [ ! -f ~/.vimrc ]
    then
        mv ../config/.vimrc ~
        echo "added ~/.vimrc"
fi

# if the ~/.vim directory doesn't exist, add it
if [ ! -f ~/.vim ]
    then
        mv ../config/.vim ~
        echo "created ~/.vim directory"
fi

echo "successfully installed and configured vim
