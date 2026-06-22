#!/bin/bash

set -e

SERVICE_NAME="lodomo-arcade"
SERVICE_FILE="${SERVICE_NAME}.service"
TARGET_DIR="/etc/systemd/system/"

echo "[*] Copying ${SERVICE_NAME}.service to ${TARGET_DIR}..."
sudo cp "$SERVICE_FILE" "$TARGET_DIR"

echo "[*] Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "[*] Enabling service (starts on boot)..."
sudo systemctl enable "${SERVICE_NAME}.service"

echo "[*] Updating game files..."
./update_game.sh

echo "[+] Done! 'Lodomo Arcade' is running."
echo "    Check status with: sudo systemctl status lodomo-arcade"



