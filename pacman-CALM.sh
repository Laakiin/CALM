#!/bin/bash

YEL='\033[1;33m'
RED='\033[0;31m'


if [[ -n $1 ]]; then
    homedir="/home/$1"
    sudo useradd -m -U $1
    echo -e "\n${YEL}Now you have to set a password for $1: \n"
    sudo passwd $1
    echo -e "\n${YEL}Adding $1 to sudoers\n"
    sudo usermod -aG wheel $1
    echo -e "\n${YEL}Creating and moving res file to /usr/share/CALM\n"
    sudo mkdir /usr/share/CALM
    sudo mv ./res /usr/share/CALM/res/
    echo -e "\n${YEL}Launching the installation\n"
    sudo su $1 -c "bash scripts/pacmanInstall.sh $1"
else
    echo -e "\n${RED}You have to set the username of your new accout as an argument!\n"
fi
