#!/bin/bash

hyprctl dispatch exec 'kitty --title "Main" --hold -e "neofetch"'
hyprctl dispatch exec 'kitty --title "Background" --hold -e "test.sh"'

# pkill -SIGUSR1 waybar
