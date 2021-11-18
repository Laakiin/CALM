#!/bin/bash

if [[ -n $1 ]]; then
    homedir="/home/$1"
    sudo useradd -m -U $1
    echo "Now you have to set a password for $1: "
    sudo passwd $1
    sudo usermod -aG wheel $1
    sudo mv ./res /usr/share/CALM/res/
    sudo su $1 -c "bash scripts/pacmanInstall.sh $1"
else
    echo "You have to set the username of your new accout as an argument!"
fi
