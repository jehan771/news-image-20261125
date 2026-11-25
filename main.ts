import { copyFileSync, mkdirSync, statSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

// This program ships one finished front page, entry.png, beside it.
// It copies that file to /output/entry.png. No network, no clock,
// no randomness: the output bytes are exactly the shipped bytes.
const here = dirname(fileURLToPath(import.meta.url));
const source = join(here, "entry.png");
const target = join("/output", "entry.png");

mkdirSync("/output", { recursive: true });
copyFileSync(source, target);

const size = statSync(target).size;
const limit = 1024 * 1024;
if (size > limit) {
  throw new Error(`entry.png is ${size} bytes, over the ${limit} byte limit`);
}
console.log(`wrote ${target} (${size} bytes)`);
