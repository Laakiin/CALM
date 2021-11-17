#!/bin/bash

homedir="/home/$1"
cd $homedir
mkdir .config/i3/
echo "Installing i3-wm"
sudo -S pacman -S i3-wm
if [ $? -eq 0 ];
then 
	sudo -S cp res/i3/i3conf $homedir/.config/i3/config
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    rm $homedir/.bashrc
    sudo -S cp res/bashrc $homedir/.bashrc
    rm -r $homedir/.oh-my-bash/themes/brainy
    sudo -S cp -r res/ohmybash/customTheme_Brainy $homedir/.oh-my-bash/themes/brainy
    sudo -S cp -r res/scripts $homedir/.scripts
else
	echo "Error while installing i3-wm"
fi
