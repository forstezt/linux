#!/bin/bash

# This is a list of every KDE-specific package, current for Ubuntu 12.04
pkgToRemoveListFull=$(cat kubuntu.12.04.packages)

pkgToRemoveList=""

for pkgToRemove in $(echo $pkgToRemoveListFull); do
    $(dpkg --status $pkgToRemove &> /dev/null)
    if [[ $? -eq 0 ]]; then
        pkgToRemoveList="$pkgToRemoveList $pkgToRemove"
    fi
done

echo $pkgToRemoveList

#sudo apt-get --purge remove $pkgToRemoveList
