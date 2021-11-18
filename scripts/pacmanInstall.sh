#!/bin/bash

homedir="/home/$1"
resdir="/usr/share/CALM/res"
cd $homedir
mkdir .config/i3/
echo "Installing i3-wm"
sudo -S pacman -S i3-wm
if [ $? -eq 0 ];
then
    echo "Copying i3 config" 
	sudo -S cp $resdir/i3/i3conf $homedir/.config/i3/config
    echo "Installing oh-my-bash"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    echo "Deleting .bashrc"
    rm $homedir/.bashrc
    echo "Copying the new .bashrc"
    sudo -S cp $resdir/bashrc $homedir/.bashrc
    echo "Copying new brainy theme"
    sudo -S cp -r $resdir/ohmybash/brainy_alt $homedir/.oh-my-bash/themes/
    echo "Copying scripts directory"
    sudo -S cp -r $resdir/scripts $homedir/.scripts
else
	echo "Error while installing i3-wm"
fi
