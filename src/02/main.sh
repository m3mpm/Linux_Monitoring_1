#!/bin/bash

. ./systemInfo.sh

read -p "Do you want save data in a file? [Y/N]: "

if [[ $REPLY == 'Y' || $REPLY == 'y' ]]; then
    file=$(date +"%d_%m_%Y_%H_%M_%S.status")
    sudo touch $file
    sudo chmod 666 $file
    ./systemInfo.sh > $file
else
    echo "You haven't entered \"Y or y\". Data haven't been saved in a file."
fi
