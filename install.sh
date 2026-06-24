#!/bin/bash
set -e

SERVICE_NAME="lodomo-arcade"
USER_DIR="${HOME}/.config/systemd/user"

# Ensure target directory exists
mkdir -p "$USER_DIR"

echo "[*] Copying ${SERVICE_NAME}.service to user config..."
cp "$SERVICE_FILE" "$USER_DIR/"

echo "[*] Reloading user daemon..."
systemctl --user daemon-reload

echo "[*] Enabling user service (starts on login)..."
systemctl --user enable "${SERVICE_NAME}.service"

echo "[*] Starting game immediately..."
systemctl --user start "${SERVICE_NAME}.service"

echo "[*] Updating game files..."
./update_game.sh

echo "[+] Done! 'Lodomo Arcade' is running as a user service."
echo "    Check status: systemctl --user status lodomo-arcade"
echo "    Logs: journalctl --user -u lodomo-arcade -f"
