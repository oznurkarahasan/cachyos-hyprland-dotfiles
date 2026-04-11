#!/bin/bash

WALLPAPER_DIR="$HOME/shell-wallpapers/images"

chosen=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | \
    while read -r img; do
        echo -en "$img\0icon\x1f$img\n"
    done | rofi -dmenu -show-icons -i \
        -theme-str 'window {width: 800px; height: 600px;}' \
        -theme-str 'listview {columns: 4; lines: 3;}' \
        -theme-str 'element-icon {size: 150px;}' \
        -theme-str 'element-text {enabled: false;}' \
        -p "Duvar Kağıdı Seç")

if [ -n "$chosen" ]; then
    awww img "$chosen" --transition-type fade --transition-duration 1
fi
