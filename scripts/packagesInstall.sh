#!/bin/bash

YEL='\033[1;33m'
BLU='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

homedir="/home/$1"
resdir="/usr/share/CALM/res"
cd $homedir
mkdir .config/i3/
echo -e "\n${YEL}####Installing i3, xtrlock, flameshot, firefox, vim, thunar, tilix####\n
${BLU}####(If you don't know what you have to type, type '2,5')####${NC}\n"
sudo -S pacman -Syu i3 xtrlock tilix flameshot thunar firefox vim
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
    sudo chmod u+rw .bashrc .scripts/* .config/i3/config
    echo -e "\n${YEL}####Installing SebDruon's vim config####\n"
    git clone https://github.com/GlaconBleu/config_vim.git ~/.config_vim
    ln -s .config_vim .vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo -e "\n${BLU}####Now, you have to connect to your new session(with i3) start vim with 'vim' ####\n
then you type: 'VundleInstall'.\n
You wait that the installation finishes, and finally you can leave vim with ':q!'\n${NC}"

else
	echo -e "\n${RED}####Error while installing i3, xtrlock, firefox, vim, flameshot tilix####\n"
fi
