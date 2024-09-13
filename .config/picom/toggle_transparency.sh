#!/bin/bash

# Usage: ./toggle_comment.sh config_file search_string

CONFIG_FILE="$1"
SEARCH_STRING="$2"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "File not found!"
  exit 1
fi

# Backup the config file
cp "$CONFIG_FILE" "${CONFIG_FILE}.bak"

# Toggle comment for the specific line
sed -i.bak "/^[^#]*$SEARCH_STRING/ s/^/#/; t; s/^#\([^#]*$SEARCH_STRING\)/\1/" "$CONFIG_FILE"

echo "Toggled comment for the line containing: $SEARCH_STRING"
