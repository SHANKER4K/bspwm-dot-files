#!/bin/bash

# Get current keyboard layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# Toggle between layouts
if [ "$current_layout" = "fr" ]; then
    setxkbmap ara
else 
    setxkbmap fr
fi