#!/bin/bash

# Script to cycle between keyboard layouts (fr -> ara -> us)
# Dependencies: setxkbmap, notify-send

# Check for required commands
for cmd in setxkbmap notify-send; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: Required command '$cmd' not found"
        exit 1
    fi
done

# Get current keyboard layout
CURRENT=$(setxkbmap -query | awk '/layout/ {print $2}') || {
    notify-send "Keyboard Error" "Failed to query current layout"
    exit 1
}

# Cycle through layouts
case "${CURRENT}" in
    "fr")
        if ! setxkbmap ara; then
            notify-send "Keyboard Error" "Failed to switch to Arabic layout"
            exit 1
        fi
        notify-send "Keyboard" "Switched to Arabic layout"
        ;
    "ara")
        if ! setxkbmap us; then
            notify-send "Keyboard Error" "Failed to switch to US layout"
            exit 1
        fi
        notify-send "Keyboard" "Switched to US layout"
        ;;
    *)  # Default to French for any other layout
        if ! setxkbmap fr; then
            notify-send "Keyboard Error" "Failed to switch to French layout"
            exit 1
        fi
        notify-send "Keyboard" "Switched to French layout"
        ;;
esac
