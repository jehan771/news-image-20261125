// main.ts — entrypoint for news-image-20261125.
//
// The competition asks the program to write one image summing up the
// world's news of Wednesday 25 November 2026 to /output/entry.png.
// The image itself (entry.png, shipped in this repository next to this
// file) is the finished front page; this program's job is to deliver it
// byte-for-byte, deterministically, with no network and no clock.
//
// How it works:
//   1. Read entry.png from the same directory as this script.
//   2. Write those exact bytes to $MAKEFUN_OUTPUT_DIR/entry.png
//      (or /output/entry.png when the variable is unset).
//   3. Print the output path and the byte count, then exit 0.
//
// The run is fully deterministic: the same input bytes always produce
// the same output bytes, so the grader's two runs agree.

import { copyFileSync, mkdirSync, statSync } from "node:fs";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const here = dirname(fileURLToPath(import.meta.url));
const source = resolve(here, "entry.png");

const outDir = process.env.MAKEFUN_OUTPUT_DIR ?? "/output";
const target = join(outDir, "entry.png");

mkdirSync(outDir, { recursive: true });

// Fail loudly instead of silently producing a wrong file: the source
// image must exist, and the copy must carry every byte of it.
let sourceBytes: number;
try {
  sourceBytes = statSync(source).size;
} catch {
  console.error(`error: source image not found: ${source}`);
  process.exit(1);
}

copyFileSync(source, target);

const bytes = statSync(target).size;
if (bytes !== sourceBytes) {
  console.error(
    `error: copied ${bytes} bytes but source has ${sourceBytes} bytes`,
  );
  process.exit(1);
}
console.log(`Wrote ${target} (${bytes} bytes)`);
