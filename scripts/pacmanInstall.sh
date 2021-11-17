#!/bin/bash

homedir="/home/$1"
echo "Installing i3-wm"
sudo -S pacman -S i3-wm
if [ $? -eq 0 ];
then 
	cp res/i3/i3conf $homedir/.config/i3/config
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    rm $homedir/.bashrc
    cp res/bashrc $homedir/.bashrc
    rm -r .oh-my-bash/themes/brainy
    cp -r res/ohmybash/customTheme_Brainy $homedir/.oh-my-bash/themes/brainy
    cp -r res/scripts $homedir/.scripts
else
	echo "Error while installing i3-wm"
fi
