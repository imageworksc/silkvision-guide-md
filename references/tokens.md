# Design tokens

Source of truth: `assets/starter/css/tokens.css` (+ the `:root` blocks in
`type.css` and `sections.css`). Every value on a page comes from here.

## Colour

### Blues — Silk Vision's own, extended into a ramp

| Token | Hex | Use |
| --- | --- | --- |
| `--ink-900` | `#001325` | topbar, footer, sticky "Call now", `theme-color` |
| `--ink-800` | `#012a47` | hero fallback, frame/video background |
| `--ink-700` | `#013559` | **dark bands** (`--fill-deep`), highlighted text colour on white, diagram lines |
| `--ink-600` | `#00497b` | the "other option" column (navy ticks, "What it leaves out") |
| `--blue-500` | `#005894` | **THE brand blue** — `--heading` on light grounds, links |
| `--blue-400` | `#1e7fbe` | ghost-button hover border |
| `--cyan-400` | `#35a7e0` | focus ring |
| `--cyan-300` | `#6cc5f0` | accents on navy (kicker, bare icons, topbar hover) |
| `--pale-200` | `#ccdeea` | lead text on navy / hero |
| `--pale-100` | `#e7eef4` | `.band--tint`, hover tints, iris fill |
| `--sky-muted` | `#93b6cf` | desaturated accent on navy (stepper rule, kicker) ≈ 7:1 |

### Plum — the action colour

| Token | Hex | Use |
| --- | --- | --- |
| `--plum-700` | `#5c005c` | `.band--plum`, inverted button label |
| `--plum-600` | `#6a006a` | **plum on white** (11.5:1): glyphs, ticks, kickers, FAQ chevron, `.fit__lead` |
| `--plum-500` | `#800080` | brand value: `--fill-action` (solid buttons, tick discs), `--fill-accent` (nav underline, progress bar) |
| `--plum-400` | `#a626a6` | `::selection`, tint base (`rgb(166 38 166 / .04–.13)`) |
| `--plum-100` | `#f5e4f5` | text/marks on plum band, invert-button hover, diagram mark fill |

### Neutrals

`--white #fff` · `--paper #f5f8fb` · `--grey-100 #e8eef4` · `--grey-300
#c3ced8` (dashed placeholder border, diagram brow) · `--grey-500 #5f7276`
(`--text-faint`) · `--grey-700 #45575b` (`--text-soft`) · `--grey-900
#2a3538` (`--text`).

### Semantic tokens (re-point per ground)

| Token | Light ground | Dark ground (`.band--deep`, `.hero`, `.band--plum`) |
| --- | --- | --- |
| `--text` | grey-900 | 80% white |
| `--text-soft` | grey-700 | 62% white (plum: 80%) |
| `--heading` | blue-500 | white |
| `--hairline` | `rgb(1 53 89 / .12)` | `rgb(255 255 255 / .16)` |

**The dark-ground contract:** a new dark container joins the selector list
in `base.css` (`.band--deep, .hero`) rather than restating colours. On navy,
paragraphs step up to `--on-dark-soft` and leads to `--pale-200` (62% white
is too faint for a reader past sixty).

### Fills — flat, never ramped

| Token | Value | Use |
| --- | --- | --- |
| `--fill-action` | plum-500 | buttons, ticks |
| `--fill-deep` | ink-700 | dark bands |
| `--fill-accent` | plum-500 | nav underline, reading progress |
| `--fill-scrim` | `rgb(1 34 58 / .78)` | over the hero photo; white type stays ≥ 8.1:1 over the brightest pixel |

### Highlighter

`--hl-mark: rgb(220 180 220 / .62)` (light grounds) ·
`--hl-mark-dark: rgb(200 140 200 / .5)` (dark grounds). Text under it is
`--ink-700` (not blue — blue + underline reads as a link), white on dark.

## Type

```css
--font:      'Poppins', system-ui, …;   /* titles & controls */
--font-body: 'Inter',   system-ui, …;   /* everything read   */
```

| Token | Range | For |
| --- | --- | --- |
| `--t-xs` | 13 → 14px | labels only (fact labels, tags, kickers) — never a sentence |
| `--t-sm` | 16 → 17px | buttons, nav, small UI |
| `--t-body` | 17 → 19px | body (= `--t-copy`) |
| `--t-lead` | 17 → 21px | section leads, `.prose .first`, `.subhead` |
| `--t-h3` | 21 → 26px | card/row titles, stat figures |
| `--t-h2` | 26 → 42px | section titles |
| `--t-h1` | 32 → 62px | (hero overrides to 26 → 44px, weight 700) |

Line-heights: `--lh-tight 1.06` (h1) · `--lh-head 1.16` · `--lh-body 1.62` ·
`--lh-copy 1.65` (Inter body). Tracking: `--ls-tight -.03em` (headings) ·
`--ls-copy -.01em` (Inter) · `--ls-wide .14em` (uppercase labels).

## Space

`--s-1 .25rem` · `--s-2 .5rem` · `--s-3 .75rem` · `--s-4 1rem` · `--s-5
1.5rem` · `--s-6 2rem` · `--s-7 2.5rem` · `--s-8 3rem` · `--s-9 4rem` ·
`--s-10 5rem` · `--s-11 7rem`

`--gutter: clamp(1.25rem, 4vw, 2.75rem)` · `--band-y: clamp(3.5rem, 8vw,
7rem)` · slim band `clamp(2.5rem, 5vw, 4rem)` · `--shell: 78rem` ·
`--measure: 62ch` · `--tap: 44px` (never scales).

## Radius

`--r-sm .375rem` (6px) · `--r-md .625rem` (10px) · `--r-lg .875rem` (14px) ·
`--r-pill 999px` (circles only).

## Depth

All shadows are navy-tinted, two layers (tight edge + soft air):

```css
--shadow-sm:   0 1px 2px rgb(1 53 89 / .06), 0 2px 8px rgb(1 53 89 / .06);
--shadow-md:   0 2px 6px rgb(1 53 89 / .07), 0 12px 28px rgb(1 53 89 / .1);
--shadow-lg:   0 6px 16px rgb(1 53 89 / .1), 0 28px 60px rgb(1 53 89 / .17);
--shadow-well: 0 1px 2px rgb(0 0 0 / .05), 0 2px 5px rgb(0 0 0 / .07);
```

Frames and cards use `--shadow-md`; on dark bands they drop the shadow for a
`--hairline-dark` border.

## Motion

```css
--ease:        cubic-bezier(.22, .9, .3, 1);   /* default */
--ease-spring: cubic-bezier(.34, 1.4, .5, 1);  /* arrows, knobs, play disc */
--ease-soft:   cubic-bezier(.37, 0, .63, 1);   /* crossfades, ambient */
--t-fast: .2s;  --t-mid: .38s;  --t-slow: .7s;
```

No curve is a browser keyword (`ease-in-out` etc.).
