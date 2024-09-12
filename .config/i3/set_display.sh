connected_display=$(xrandr | grep " connected" | awk '{print $1}')

echo $connected_display

if [[ $connected_display == "DP-0" ]]; then
  xrandr --output DP-0 --mode 5120x1440 --rate 165.00
fi

if [[ $connected_display == "DP-4" ]]; then
  xrandr --output DP-4 --mode 5120x1440 --rate 165.00
fi
