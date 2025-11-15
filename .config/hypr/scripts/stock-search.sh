#!/bin/bash

# 1. Use wofi to get a symbol from you.
#    (If you use rofi, you can replace 'wofi --dmenu' with 'rofi -dmenu')
SYMBOL=$(wofi --dmenu --prompt "Search Stock:")

# 2. If you typed something (and didn't just press Esc)
if [ -n "$SYMBOL" ]; then
  # 3. Use xdg-open (the standard Linux way) to open the URL
  xdg-open "https://www.google.com/search?q=${SYMBOL}+stock"
fi
