#!/bin/bash

file="/home/enviction/.config/wal/accent.css"

# Check if the file exists
if [ -f "$file" ]; then
    # Extract the color value using grep and awk
    color=$(grep -m 1 '@define-color accent' "$file" | awk '{print $3}')

    # Remove any trailing semicolon if present
    color=${color%;}

    color=${color#\#}

    # Print the extracted color value
    echo "$color"
else
    echo "Error: File $file not found."
    exit 1
fi

echo "hyprctl keyword 'general:col.active_border' 'rgba(${color}EE)'"

hyprctl keyword 'general:col.active_border' "rgba(${color}EE)"
