#!/bin/bash
# Check if there's a folder called "game" and if not, make it.
if [ ! -d "game" ]; then
  mkdir game
fi

# CD into the game folder
cd game

BASE=$(cat lodomo.location | tr -d '\n')
curl "${BASE}/game.pck"
curl "${BASE}/game.x86_64"
curl "${BASE}/version.md"

# Restart lodomo-arcade.service
sudo systemctl restart lodomo-arcade.service
