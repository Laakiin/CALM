#!/bin/bash

YEL='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

homedir="/home/$1"
resdir="/usr/share/CALM/res"
cd $homedir
mkdir .config/i3/
echo -e "\n${YEL}####Installing i3-wm####${NC}\n
(If you don't know what you have to type, type '2,5')\n"
sudo -S pacman -S i3
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
else
	echo -e "\n${RED}####Error while installing i3-wm####\n"
fi
