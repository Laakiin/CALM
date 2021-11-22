#!/bin/bash

os=$(cat /etc/*release | grep "PRETTY_NAME" | cut -d'=' -f2)

case $os in

    *"Manjaro"*)
        echo "manjaro";;

    *"Ubuntu"*)
        echo "ubuntu";;

    *"CentOS"*)
        echo "centos";;

    *"Fedora"*)
        echo "fedora"

    *"Mint"*)
        echo "mint";;

    *"Debian"*)
        echo "debian";;

    *)
        echo "na";;
esac
