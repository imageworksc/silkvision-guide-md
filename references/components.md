# Components & section patterns

All markup below is taken from the shipped Ziplyft page and is styled by the
starter CSS as-is. `{{…}}` marks content to replace. `BOOK` = the booking URL
(see page-blueprint.md).

Pick a pattern because the content **is** that shape (a sequence → stepper
or stages; two options → fork or compare; yes/no → yesno). Never pick it for
decoration.

---

## Primitives

### Buttons

```html
<a class="btn btn--solid" href="BOOK">Book a consultation
  <svg class="ico ico--arrow" aria-hidden="true"><use href="#i-arrow"/></svg></a>
<a class="btn btn--ghost" href="#candidate">See if you’re a candidate
  <svg class="ico ico--arrow" aria-hidden="true"><use href="#i-arrow"/></svg></a>
<a class="btn btn--ghost btn--lg" href="tel:+17038769700">
  <svg class="ico" aria-hidden="true"><use href="#i-phone"/></svg>(703)&nbsp;876-9700</a>
```

- `.btn--solid` flat plum · `.btn--ghost` hairline border (white on dark
  grounds automatically) · `.btn--invert` white with plum label (plum band
  only) · `.btn--lg` 64px tall for hero/closing.
- Min height 56px, radius `--r-md`, hover lifts 3px, the arrow slides.
- Every CTA that moves forward ends with `#i-arrow`; phone buttons lead
  with `#i-phone`.
- Labels must fit one line on a 320px phone. If too long, provide both:
  `<span class="lbl-full">Schedule your Ziplyft consultation</span><span class="lbl-short">Schedule a consultation</span>`

### Icons

```html
<svg class="ico" aria-hidden="true"><use href="#i-check"/></svg>
<svg class="ico bare" aria-hidden="true"><use href="#i-eye"/></svg>      <!-- 36px, plum-600 / cyan on navy -->
<svg class="ico bare bare--lg" aria-hidden="true"><use href="#i-lid"/></svg>
```

The starter sheet holds the shared set (arrow, menu, close, check, chevron,
phone, pause, play, drag, eye, drops, home, calendar, shield, office, time).
`#i-lid`, `#i-compress`, `#i-remove`, `#i-seal` used in examples below are
Ziplyft's own — draw the equivalent for each new procedure.

New symbols: draw them on a 24×24 grid, 1.8 stroke, round caps/joins,
`currentColor`, no fill. Anything showing an eye carries the signature
rings `<circle r="3.4"/><circle r="1"/>` at the iris. Never redraw a third-
party logo — brand marks use `.ico--brand` (filled, as issued). Icons are
decorative (`aria-hidden`); the adjacent text carries the meaning.

### Highlight, kicker, fine print

```html
<p>… <strong class="hl">the one claim this paragraph makes</strong> …</p>
<span class="kicker">Your surgeon</span>          <!-- tracked uppercase label over a row -->
<p class="fine">Individual results and recovery times vary.</p>
```

### Section head

```html
<div class="stack head" data-reveal>
  <h2 id="x-title">{{Question the section answers}}</h2>
  <h3 class="subhead">{{Optional qualifier}}</h3>
  <p class="lead lead--wide">{{One-sentence answer}}</p>
</div>
```

### Prose

```html
<div class="prose">
  <p class="first">{{Lead paragraph, set at --t-lead}}</p>
  <p>{{Body}}</p>
</div>
```

---

## Section patterns

### Hero

Photo as CSS background (set in `sections.css`), flat `--fill-scrim`, copy
on top. h1 = `{Procedure} in Northern Virginia`, two lines max. Children
carry `data-seq="0…4"` for the load sequence (h1 resolves from blur, the
rest rise). See `assets/starter/index.html`.

### Facts bar (opens the first band after the hero)

