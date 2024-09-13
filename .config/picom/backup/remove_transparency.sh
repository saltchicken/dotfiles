#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <config_file> <pattern>"
  exit 1
fi

config_file="$1"
pattern="$2"
backup_file="${config_file}.bak"

# Make a backup of the config file
cp "$config_file" "$backup_file"

# Comment out the matching line(s) and save the result
sed -i "/$pattern/ s/^/# /" "$config_file"

echo "The line matching '$pattern' has been commented out in $config_file."
echo "A backup of the original file has been saved as $backup_file."
