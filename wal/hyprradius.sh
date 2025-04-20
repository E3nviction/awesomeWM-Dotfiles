#!/bin/bash

file="/home/enviction/.config/wal/borderradius.css"

# Check if the file exists
if [ -f "$file" ]; then
    # Extract the color value using grep and awk
    border_radius=$(grep -m 1 'border-radius' "$file" | awk '{print $2}')

    # Remove any trailing semicolon if present
    border_radius=${border_radius%;}
    border_radius=${border_radius%px}

    # Print the extracted color value
    echo "$border_radius"
else
    echo "Error: File $file not found."
    exit 1
fi
echo "hyprctl keyword 'decoration:rounding' '$border_radius'"
hyprctl keyword 'decoration:rounding' "$border_radius"