```html
<section class="band band--open" aria-labelledby="what-title">
  <div class="wrap stack stack--loose">
    <div class="facts-bar full" data-reveal>
      <dl class="hero-facts">
        <div><dt>Procedure</dt><dd>Under 15 minutes</dd></div>
        <div><dt>Anesthetic</dt><dd>Local only</dd></div>
        <div><dt>Closure</dt><dd>No sutures</dd></div>
      </dl>
      <p class="facts-bar__area">Available through Silk Vision for patients in Annandale,
        Manassas and throughout Northern Virginia and the Washington, DC area.</p>
    </div>
    <div class="split split--middle split--wide-gutter full"> … </div>
  </div>
</section>
```

### Split: copy + one object

```html
<div class="wrap split split--middle">
  <div class="stack" data-reveal> {{head + prose + optional ghost button}} </div>
  <figure class="frame frame--photo" data-reveal>
    <img src="…w_1100…" width="1100" height="825" loading="lazy" alt="{{…}}">
  </figure>
</div>
```

Frames: `.frame--wide` 16:9 · `.frame--photo` 4:3 · `.frame--portrait` 4:5.

### Diagram (one explanatory line drawing)

`figure.diagram` > `svg.diagram__art[role=img]` with `<title>` + `figcaption`
> `ol.diagram__key` (numbered `.diagram__num` badges). Strokes come from
token classes (`.d-mark` plum dashed = what is removed/treated, navy for
anatomy). Labels are HTML under the art, not SVG text, so they keep 16px.

### Loop video with pause (silent, autoplays only when on screen)

```html
<div class="frame frame--wide" data-reveal>
  <video id="mechVideo" playsinline muted loop preload="metadata" poster="…" src="…mp4"
         aria-label="{{What the animation shows}}"></video>
  <button class="vid-btn" type="button" id="mechToggle" data-state="paused" aria-label="Play video">
    <svg class="ico ico--pause" aria-hidden="true"><use href="#i-pause"/></svg>
    <svg class="ico ico--play ico--brand" aria-hidden="true"><use href="#i-play"/></svg>
    <span class="vid-btn__label">Play</span>
  </button>
</div>
```

### Talking video (waits for a click, plays with sound)

```html
<div class="frame frame--portrait">
  <video id="silkVideo" playsinline preload="none" poster="…" src="…" aria-label="Dr. Silk explains {{…}}"></video>
  <button class="play" type="button" id="silkPlay">
    <span class="play__disc"><svg class="ico ico--brand" aria-hidden="true"><use href="#i-play"/></svg></span>
    Watch Dr.&nbsp;Silk explain it
  </button>
</div>
```

Pair it with `.facts` in a `.video-split` (video column 26rem, copy the rest):

```html
<dl class="facts">
  <div><dt>Typical procedure time</dt><dd>Less than 15 minutes</dd></div>
  …
</dl>
```

### Three steps (under a "how it works" band)

```html
<ol class="steps3 stagger">
  <li class="feature" data-reveal>
    <svg class="ico steps3__ico" aria-hidden="true"><use href="#i-compress"/></svg>
    <div><h3>Compress</h3><p>{{One sentence}}</p></div>
  </li> …×3
</ol>
```

Numbers are added by CSS counter.

### Yes / No (benefits vs. what it leaves out) — `band--tint`

```html
<div class="yesno full" data-reveal>
  <div class="yesno__col yesno__col--yes">
    <h3 id="does-title">What {{X}} does</h3>
    <ul aria-labelledby="does-title">
      <li><span class="tick"><svg class="ico" aria-hidden="true"><use href="#i-check"/></svg></span>{{Benefit}}</li>
    </ul>
  </div>
  <div class="yesno__col yesno__col--no">
    <h3 id="leaves-title">What it leaves out</h3>
    <ul aria-labelledby="leaves-title">
      <li><span class="tick tick--no"><svg class="ico" aria-hidden="true"><use href="#i-close"/></svg></span>No {{thing}}</li>
    </ul>
  </div>
</div>
```

Plum = our procedure; navy = the other side. Columns close on the same line.

### Comparison table — `#compare`

