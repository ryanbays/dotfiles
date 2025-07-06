#!/usr/bin/bash

# Installs dependencies
yay || (sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
sudo pacman -Syu --needed --noconfirm git go neovim nodejs npm rustup clang eza bat unzip fzf hyprlock cava wofi python-pywal swaync fish waybar blueman nwg-look brightnessctl flatpak stow
yay -S --noconfirm wlogout

sh install_config.sh

# Set fish as default shell
if [ "$SHELL" != "$(which fish)" ]; then
    echo "$(which fish)" | sudo tee -a /etc/shells
    chsh -s "$(which fish)"
    fish -c fish_config
fi

# Install SDDM theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

