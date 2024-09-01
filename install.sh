#!/bin/bash

# Add check to make sure that stow is installed

# Also need to add a way to overwrite the current files

stow . -t "$HOME"

# keyd configuartion is in /etc/keyd/
# This block of code links .config in user home directory to /etc/keyd
home_dir="$HOME"
sudo -i <<EOF
echo "Created symlink for keyd at /etc/keyd/default.conf"
ln -s "$home_dir/.config/keyd/default.conf" /etc/keyd/default.conf
EOF
