#!/bin/bash
set -e

echo "[*] Updating game files..."
./update_game.sh

echo "[*] Disabling lockscreen..."
gsettings set org.gnome.desktop.screensaver lock-enabled false

echo "[*] If this is a fresh install, set the game.x86_64 file as a startup"
echo "[*] If this is a fresh install, set wallpaper to the wallpaper.png"
