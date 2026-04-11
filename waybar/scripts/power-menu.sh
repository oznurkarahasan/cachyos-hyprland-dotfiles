#!/bin/bash

# Sadece ikonlar
lock=""
suspend="󰤄"
reboot="󰜉"
shutdown=""

chosen=$(printf "$lock\n$suspend\n$reboot\n$shutdown" | rofi -dmenu \
    -p "System" \
    -theme-str '
    window {
        width: 900px;
        background-color: transparent;
    }
    mainbox {
        background-color: transparent;
        children: [ listview ];
        padding: 20px;
    }
    listview {
        columns: 4;
        lines: 1;
        spacing: 20px;
        cycle: true;
        dynamic: true;
        layout: vertical;
        fixed-height: true;
        background-color: transparent;
    }
    element {
        padding: 60px 10px;
        border-radius: 30px;
        background-color: #fdf6e3; /* Tüm kutuların arka planı aynı (Krem/Beyaz) */
        border: 4px;
        border-color: #b19cd9;      /* Normal mor çerçeve */
    }
    element-text {
        font: "JetBrainsMono Nerd Font 64";
        horizontal-align: 0.5;
        vertical-align: 0.5;
        text-color: #b19cd9;
        background-color: transparent;
    }
    inputbar { enabled: false; }
    ')

case "$chosen" in
    $lock) hyprlock ;;
    $suspend) systemctl suspend ;;
    $reboot) systemctl reboot ;;
    $shutdown) systemctl poweroff ;;
esac
