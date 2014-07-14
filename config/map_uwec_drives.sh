#!/bin/bash

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
echo "added line to /etc/fstab to map W: drive"
