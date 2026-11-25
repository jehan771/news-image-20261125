#!/usr/bin/env python3
"""Downscale the 2048x2048 render to the 1024x1024 entry image (PIL Lanczos)."""
import sys
from PIL import Image

src, dst = sys.argv[1], sys.argv[2]
img = Image.open(src).convert("RGB")
if img.size != (2048, 2048):
    raise SystemExit(f"expected 2048x2048 render, got {img.size}")
img.resize((1024, 1024), Image.LANCZOS).save(dst, "PNG", optimize=True)
print(f"wrote {dst}")
