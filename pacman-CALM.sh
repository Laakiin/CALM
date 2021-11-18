#!/bin/bash

if [[ -n $1 ]]; then
    homedir="/home/$1"
    sudo useradd -m -U $1
    echo "Now you have to set a password for $1: "
    sudo passwd $1
    echo "Adding $1 to sudoers"
    sudo usermod -aG wheel $1
    echo "Creating and moving res file to /usr/share/CALM"
    sudo mkdir /usr/share/CALM
    sudo mv ./res /usr/share/CALM/res/
    echo "Launching the installation"
    sudo su $1 -c "bash scripts/pacmanInstall.sh $1"
else
    echo "You have to set the username of your new accout as an argument!"
fi
