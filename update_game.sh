#!/bin/bash
BASE=$(cat lodomo.location | tr -d '\n')
curl "${BASE}/game.pck"
curl "${BASE}/game.x86_64"
curl "${BASE}/version.md"

# Restart lodomo-arcade.service
sudo systemctl restart lodomo-arcade.service
