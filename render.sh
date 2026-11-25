#!/bin/sh
# render.sh — render frontpage.html into entry.png (1024x1024).
#
# The newspaper front page for 25 November 2026 lives in frontpage.html
# (same directory as this script). A headless Chromium screenshots it at
# exactly 1024x1024 pixels and writes the result as entry.png next to it.
# No network is needed: the page is self-contained and loaded from disk.
#
# Usage: run from inside the entry directory:
#   ./render.sh
#
# The script picks the first Chromium it can find on this machine, so it
# works whether the browser is called chromium, google-chrome, or lives
# under /opt/meta-chromium. It exits non-zero if no browser is found or
# if the screenshot does not come out at 1024x1024.

set -eu

cd "$(dirname "$0")"

BROWSER=""
for candidate in chromium chromium-browser google-chrome google-chrome-stable \
  "$HOME/.cache/ms-playwright/chromium-1255/chrome-linux64/chrome" \
  "$HOME/.cache/ms-playwright/chromium_headless_shell-1255/chrome-headless-shell-linux64/chrome-headless-shell" \
  /opt/meta-chromium/chrome; do
  if command -v "$candidate" >/dev/null 2>&1; then
    BROWSER="$candidate"
    break
  fi
done

if [ -z "$BROWSER" ]; then
  echo "render.sh: no Chromium-based browser found (tried chromium, chromium-browser, google-chrome, google-chrome-stable, the Playwright Chromium cache, /opt/meta-chromium/chrome)" >&2
  exit 1
fi

"$BROWSER" \
  --headless \
  --disable-gpu \
  --no-sandbox \
  --hide-scrollbars \
  --window-size=1024,1024 \
  --screenshot="$PWD/entry.png" \
  "file://$PWD/frontpage.html"

# Verify the screenshot really is a 1024x1024 PNG: read the width and
# height straight out of the PNG IHDR chunk (bytes 16..24) and refuse
# to claim success if they are anything else.
python3 - "$PWD/entry.png" <<'PY'
import struct
import sys

path = sys.argv[1]
with open(path, "rb") as f:
    header = f.read(26)
if len(header) < 26 or header[:8] != b"\x89PNG\r\n\x1a\n":
    print(f"render.sh: {path} is not a PNG file", file=sys.stderr)
    sys.exit(1)
width, height = struct.unpack(">II", header[16:24])
if (width, height) != (1024, 1024):
    print(f"render.sh: expected 1024x1024, got {width}x{height}", file=sys.stderr)
    sys.exit(1)
print(f"render.sh: verified {path} is 1024x1024")
PY

echo "render.sh: wrote $PWD/entry.png with $BROWSER"
