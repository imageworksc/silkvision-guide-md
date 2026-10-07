# Motion, accessibility & QA

## Motion contract

| Allowed | Where |
| --- | --- |
| Hero load: h1 `resolve` (blur → sharp, 1s), children `rise` at .15/.3/.42/.54/.66s | `[data-seq]` in `.hero` |
| Scroll reveal: fade + 1.5rem rise, once; rows stagger 70ms | `[data-reveal]`, `.stagger` |
| Button lift 3px + arrow slide | `.btn:hover` |
| Nav underline grows from centre | `.nav a::after` |
| Reading progress, sticky header shadow | scroll state |
| Accordion height ease (560ms open / 440ms close) + chevron turn | `.faq details` |
| Stepper rule fill, stage number fill, carousel crossfade | state changes |

Not allowed: hover motion on non-links (cards, rows, list items), parallax,
counters that count up, looping decorative animation, animating layout
properties (width/height/top — except the accordion's measured height via
WAAPI), anything that isn't `transform`/`opacity`/`filter`.

**Reduced motion** (`motion.css`, last file): durations → .01ms, reveals
forced visible, and every hover that moves a *different* element than the
one hovered is named explicitly (e.g. `.btn:hover .ico--arrow`, `.play:hover
.play__disc`, `.ba:hover .ba__knob`). When you add such a hover, add it there.

## Accessibility floors

- [ ] No sentence under 16px; `--t-xs` only on labels.
- [ ] Every target ≥ 44×44px (inline links in prose exempt).
- [ ] Text contrast ≥ 4.5:1, graphics ≥ 3:1 — measured on real pixels
      (especially over photographs and on navy/plum).
- [ ] Line length 45–75ch.
- [ ] Skip link works; focus ring visible on every interactive element,
      white on dark grounds.
- [ ] One `h1`; h2 per section with `aria-labelledby`; no skipped levels.
- [ ] Menu: `aria-expanded` drives the icon + word; Escape closes and
      returns focus.
- [ ] Videos: loop video muted, has a pause button, pauses off screen and
      never autoplays under reduced motion; talking video waits for a click.
- [ ] Tabs are real tabs (arrow keys, roving tabindex); sliders are native
      range inputs with `aria-label` and `aria-valuetext`.
- [ ] `.sr-only` inside tables/scrollers has a `position: relative` ancestor.
- [ ] Duplicate link text goes to the same place or differs by `aria-label`.
- [ ] Page fully readable with JavaScript disabled (all panels/cases visible).

## Responsive sweep

Check at **320 · 360 · 390 · 430 · 640 · 768 · 960 · 1180 · 1440 · 1920 ·
2560 · 3840** px:

- [ ] Nothing past the right edge. `body { overflow-x: clip }` hides this
      from `scrollWidth`, so measure element rects against the viewport.
- [ ] Button labels on one line on phones (`lbl-short` swaps in).
- [ ] Comparison table stacks below 48rem with no horizontal scroll.
- [ ] Sticky call bar appears after the hero on phones and hides at the
      closing band; body gets bottom padding so it covers nothing.
- [ ] Long h2s break into two balanced lines; hero h1 in two lines.
- [ ] Past 1920 the page scales up as a whole (no new columns).
- Headless Chrome/Edge won't open a window narrower than ~492px — test
  narrow widths in an iframe or device emulation.

## Code review

- [ ] No `style=""`, no `<style>`, no raw hex/duration/px outside tokens
      (hairlines, ring, `--tap` excepted).
- [ ] No gradients (other than the flat `strong.hl` bar).
- [ ] No pill-shaped rectangles.
- [ ] CSS loaded in order, `motion.css` last; every link has a bumped `?v=`.
- [ ] Images have `width`/`height`, `alt`, `loading="lazy"` below the fold;
      hero preloaded.
- [ ] JSON-LD validates and the FAQ matches the page word for word.
- [ ] `noindex` present on staging; no analytics, pixels or tag managers.
- [ ] Booking URL, phone and addresses match SKILL.md exactly.
- [ ] Placeholders visible and listed in README → "Pending from the practice".
- [ ] HTML validates (no duplicate ids — tabs and labels use unique ids).
