#!/bin/bash

cp -r .config/* $HOME/.config/

# Installs dependencies
yay -Q || (sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
sudo pacman -Syu --needed git go neovim nodejs npm rustup clang eza bat unzip fzf hyprlock cava wofi python-pywal swaync fish waybar blueman nwg-look brightnessctl flatpak
yay -S wlogout

# Set fish defualt shell
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

fish -c fish_config

# Install script for sddm theme from https://github.com/Keyitdev/sddm-astronaut-theme/tree/master
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
