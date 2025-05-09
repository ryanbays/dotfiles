#!/bin/bash

cp -r .config/* $HOME/.config/
read -p "Install neovim config? [y/n]" neovim
if [ "${neovim,,}" == "y" ]
then
    git clone https://github.com/rain-1107/nvim $HOME/.config/nvim 
fi

# Installs dependencies
yay || (sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
sudo pacman -Syu --needed --noconfirm git go neovim nodejs npm rustup clang eza bat unzip fzf hyprlock cava wofi python-pywal swaync fish waybar blueman nwg-look brightnessctl flatpak
yay -S --noconfirm wlogout


# Set fish defualt shell
if [ "$SHELL" != "$(which fish)" ]
then
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
    fish -c fish_config
fi


# Install script for sddm theme from https://github.com/Keyitdev/sddm-astronaut-theme/tree/master
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"