```html
<div class="compare-wrap full" data-reveal>
  <table class="compare">
    <caption class="sr-only">{{X}} compared with {{Y}}.</caption>
    <thead><tr>
      <th scope="col"><span class="sr-only">Compare</span></th>
      <th scope="col">{{X}}</th>
      <th scope="col">{{Y}}</th>
    </tr></thead>
    <tbody>
      <tr><th scope="row">{{Feature}}</th>
        <td><span class="tick"><svg class="ico" aria-hidden="true"><use href="#i-check"/></svg></span><span class="sr-only">Yes</span></td>
        <td>{{Value}}</td></tr>
    </tbody>
    <tbody> {{next group of rows}} </tbody>
  </table>
</div>
```

Section needs `id="compare"` for the simplified style. Below 48rem each row
stacks (feature on top, two values side by side) — no horizontal scroll.
Group rows in several `<tbody>`s. `.compare-wrap` must stay
`position: relative` (contains `.sr-only`).

### Fork — "Which option is right for you?"

```html
<div class="fork full" data-reveal>
  <div class="fork__path"><h3>Often a {{X}} candidate</h3><p>{{…}}</p></div>
  <div class="fork__path fork__path--alt"><h3>May need another approach</h3><p>{{…}}</p></div>
</div>
<div class="fork__verdict full" data-reveal>
  <div class="fork__say"><h3>Don’t choose the procedure first.</h3></div>
  <a class="btn btn--solid" href="BOOK">Compare your options <svg class="ico ico--arrow" aria-hidden="true"><use href="#i-arrow"/></svg></a>
</div>
```

### Before & after carousel — `#results`

Each slide is a `.ba` slider: two stacked images, the after clipped by
`--pos`, an invisible native `<input type="range">` on top as the real
control, Before/After tags, a handle with `#i-drag` knob. Dots change case
(crossfade). Without JS all cases stack. Copy the block from the Ziplyft
`index.html` (`#cases`) and keep: `role="region" aria-roledescription=
"carousel"`, per-slide `aria-label="Case 01, 1 of 4"`, per-range
`aria-label`, first slide eager, the rest `loading="lazy"`. Always add
`<p class="fine">Drag the handle to compare… Individual results and recovery times vary.</p>`.

### Physician profile — `band--deep`

```html
<div class="profile full" data-reveal>
  <img class="profile__photo" src="images/dr-silk-400.jpg"
       srcset="images/dr-silk-200.jpg 200w, images/dr-silk-400.jpg 400w" sizes="10rem"
       width="400" height="400" loading="lazy" alt="Wesam Silk, M.D.">
  <div class="profile__who">
    <span class="kicker">Your surgeon</span>
    <h3>Wesam Silk, M.D.</h3>
    <p>Board-certified ophthalmologist<br>Fellowship-trained cornea specialist</p>
  </div>
  <dl class="profile__stats">
    <div><dd>26,000+</dd><dt>eye surgeries performed</dt></div>
    <div><dd>20+ years</dd><dt>serving Northern Virginia</dt></div>
  </dl>
</div>
```

Follow with a `p.measure` of reasoning and a ghost "Meet Dr. Silk" button.

### Stepper — "What happens during the procedure" (`band--deep band--slim`)

Real tabs: `role="tablist"` with `button[role=tab]` (`aria-controls`,
`aria-selected`, roving `tabindex="-1"`), one `role="tabpanel"` per step,
container `id="stepper"`. Arrow/Home/End keys move; hover lights a step on
hover devices. Without JS all panels show. 3–6 steps; titles short enough
to sit on one line at 80rem.

