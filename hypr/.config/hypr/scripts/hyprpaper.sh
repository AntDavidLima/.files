#!/bin/bash

image_path=$(find ~/Pictures/Wallpapers/Gruvbox | sort -R | tail -1)

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$image_path"
hyprctl hyprpaper wallpaper "HDMI-A-1,$image_path"
