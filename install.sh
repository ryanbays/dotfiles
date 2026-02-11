#!/usr/bin/bash

# Installs dependencies
yay || ./install_yay.sh
sudo pacman -Syu --needed --noconfirm < packages.txt 

yay -S --noconfirm < aurs.txt

bash install_config.sh

# Set fish as default shell
if [ "$SHELL" != "$(which fish)" ]; then
    echo "$(which fish)" | sudo tee -a /etc/shells
    chsh -s "$(which fish)"
    fish -c fish_config
fi

