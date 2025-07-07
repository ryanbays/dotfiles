#!/usr/bin/bash

mkdir -p "$HOME/.config.backup"
for d in */ ; do
    mv "$HOME/.config/$d" "$HOME/.config.backup/$d" 2>/dev/null
    stow $d
done
