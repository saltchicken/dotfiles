#!/bin/bash

desired_prefix="Firefox Terminal"

# current_title=$(xprop -id $(xprop -root _NET_ACTIVE_WINDOW | grep -o "^_NET_ACTIVE_WINDOW.*" | cut -d ' ' -f 5) WM_NAME | cut -d ' ' -f 2)

current_title=$(xprop -root | grep "_NET_ACTIVE_WINDOW(WINDOW)" | cut -d " " -f 5 | xargs -I {} xprop -id {} WM_NAME | cut -d '"' -f 2)
echo $current_title

if [[ "$current_title" == "Firefox Terminal Right" ]]; then
  xdotool set_window --name "Firefox Terminal Left" $(xdotool search --name "Firefox Terminal")
fi

if [[ "$current_title" == "Firefox Terminal Left" ]]; then
  xdotool set_window --name "Firefox Terminal Right" $(xdotool search --name "Firefox Terminal")
fi

# if [[ "$current_title" =~ ^"$desired_prefix" ]]; then
# i3-msg 'rename window to "Firefox Terminal Right"'
# xdotool set_window --name "Firefox Terminal Right" $(xdotool getactivewindow)
# fi
