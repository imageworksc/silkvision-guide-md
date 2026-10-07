---
name: silkvision-design
description: Design and build Silk Vision & Surgical Center procedure and landing pages (silkvision.net, Northern Virginia eye care) on the shared Silk Vision design system extracted from the shipped Ziplyft page. Use whenever the task is a new or redesigned Silk Vision web page, section, or component — LASIK, cataract, eyelid, dry eye, office-based surgery, any procedure page — or when reviewing one for brand, accessibility or code consistency. Supplies the tokens, typography, layout primitives, component markup, section patterns, page shell (header, footer, sticky CTA), copy rules, and a ready-to-copy starter kit.
---

# Silk Vision — page design & build guide

Every Silk Vision page is built on one design system. The reference
implementation is the **Ziplyft™ Eyelid Lift** page
(<https://imageworksc.github.io/silkvision-ziplyft/>, source
`imageworksc/silkvision-ziplyft`), which inherits the contract written for
the **Office-Based Surgery** page (`imageworksc/silkvision-seal-of-approval`,
`DESIGN.md` + `decisions/`). Where the two differ, **Ziplyft wins** — it is
the newest build.

> **Who reads these pages:** usually past sixty, recently told they are a
> candidate for eye surgery, and does not see well. That one fact decides
> more than any aesthetic preference: the 16px type floor, the 44px touch
> floor, measured contrast, and restraint on motion all come from it.

## How to use this skill

1. **Start from the starter kit.** Copy `assets/starter/` into the new
   project (or run `scripts/new-page.sh <target-dir>`). It already contains
   the shared CSS, JS, fonts, logos, favicons and a page shell with the
   shared header, footer and sticky call bar.
2. **Read the reference you need** before writing that part:
   | Task | Read |
   | --- | --- |
   | Colours, type scale, spacing, radius, shadows, motion values | [references/tokens.md](references/tokens.md) |
   | Section patterns and component markup (copy-ready HTML) | [references/components.md](references/components.md) |
   | Page anatomy, `<head>`, schema, header/footer, section order, links & NAP | [references/page-blueprint.md](references/page-blueprint.md) |
   | Headlines, copy voice, medical claims, CTAs | [references/content-voice.md](references/content-voice.md) |
   | Motion, accessibility floors, QA sweep before shipping | [references/qa-checklist.md](references/qa-checklist.md) |
3. **Never invent a value.** If a colour, size, radius, duration or font is
   not a token, it does not go on the page. Add a new token to
   `css/tokens.css` only when nothing on the ladder fits, and say why in a
   comment.
4. **Finish with the QA checklist.** A page is not done because it renders.

## The non-negotiable rules

These are settled decisions. Do not "improve" them without the client's
agreement — each one was measured or argued in a decision record.

### Look

- **No gradients. Ever.** Every surface is a flat fill from the `--fill-*`
  tokens. No aurora, no sheen, no glow, no glassmorphism. The only
  `linear-gradient()` allowed is the flat, single-colour highlighter bar on
  `strong.hl` (same colour at both ends = a sized block, not a ramp).
- **Two colours carry the brand.** Brand blue `--blue-500 #005894` for
  headings; plum `--plum-500 #800080` for actions (buttons, ticks, the
  "our procedure" column). On white, plum text/glyphs use `--plum-600
  #6a006a`. On navy, plum disappears (1.35:1) — use white or `--cyan-300`
  / `--sky-muted` there.
