#!/bin/bash

sudo apt-get install tmux

# if the ~/.tmux.conf file doesn't exist, create it
if [ ! -f ~/.tmux.conf ]
    then
        touch ~/.tmux.conf
        echo "created ~/.tmux.conf"
fi
echo "unbind C-b" >> ~/.tmux.conf
echo "set -g prefix C-a" >> ~/.tmux.conf
