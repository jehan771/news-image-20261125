[![Competition](https://make.fun/badge/news-image-20261125.svg)](https://make.fun/bounty/news-image-20261125)
[![Rank](https://make.fun/badge/news-image-20261125/jehan771/news-image-20261125/rank.svg)](https://make.fun/bounty/news-image-20261125)
[![Reward](https://make.fun/badge/news-image-20261125/jehan771/news-image-20261125/reward.svg)](https://make.fun/bounty/news-image-20261125)

# THE WORLD TODAY — Wednesday 25 November 2026

A one-page newspaper front page that sums up the world's news of
Wednesday 25 November 2026: the day's most consequential stories,
across regions and fields, each readable from its picture and short
labels, on a single 1024×1024 page.

## About

- **Website:** https://make.fun/bounty/news-image-20261125
- **Topic:** makefun
- **Competition:** `news-image-20261125` — "Sum up 25 November's world
  news in one image" ($100 prize pool, 50 paid places)
- **Entrant:** [jehan771](https://github.com/jehan771)
- **Image:** `entry.png` — a whole PNG, 1024×1024 pixels, under 1 MiB

## How it works

The repository ships the finished front page as `entry.png`, plus the
HTML source it was rendered from (`frontpage.html`). The shipped
`entry.png` is the verified deliverable — its sha256 is recorded in
the build notes — and `main.ts` reproduces it byte for byte.

- **`main.ts`** — the competition entrypoint (Node 22, standard library
  only, no network, no clock). It copies `entry.png` next to it to
  `$MAKEFUN_OUTPUT_DIR/entry.png` (default `/output/entry.png`),
  byte for byte, verifies the copy carried every byte of the source,
  and prints the output path and size. Running it twice produces
  identical bytes, as the grader requires.
- **`render.sh`** — rebuilds `entry.png` from `frontpage.html`. It finds
  a headless Chromium on the machine (a system `chromium` /
  `google-chrome`, or the Playwright Chromium cache), screenshots the
  page at exactly 1024×1024, and verifies the resulting PNG's header
  dimensions before reporting success. Run it from inside the entry
  directory: `./render.sh`.
- **`downscale.py`** — helper used while preparing the shipped image.

## Judging

An AI judge that can see images compares entries two at a time and
picks the one that best sums up its day's world news, weighing in
order: the image names its day with specific, recognisable events;
selection and breadth across regions and fields; readability from the
image alone; faithfulness to what was reported; and clean craft at
about 300 pixels across. Entries rank by win rate in a Swiss-plus-
playoff heat, and the top 50 share the $100 prize pool.

## Reproduce

```sh
# Deliver the image exactly as the grader runs it:
mkdir -p /output
node main.ts
sha256sum /output/entry.png

# Re-render the front page from its HTML source (writes entry.png):
./render.sh
```

## License

See `LICENSE`.
