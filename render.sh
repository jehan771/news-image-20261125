#!/bin/sh
# Render the front page: HTML -> 2048 screenshot -> 1024 entry.png
set -e
cd "$(dirname "$0")"
node ~/workspace/makefun/shot-tools/shot.mjs "file://$PWD/frontpage.html" render-2048.png 2048 2048
python3 downscale.py render-2048.png entry.png
ls -l entry.png
sha256sum entry.png
