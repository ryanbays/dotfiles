#!/usr/bin/bash

# Check if yay is already installed
if command -v yay &> /dev/null
then
    # Ask the user if they want to reinstall yay
    read -p "yay is already installed. Do you want to reinstall it? (y/n) " answer
    if [[ "$answer" != "y" ]]; then
        echo "Exiting without reinstalling yay."
        exit 0
    fi
    sudo pacman -Rns yay
fi

# Install yay
echo "Installing yay..."
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

