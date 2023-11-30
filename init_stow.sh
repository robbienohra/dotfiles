#!/bin/bash

stow_dirs=("psql" "rg" "stow" "usql" "vsnip")

for d in "${stow_dirs[@]}"; do
    stow "$d"
done

stow -t ~/.config .config