```html
<div class="stepper full" id="stepper" data-reveal>
  <div class="stepper__tabs" role="tablist" aria-label="The steps of a {{X}} procedure">
    <button class="stepper__tab" type="button" role="tab" id="st-1" aria-controls="sp-1" aria-selected="true">
      <span class="stepper__num">1</span><span class="stepper__title">{{Step}}</span></button>
    <button class="stepper__tab" type="button" role="tab" id="st-2" aria-controls="sp-2" aria-selected="false" tabindex="-1">…</button>
  </div>
  <div class="stepper__panel" role="tabpanel" id="sp-1" aria-labelledby="st-1"><p>{{…}}</p></div>
  <div class="stepper__panel" role="tabpanel" id="sp-2" aria-labelledby="st-2"><p>{{…}}</p></div>
</div>
```

### Stages — recovery timeline (`band--slim`)

```html
<ol class="stages full" data-reveal>
  <li tabindex="0">
    <span class="stages__num" aria-hidden="true">1</span>
    <div><h3>Treatment day</h3><p>{{…}}</p></div>
  </li> …×4
</ol>
```

Four stages on one rule from 64rem; vertical list below. Static content —
no scroll animation.

### Candidate list — `band--paper`

```html
<div class="fit full" data-reveal>
  <h3 class="fit__lead">You may want to explore {{X}} if you:</h3>
  <ul class="fit__list">
    <li><svg class="ico fit__tick" aria-hidden="true"><use href="#i-check"/></svg><span>{{Reason}}</span></li>
  </ul>
</div>
```

Two columns read downward from 48rem (CSS assumes 7–8 items in 4 rows; adjust
`grid-template-rows` and the `nth-child` rules if the count changes).

### Caveat banner — `band--slim band--plum` (once per page)

```html
<div class="banner full" data-reveal>
  <svg class="ico bare bare--lg" aria-hidden="true"><use href="#i-lid"/></svg>
  <div class="stack banner__text">
    <h3 id="same-title">Not every {{condition}} is the same.</h3>
    <p>{{…}} That’s why <strong class="hl">the first step should be an examination</strong> — not choosing a procedure online.</p>
  </div>
  <a class="btn btn--solid btn--invert" href="BOOK">…</a>
</div>
```

### Cost — `band--paper band--slim`

`.price-row` (price or the dashed `.price-slot` placeholder + solid CTA),
then a `.faq` of `<details name="cost">` for "What it depends on", "What
your consultation gives you", "Is it covered by insurance?".

### Over time — three statements (`band--deep band--slim`)

```html
<ul class="over-time full stagger">
  <li data-reveal><div><span class="kicker">The skin removed</span><h3>Does not grow back.</h3></div></li> …×3
</ul>
```

### FAQ

```html
<div class="wrap split faq-split">
  <div class="stack faq-head" data-reveal> {{h2, lead, ghost call button}} </div>
  <div class="faq" data-reveal>
    <details name="faq">
      <summary>{{Question?}}<svg class="ico" aria-hidden="true"><use href="#i-chevron"/></svg></summary>
      <p>{{Answer}}</p>
    </details>
  </div>
</div>
```

`name="faq"` keeps one open at a time; JS animates height. The heading
column is sticky from 60rem. Mirror every Q&A into the `FAQPage` JSON-LD.

### Closing call — `band--deep band--slim closing`, `id="contact"`

Centred `.stack--center`: h2 question, one `.lead` ending on a highlighted
"Let Dr. Silk take a look.", `.cluster` with solid + ghost `--lg` buttons.
Nothing else.

---

## JS hooks (already in `main.js`)

| Feature | Needs |
| --- | --- |
| Menu | `.nav-toggle`, `#nav` |
| Progress + sticky shadow | `#progress`, `#siteHeader` |
| Reveals | `[data-reveal]` (+ `.stagger` parent) |
| Before/after | `.ba` > `.ba__range`; carousel `#cases` |
| Loop video | `#mechVideo` + `#mechToggle` |
| Talking video | `#silkVideo` + `#silkPlay` |
| Sticky CTA | `#stickyCta`, `.hero`, `#contact` |
| Stepper | `#stepper` |
| Accordions | `.faq > details` |

Each setup is null-safe, so unused hooks cost nothing. For a second
instance (e.g. two loop videos), generalise the setup to
`querySelectorAll` rather than duplicating it.
