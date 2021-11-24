#!/bin/bash

YEL='\033[1;33m'
BLU='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

homedir="/home/$1"
resdir="/usr/share/CALM/res"
cd $homedir
sudo -S mkdir -p $homedir/.config/i3
echo -e "\n${YEL}####Installing i3, xtrlock, flameshot, firefox, vim, thunar, tilix####${NC}\n"

case $2 in

    "pacman")
        sudo -S pacman -Sy curl i3-wm i3-status xtrlock tilix flameshot thunar firefox vim;;

    "apt")
        sudo -S apt update
        sudo -S apt install curl i3 xtrlock tilix flameshot thunar firefox vim;;

esac

if [ $? -eq 0 ];
then
    echo -e "\n${YEL}####Copying i3 config####\n" 
	sudo -S cp $resdir/i3/i3conf $homedir/.config/i3/config
    echo -e "\n${YEL}####Installing oh-my-bash####\n"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Laakiin/CALM/main/res/ohmybash/omb_install.sh)"
    echo -e "\n${YEL}####Deleting .bashrc####\n"
    rm $homedir/.bashrc
    echo -e "\n${YEL}####Copying the new .bashrc####\n"
    sudo -S cp $resdir/bashrc $homedir/.bashrc
    echo -e "\n${YEL}####Copying new brainy theme####\n"
    sudo -S cp -r $resdir/ohmybash/brainy_alt $homedir/.oh-my-bash/themes/
    echo -e "\n${YEL}####Copying scripts directory####\n"
    sudo -S cp -r $resdir/scripts $homedir/.scripts
    echo -e "\n${YEL}####Rights adjustment####\n"
    sudo -S chmod u+rw .bashrc .scripts/* .config/i3/config
    cat $resdir/introduction

else
	echo -e "\n${RED}####Error while installing i3, xtrlock, firefox, vim, thunar, flameshot or tilix####${NC}\n"
fi
