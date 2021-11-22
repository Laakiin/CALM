#!/bin/bash

YEL='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

DISTRO=$(bash ./os_bash.sh)

case $DISTRO in

    "manjaro")
        SUDO="wheel"
        PKG="pacman";;

    "fedora")
        SUDO="wheel"
        PKG="dnf";;
    
    "centos")
        SUDO="wheel"
        PKG="yum";;

    "ubuntu")
        SUDO="sudo"
        PKG="apt";;
    
    "debian")
        SUDO="sudo"
        PKG="apt";;
    
    "mint")
        SUDO="sudo"
        PKG="apt";;
    
    "na")
        echo "Don't know distro"

esac

if [[ -n $1 ]]; then
    homedir="/home/$1"
    sudo useradd -m -U $1
    echo -e "\n${YEL}Now you have to set a password for $1: \n"
    sudo passwd $1
    echo -e "\n${YEL}Adding $1 to sudoers${NC}\n"
    sudo usermod -aG $SUDO $1
    echo -e "\n${YEL}Creating and moving res file to /usr/share/CALM\n"
    sudo mkdir /usr/share/CALM
    sudo mv ./res /usr/share/CALM/res/
    echo -e "\n${YEL}Installing...\n"
    sudo su $1 -c "bash scripts/packagesInstall.sh $1 $PKG"
else
    echo -e "\n${RED}You have to set the username of your new accout as an argument!\n"
fi
