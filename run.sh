#!/bin/bash

PS3="Choose an option: "
options=("Full install" "Install config files" "Install Vencord" "Exit")

cd scripts

select opt in "${options[@]}"
do
    case $opt in
        "Full install")
            bash install.sh
            ;;
        "Install config files")
            bash install_config.sh
            ;;
        "Install Vencord")
            bash install_vencord.sh 
            ;;
        "Exit") 
            break 
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done
