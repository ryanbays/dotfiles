#!/bin/bash

for d in .config/*/; do
    cp -r $HOME/.config/${d:8:-1} .config/
done

