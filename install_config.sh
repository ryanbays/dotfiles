#!/usr/bin/bash

# Create backup of existing config if it exists
if [ -d "$HOME/.config" ]; then
    echo "Backing up existing config to ~/.config.backup"
    cp "$HOME/.config" "$HOME/.config.backup"
fi

for d in */ ; do
    stow $d
done
