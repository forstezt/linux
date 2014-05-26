#!/bin/bash

# This is a list of every KDE-specific package, current for Ubuntu 12.04
pkgToRemoveListFull=$(cat kubuntu.12.04.packages)

pkgToRemoveList=""

# build up a list of every KDE-specific package which is actually installed on this machine
for pkgToRemove in $(echo $pkgToRemoveListFull); do
    $(dpkg --status $pkgToRemove &> /dev/null)
    if [[ $? -eq 0 ]]; then
        pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
    fi
done

sudo apt-get --purge remove $pkgToRemoveList
