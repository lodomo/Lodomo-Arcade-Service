#!/bin/bash
# Check if there's a folder called "game" and if not, make it.
if [ ! -d "game" ]; then
  mkdir game
fi

# CD into the game folder
cd game

BASE=$(cat ../lodomo.location | tr -d '\r\n' | xargs)
echo "Base URL for game files: ${BASE}"
# Sending a curl to
echo "Downloading game files from ${BASE}..."

echo "Downloading game.pck from ${BASE}/game.pck..."
curl -L -O "${BASE}/game.pck"

echo "Downloading game.x86_64 from ${BASE}/game.x86_64..."
curl -L -O "${BASE}/game.x86_64"

echo "Downloading version.md from ${BASE}/version.md..."
curl -L -O "${BASE}/version.md"

# Restart lodomo-arcade.service
sudo systemctl restart lodomo-arcade.service

