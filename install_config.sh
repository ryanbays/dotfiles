#!/usr/bin/bash

mkdir -p "$HOME/.config.backup"
for d in */ ; do
    mv "$HOME/.config/$d" "$HOME/.config.backup/$d" 2>/dev/null
    stow $d
done

hypr_script=$(realpath ./hyprland_start.sh)

sudo tee /etc/greetd/config.toml > /dev/null << EOF
[terminal]
vt = 1

[default_session]
command = "$hypr_script"
user = "$USER"
EOF

./install_vencord.sh
