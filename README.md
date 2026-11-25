# THE WORLD TODAY — Wednesday 25 November 2026

[![Competition](https://make.fun/badge/news-image-20261125.svg)](https://make.fun/bounty/news-image-20261125)
[![Rank](https://make.fun/badge/news-image-20261125/jehan771/news-image-20261125/rank.svg)](https://make.fun/bounty/news-image-20261125)
[![Reward](https://make.fun/badge/news-image-20261125/jehan771/news-image-20261125/reward.svg)](https://make.fun/bounty/news-image-20261125)

A one-page newspaper front page summing up the world's news of
**Wednesday 25 November 2026** — early edition, 36 stories across 7 regions.
The lead story is Ukraine striking Russian ships in two seas: President
Zelenskiy confirmed the drone strike on the cargo ship *Sparta II* in the
Gulf of Finland, and Ukraine sank the corvette *Merkury* in Benghazi
harbour, Libya. The page also covers the Houthi drone strike on a Riyadh
tower, Russian jets triggering an alert off South Korea, Dell's record
quarter on AI servers, and the day's politics, sport and markets.

Every story was verified against a credible source (Reuters, AP, BBC,
Al Jazeera, Euronews, RFE/RL, UN News, The Washington Post and others) on
25 November 2026, with a source line under every story. Stories are events
reported on 24–25 November 2026. Older events still in the news — the COP31
collapse of 22 November, the ICJ's Myanmar genocide ruling of 19 November
and the GTA 6 release of 19 November — are listed in the DATE CHECK box as
traps, not as stories.

All four visuals are drawn illustrations (inline SVG). No photograph is
used, because no photograph verifiably dated 24–25 November 2026 was
available; the page says so in its footer.

## Stories and sources

**Lead:** Ukraine strikes Russian ships in two seas — Reuters.
**Features:** Houthi drone hits Riyadh tower, 11 hurt — Reuters; Russian
jets spark alert off South Korea — AP / Yonhap; Dell smashes forecasts on
AI servers — Reuters.
**Grid (12):** Sarkozy case goes to trial — Reuters; NATO-style guarantees
for Kyiv — RFE/RL; Houthis 60 km from Aden — Reuters; Saudi budget sees
smaller deficit — Reuters; US envoy unsure Israel aid ends — Reuters;
Iran braces for gas shortages — RFE/RL; search after Cikande factory fire
— Euronews; India pledges €1.4bn to Nepal — Euronews; fighting traps
Ebola teams — UN News; Abiy offers Sudan peace talks — Ethiopian News
Agency; drones killed 1,600 in Sudan — Panapress; Trump gives Giuliani
top medal — The Washington Post.
**Also today (20):** Britain consults on age of consent — BBC; UK panel on
nuclear test legacy — BBC; US weighs tariffs on 16 partners — The Hindu
BusinessLine; Japan sets up Asian oil task force — Euronews; China and
Singapore expand yuan financing — Euronews; shortwave radio for Afghan
girls — RFE/RL; Ethiopia polio campaign, 11m children — Panapress; MSF
halts work in South Sudan — Panapress; CIA and ODNI cyber breach —
Reuters; Fort Hood gunman seeks stay — Reuters; Huawei convicted in US
trial — Reuters; Mexico to try 'El Chapo Isidro' — Al Jazeera; Colombia
police base drone attack — Al Jazeera; Brazil supercell storm —
Al Jazeera; England beat Australia, 2nd T20I — JagranJosh; Champions
League results — Flashscore; Trump spares Thanksgiving turkeys — Reuters;
Nvidia +31% then −5% — Investopedia; Nepal PM ends India visit —
JagranJosh; South Korea education minister quits — The Boston Report.

**Dropped as unverified:** an IRGC claim that three oil tankers were hit
by mines in the Strait of Hormuz (one-sided claim, no corroboration);
a "700,000 Russian soldiers killed" figure from an unattributed analysis;
Denmark "ghetto" evictions and a NATO Poland deployment (single
low-credibility sources); Venezuela debt and Bolsonaro/Maduro items
(partisan source only); a US PCE/GDP data item (single newsletter source).

## How to run

Requires Node 22 or later. The program only copies the finished image:

```sh
node main.ts
# writes /output/entry.png
```

`entry.png` is 1024×1024 PNG, 788,153 bytes (under the 1 MiB limit),
and byte-identical across runs (verified: two runs, same sha256).

## Files

- `main.ts` — the entrypoint: copies `entry.png` to `/output/entry.png`
  (Node 22, standard library only).
- `entry.png` — the finished front page.
- `frontpage.html` — the source of the render (kept for transparency; the
  program itself only copies `entry.png`).
- `render.sh`, `downscale.py` — the local render helpers: the HTML is
  screenshotted at 2048×2048, then downscaled to 1024×1024 with PIL
  Lanczos.
- `LICENSE` — MIT.

## About this repository

Entry for the make.fun bounty
[news-image-20261125](https://make.fun/bounty/news-image-20261125)
("Sum up 25 November's world news in one image"), by
[tomselliott](https://make.fun/) / GitHub
[jehan771](https://github.com/jehan771).