- **Grounds:** white `.band`, `.band--paper` (#f5f8fb), `.band--tint`
  (`--pale-100`), `.band--deep` (navy `--ink-700`), `.band--plum`
  (`--plum-700`, slim bands only, one warning/caveat per page). Alternate
  them; never stack two of the same ground.
- **Radius ladder:** `--r-sm 6px` (focus ring, tags), `--r-md 10px`
  (buttons, wells), `--r-lg 14px` (cards, frames, sliders). `--r-pill` is
  **for circles only** — a rectangle never takes it. Buttons are never pills.
- **Restraint over decoration.** Prefer type and hairlines to boxes. No
  eyebrow label above every heading, no cards that are not links, no icon in
  a well when a bare icon or plain text does the job. Every object in a
  section must *be* the content of that section (a list, a timeline, a
  comparison), never ornament.

### Type

- **Poppins** (embedded base64 in `css/fonts.css`) for titles and controls:
  h1–h4, buttons, nav, FAQ questions, table heads, labels, kickers, stat
  figures.
- **Inter** (self-hosted `fonts/inter-latin.woff2`) for everything read:
  paragraphs, list items, table cells, captions, values.
- **One body setting** inside `#main`: `--t-copy` (17→19px), line-height
  1.65, tracking −0.01em. Do not size paragraphs individually.
- **Three weights by role:** big titles Poppins 700 · small titles and
  controls Poppins 600 · reading text Inter 400, highlights Inter 600.
- **16px floor** for anything that is a sentence. `--t-xs` (13–14px) is for
  labels only. The footer alone runs a smaller reference scale.
- Measure 45–75 characters (`--measure: 62ch`). Headings use
  `text-wrap: balance`; paragraphs `text-wrap: pretty`.
- **One highlighted phrase per paragraph at most**, with
  `<strong class="hl">` — the claim the paragraph exists to make.

### Layout

- `.wrap` caps at `--shell` (78rem) with `--gutter` padding. `.band` adds
  `--band-y` vertical padding; `.band--slim` halves it for bands that back
  up a claim rather than make one.
- Primitives: `.stack` (column, gap), `.stack--loose`, `.stack--center`,
  `.cluster` (wrapping row), `.split` (2 columns from 60rem), `.split--middle`,
  `.split--wide-gutter`, `.full`.
- Breakpoints: **34rem** facts gain rules · **47.99rem** phone/tablet line
  (tables stack, sticky bar appears, button labels shorten) · **48rem**
  rows go horizontal · **60rem** splits go two-column · **62rem** nav
  collapses below it · **64rem / 80rem** wide rows · **120rem+** the whole
  page scales via the root font size (no new columns on 4K).
- Section h2s are capped at 60% of content width from 48rem so long titles
  break into two balanced lines.

### Code

- Plain static HTML + CSS + vanilla JS, deployed on GitHub Pages. No
  framework, no build step, no CSS framework, no icon library, no jQuery.
- **No CSS in the HTML** — no `style=""`, no `<style>`. Stagger indexes ride
  in attributes (`data-seq="2"`), not inline custom properties.
- CSS file order is fixed: `fonts → tokens → base → components → sections
  → type → motion`. `motion.css` is last so reduced-motion can switch
  everything off in one place.
- JS: one `js/main.js`, `defer`, ES2015+ (`const`/`let`, arrows), each
  feature a `setupX()` that returns early if its element is missing.
  **Everything is an enhancement** — with JS off, the page is complete and
  nothing is hidden (`data-anim="on"` is set on `<html>` by script before
  anything is hidden).
- Logical properties (`inline-size`, `margin-block-start`, `inset-inline`).
- Nothing downstream carries a raw hex, raw duration or magic pixel number;
  only hairlines (1px), focus ring (3px) and `--tap` (44px) stay in px.
- **Bump `?v=N` on every CSS/JS link** on each deploy that touches them
  (GitHub Pages caches for 10 minutes).
- Comment the *why*, in full sentences, the way the starter files do.
- Images: Cloudinary (`res.cloudinary.com/dsjbq35es`, `f_auto,q_auto,w_…`),
  always with `width`/`height`, `loading="lazy"` below the fold, real `alt`.
  Preload the hero image with `fetchpriority="high"`.
- Staging copies carry `<meta name="robots" content="noindex, nofollow">`
  and **no analytics/pixels/tag managers** — a staging page must not report
  to production accounts.

### Motion

- **Motion serves meaning.** Every animation maps to an interaction, a state
  change or the page's one authored idea. A hover that moves a non-link
  promises a click that is not there.
- The one authored idea: the **hero h1 resolves from blur** ("coming into
  focus" is what eye care does); the items under it rise in sequence.
- Sections fade/rise in once on scroll (`data-reveal`, `.stagger`).
- Animate only `transform`, `opacity`, `filter`. Easing from tokens only.
- **Reduced motion is a contract:** every hover that moves *another*
  element must be named in the reduced-motion block of `motion.css`.

### Accessibility floors

16px sentences · 44px targets (`--tap`) · 4.5:1 text / 3:1 graphics,
measured · visible focus ring (3px `--cyan-400`, white on dark grounds) ·
skip link · real `<button>`s and native controls (`<details>`,
`<input type="range">`, tabs with roving tabindex) · Escape closes the menu
and returns focus · looping video has a pause button and never autoplays
under reduced motion; talking video waits for a click · `position:
relative` on any container holding `.sr-only` inside a table/scroller ·
two links with the same text go to the same place (or differ by
`aria-label`).

## Page skeleton at a glance

```
skip link · progress hairline · icon sheet
topbar (desktop) · sticky header (logo, 4 links, "Book a consultation")
<main id="main">
  hero            photo + flat navy scrim · h1 · lead · intro · 2 buttons
  what is it      facts bar (3 facts + service area) · copy + one object
  …the procedure's sections (see components.md for the catalogue)…
  faq             sticky heading column + <details name="faq"> list
  closing call    band--deep band--slim · question · one line · 2 buttons
</main>
footer (offices, hours, phone, disclaimer, credits)
sticky call bar (phones, after the hero, hidden at the closing band)
```

Full section order with the Ziplyft example in
[references/page-blueprint.md](references/page-blueprint.md).

## Shared facts (use exactly)

- Practice: **Silk Vision & Surgical Center** · surgeon **Wesam Silk, M.D.**
  (board-certified ophthalmologist, fellowship-trained cornea specialist;
  26,000+ eye surgeries; 20+ years serving Northern Virginia)
- Phone: **(703) 876-9700** → `tel:+17038769700` (non-breaking space
  between area code and number: `(703)&nbsp;876-9700`)
- Book: `https://www.mypatientvisit.com/onlinescheduling/#/scheduler/schedule?practiceid=b46123f5-99ee-4f66-969c-fe650949c344`
- Annandale office: 3301 Woodburn Rd, Suite 308, Annandale, VA 22003
- Manassas office: 8405 Dorsey Circle, Suite 101, Manassas, VA 20110
- LASIK center: 3301 Woodburn Rd, Suite 210, Annandale, VA 22003
- Hours: Monday – Friday, 8:30am – 4:30pm
- Credit line: "Web design by ImageWorks Creative"

If the brief contradicts any of these, ask before changing them.

## When something is missing

Never ship a blank or invented fact. Leave a **visible** placeholder
(e.g. `.price-slot` — dashed box with the bracketed request) plus an HTML
comment `<!-- [PENDING: …] -->`, and list it under "Pending from the
practice" in the project README.
