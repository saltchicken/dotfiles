display_width=5120
display_height=1440

terminal_width=1920
terminal_height=1260

left_pos=$((((display_width / 2) - terminal_width) / 2))
right_pos=$((left_pos + (display_width / 2)))

pos_x=$(i3-msg -t get_tree | jq '.. | select(.name? == "Firefox Terminal") | .rect | .x')

if [[ "$pos_x" == "$left_pos" ]]; then
  i3-msg '[title="Firefox Terminal"] move container position '$right_pos' 100'

fi

if [[ "$pos_x" == "$right_pos" ]]; then
  i3-msg '[title="Firefox Terminal"] move container position '$left_pos' 100'
fi
