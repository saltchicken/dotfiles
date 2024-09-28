#!/bin/bash

hyprctl dispatch exec 'kitty --title "TL" --hold -e "neofetch"'

pkill -SIGUSR1 waybar
