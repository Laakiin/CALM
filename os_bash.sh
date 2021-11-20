#!/bin/bash

os=$(cat /etc/*release | grep "PRETTY_NAME" | cut -d'=' -f2)

case $os in

    *"Manjaro"*)
        echo "Manjaro!";;

    *"Ubuntu"*)
        echo "Ubuntu";;

    *"CentOs"*)
        echo "CentOs!";;

    *"Fedora"*)
        echo "Fedora!";;

    *"Mint"*)
        echo "Linux Mint!";;

    *"Debian"*)
        echo "Debian!";;

    *)
        echo "Unknown :(";;
esac
