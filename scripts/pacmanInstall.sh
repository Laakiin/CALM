#!/bin/bash

homedir="/home/$1"
echo "Installing i3-wm"
sudo -S pacman -S i3-wm
if [ $? -eq 0 ];
then
	echo  "Do you want to install polybar?" 
	read -p "You might need to edit config files for your computer" yn
	case $yn in
		[Yy]* ) sudo -S pacman -S polybar && sudo -S rm -r $homedir/.config/polybar/blocks $homedir/.config/polybar/colorblocks $homedir/.config/polybar/cuts $homedir/.config/polybar/docky $homedir/.config/polybar/forest $homedir/.config/polybar/grayblocks $homedir/.config/polybar/hack $homedir/.config/polybar/material $homedir/.config/polybar/shades $homedir/.config/polybar/shapes && sudo -S cp -r res/i3/customTheme_Shapes shapes && cp res/i3/i3conf_polybar $homedir/.config/i3/config;;
		[Nn]* ) cp res/i3/i3conf_nopolybar $homedir/.config/i3/config;;
	esac

else
	echo "Error while installing i3-wm"
fi


