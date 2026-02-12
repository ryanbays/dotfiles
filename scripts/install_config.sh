#!/usr/bin/bash

mkdir -p "$HOME/.config.backup"
cd ../configs/
for d in */ ; do
    mv "$HOME/.config/$d" "$HOME/.config.backup/$d" 2>/dev/null
    stow -t ~ $d
done
cd -

hypr_script=$(realpath ./hyprland_start.sh)

touch ~/monitors.conf

sudo tee /etc/greetd/config.toml > /dev/null << EOF
[terminal]
vt = 1

[default_session]
command = "$hypr_script"
user = "$USER"
EOF

