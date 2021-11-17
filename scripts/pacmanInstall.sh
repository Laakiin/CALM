#!/bin/bash

homedir="/home/$1"
echo "Installing i3-wm"
sudo -S pacman -S i3-wm
if [ $? -eq 0 ];
then 
	cp res/i3/i3conf $homedir/.config/i3/config
else
	echo "Error while installing i3-wm"
fi


