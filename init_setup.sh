#!/bin/bash

#exit if the script is not run with sudo
if [ "$(id -u)" != "0" ]; then
    echo "Please run the script with sudo or login as root."
    exit 1
fi

#install basic programs and versioning systems
echo "Choose something to install."
select prgm in "Vim" "Tmux" "Git" "Mercurial" "Svn" "Oracle Java" "Eclipse" "Google Chrome" "Irssi" "None"
do
    case $prgm in
        'Vim') 
            sudo apt-get install vim;;

        'Tmux')
            sudo apt-get install tmux

            #if the .tmux.conf file doesn't exist, create it
            if [ ! -f ~/.tmux.conf ]
                then 
                    touch ~/.tmux.conf       
            fi
            echo "unbind C-b" >> ~/.tmux.conf
            echo "set -g prefix C-a" >> ~/.tmux.conf;;

        'Git')
            sudo apt-get install git
            git config --global user.email "zforster@hotmail.com"
            git config --global user.name "Zach"
            git config color.ui true;;

        'Mercurial')
            sudo apt-get install mercurial
            #if the .hgrc file doesn't exist, create it
            if [ ! -f ~/.hgrc ]
                then 
                    touch ~/.hgrc       
            fi
            echo "[ui]" >> ~/.hgrc
            echo "username = Zach Forster forstezt@uwec.edu" >> ~/.hgrc;;

        'Svn') #TODO: get the right package
            sudo apt-get install subversion;;

        'Oracle Java')
            sudo add-apt-repository ppa:webupd8team/java
            sudo apt-get update
            sudo apt-get install oracle-java8-installer
            sudo apt-get install oracle-java8-set-default;;

        'Eclipse')
            cd ~/Downloads
            file_url=$(wget -q -O- http://eclipse.org/downloads/?osType=linux | grep -o -e '/technology/epp/downloads/release/.*/eclipse-standard-.*-linux-gtk-x86_64.tar.gz')
            wget http://download.eclipse.org$file_url -O 'current_eclipse.tar.gz'
            tar -zxvf current_eclipse.tar.gz
            rm current_eclipse.tar.gz
            sudo mv eclipse /opt
            cd /usr/local/bin
            sudo ln -s /opt/eclipse/eclipse
            sudo cp /opt/eclipse/icon.xpm /usr/share/pixmaps/eclipse.xpm;;
        'Google Chrome')
            cd ~/Downloads
            sudo apt-get install libxss1
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo dpkg -i google-chrome*.deb
            rm ~/Downloads/google-chrome*.deb*;; 

	'Irssi')
            sudo apt-get install irssi;;

        'None')
            break;;
    esac
done    

echo "Map UWEC drives?"
select yn in "Yes" "No"
do
    case $yn in
        Yes)
            sudo apt-get install cifs-utils

            #if the .uwec_credentials file doesn't exits, create it
            if [ ! -f ~/.uwec_credentials ]; then
                touch ~/.uwec_credentials       
                echo "~/.uwec_credentials file created"

                #enter credentials in the .uwec_credentials file
                echo "username=forstezt" >> ~/.uwec_credentials
                echo "password=@FTZ#coconutpie" >> ~/.uwec_credentials
                echo "domain=UWEC" >> ~/.uwec_credentials
                echo "uwec username and password written to file"
            fi
        

            #create folders to which the h and w drives will be mapped
            if [ -d /media/H ]; then
                echo "directory /media/H already exists"
            else
                sudo mkdir /media/H
                echo "created directory /media/H"
            fi

            if [ -d /media/W ]; then
                echo "directory /media/W already exists"
            else
                sudo mkdir /media/W
                echo "created folder /media/W"
            fi

            #enter mounting information into /etc/fstab
            sudo echo "//students.uwec.edu/forstezt\$ /media/H cifs credentials=/home/forstezt/.uwec_credentials,gid=1000,uid=1000,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
            echo "added line to /etc/fstab to map H: drive"
            sudo echo "//students.uwec.edu/deptdir /media/W cifs credentials=/home/forstezt/.uwec_credentials,gid=1000,uid=1000,iocharset=utf8,sec=ntlm 0 0" >> /etc/fstab
            echo "added line to /etc/fstab to map W: drive";;

        No)
            break;;
    esac
done    
