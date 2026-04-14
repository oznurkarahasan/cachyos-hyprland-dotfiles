#!/bin/bash

LAYOUT=$1

case "$LAYOUT" in
    "laptop-left")
        hyprctl keyword monitor "eDP-1, 2560x1440@165, 0x0, 1"
        hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 2560x0, 1"
        ;;
    "external-left")
        hyprctl keyword monitor "HDMI-A-1, 1920x1080@60, 0x0, 1"
        hyprctl keyword monitor "eDP-1, 2560x1440@165, 1920x0, 1"
        ;;
esac
