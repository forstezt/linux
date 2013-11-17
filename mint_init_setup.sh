#!/bin/bash

#install basic programs and versioning systems
echo "Choose something to install."
select prgm in "Vim" "Tmux" "Git" "Mercurial" "Svn" "Oracle Java" "Google Chrome" "None"
do
    case $prgm in
        Vim) 
            sudo apt-get install vim;;

        Tmux)
            sudo apt-get install tmux

            #if the .tmux.conf file doesn't exist, create it
            if [ ! -f ~/.tmux.conf ]
                then 
                    touch ~/.tmux.conf       
            fi
            echo "unbind C-b" >> ~/.tmux.conf
            echo "set -g prefix C-a" >> ~/.tmux.conf

        Git)
            sudo apt-get install git
            git config --global user.email "zforster@hotmail.com"
            git config --global user.name "Zach";; 

        Mercurial)
            sudo apt-get install mercurial
            #if the .hgrc file doesn't exist, create it
            if [ ! -f ~/.hgrc ]
                then 
                    touch ~/.hgrc       
            fi
            echo "[ui]" >> ~/.hgrc
            echo "username = Zach Forster forstezt@uwec.edu" >> ~/.hgrc;;

        Svn)
            sudo apt-get install svn;;

        'Oracle Java')
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
            rm ~/Downloads/current_java.tar.gz;;

        'Google Chrome')
            cd ~/Downloads
            sudo apt-get install libxss1
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg -i google-chrome*.deb
            rm ~/Downloads/google-chrome*.deb*;; 

        None)
            break;;
    esac
done	

echo "Map UWEC drives?"
select yn in "Yes" "No"
do
    case $yn in
        Yes)
            #if the .uwec_credentials file doesn't exits, create it
            if [ ! -f ~/.uwec_credentials ]
                then 
                    touch ~/.uwec_credentials       
            fi
        
            #enter credentials in the .uwec_credentials file
            echo "username=UWEC\\forstezt" >> ~/.uwec_credentials
            echo "password=@FTZ#coconutpie" >> ~/.uwec_credentials

            #create folders to which to mount the h and w drives
            sudo mkdir /media/H
            sudo mkdir /media/W

            #enter mounting information into /etc/fstab
            sudo echo "//students.uwec.edu/forstezt\$ /media/H cifs credentials=/home/forstezt/.uwec_credentials,gid=1000,uid=1000,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
            sudo echo "//students.uwec.edu/deptdir /media/W cifs credentials=/home/forstezt/.uwec_credentials,gid=1000,uid=1000,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab;;

        No)
            break;;
    esac
done	


#create config files
#TODO: set up .hgrc, .bashrc, .vimrc, tmux key bindings
