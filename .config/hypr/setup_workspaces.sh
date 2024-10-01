#!/bin/bash

hyprctl dispatch exec 'wezterm --config-file "/home/saltchicken/.config/hypr/wezmatrix.lua"'
# hyprctl dispatch workspace 2 && firefox
# hyprctl dispatch workspace 3 && discord
# hyprctl dispatch workspace 3 && youtube-music

sleep 1
hyprctl dispatch exec 'pkill -SIGUSR1 waybar'
# hyprctl dispatch cyclenext && hyprctl dispatch bringactivetotop
# hyprctl dispatch movecursor 2000 400
# hyprctl dispatch focuswindow "^(kitty)$"
hyprctl dispatch exec 'kitty --title "Main" --hold -e "tmux"'
