#!/bin/bash

homedir="/home/$1"
sudo useradd -m -U $1
sudo passwd $1
sudo su $1 -c "bash scripts/pacmanInstall.sh $1"
