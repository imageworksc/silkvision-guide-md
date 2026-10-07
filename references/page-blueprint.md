# Page blueprint

## Project layout

```
index.html
css/fonts.css        Poppins, base64 — shared, do not edit
css/tokens.css       every value, named once — shared
css/base.css         reset, primitives, dark-ground contract — shared
css/components.css   shared components (+ this page's set at the end)
css/sections.css     this page's layouts; hero, closing, footer shared
css/type.css         Poppins/Inter split, one body setting, weights
css/motion.css       keyframes, reveals, reduced-motion contract — last
js/main.js           menu, scroll, reveals, slider, videos, sticky bar, tabs, accordions
fonts/               inter-latin.woff2 + OFL licences
images/              logo.png, logo-white.png, local photos
favicon-*.png, apple-touch-icon.png, .nojekyll
README.md            structure, what changed, "Pending from the practice"
```

When a page needs a new component, add it **at the end** of
`components.css` under a banner (`/* ===== The <Page> set ===== */`) that
reads off existing tokens only, and add its reduced-motion entries at the
end of `motion.css`.

## `<head>` checklist

1. `<title>`: `{Procedure} in Northern Virginia | Silk Vision &amp; Surgical Center`
2. `meta description` 140–160 chars, names procedure + Annandale/Manassas.
3. `theme-color #001325`.
4. Staging: `robots noindex, nofollow`. Remove only when going live.
5. Open Graph: type, site_name, title, description, `og:image` from
   Cloudinary at `c_fill,w_1200,h_630,g_auto,f_jpg`; `twitter:card
   summary_large_image`.
6. JSON-LD `@graph`: `MedicalBusiness` (the shared org block, unchanged),
   `MedicalProcedure` (name, procedureType, bodyLocation, howPerformed), and
   `FAQPage` whose questions/answers are **word for word** the FAQ on the page.
7. Favicons, `preconnect` to res.cloudinary.com, `preload` of the hero image
   with `fetchpriority="high"`.
8. Seven stylesheets in order, each `?v=N`; `main.js?v=N` with `defer`.

## Shared shell (identical on every page)

- `.skip-link` → `#main`; `.progress` hairline; inline SVG icon sheet.
- `.topbar` (hidden on phones): Pay Bill Online, Special Offers, Call or Text.
- `.site-header` (sticky, white 86% + blur, gains shadow when scrolled):
  logo → silkvision.net; nav **top-level only** — Vision Correction, Eye
  Care, About, Patients — and the solid "Book a consultation" button.
  Below 62rem a Menu/Close toggle driven by `aria-expanded`.
- `.site-footer` on `--ink-900`: logo, four office columns (Annandale,
  Manassas, LASIK center, Office hours + phone), disclaimer, copyright,
  Sitemap, ImageWorks credit.
- `.sticky-cta` (phones): "Book consultation" (plum) + "Call now" (ink-900);
  appears after the hero, hides at the closing band (`#contact`).

Copy these from `assets/starter/index.html`; don't rewrite them.

## Section order — the Ziplyft example

Use this as the default narrative for a procedure page; drop sections that
have no content rather than padding them.

| # | Section | Ground | Pattern |
| --- | --- | --- | --- |
| 1 | Hero — name + region, promise, intro, 2 CTAs | photo + scrim | `.hero` |
| 2 | What is it? — facts bar, copy + diagram/photo | white `band--open` | `.facts-bar`, `.split`, `.diagram` |
| 3 | The problem in the patient's words | paper | `.split` + `.frame--photo` |
| 4 | How does it work? — copy + loop video, 3 steps | deep | `.frame--wide` + `.vid-btn`, `.steps3` |
| 5 | Benefits — what it does / what it leaves out | tint | `.yesno` |
| 6 | Before & after | white | `.carousel` of `.ba` sliders |
| 7 | X vs. the traditional alternative | paper slim | `.compare` table |
| 8 | Which option is right for you? | white slim | `.fork` + `.fork__verdict` |
| 9 | The physician | deep | `.profile` card |
| 10 | Physician video + 4 facts | white | `.video-split`, `.play`, `.facts` |
| 11 | What happens during the procedure | deep slim | `.stepper` tabs |
| 12 | Recovery timeline | white slim | `.stages` |
| 13 | Am I a candidate? | paper | `.fit` list |
| 14 | The caveat ("not every … is the same") | plum slim | `.banner` + `.btn--invert` |
| 15 | Cost | paper slim | `.price-row` + cost `.faq` |
| 16 | How long do results last? | deep slim | `.over-time` |
| 17 | FAQ | white | `.faq-split` + `.faq` |
| 18 | Closing call | deep slim | `.closing` |

Rules of thumb:
- Alternate grounds; never two identical grounds in a row (white→paper→
  deep→tint→white…). Plum appears once at most.
- **One closing band, not two.** Locations live in the footer, not in an
  extra contact section.
- Each `<section>` has `aria-labelledby` pointing at its h2 `id`; give
  anchor targets an `id` (`#candidate`, `#results`, `#compare`, `#contact`).
- Every section head: `.stack.head` → `h2` + `p.lead` (`.lead--wide` when
  it is one sentence). A `.subhead` (h3, Inter regular, blue) may qualify
  the title.
- In-page CTAs point to an anchor on the page (e.g. "See if it's right for
  you" → `#candidate`) or to the booking URL; never invent a URL.

## Links

| Purpose | URL |
| --- | --- |
| Booking | `https://www.mypatientvisit.com/onlinescheduling/#/scheduler/schedule?practiceid=b46123f5-99ee-4f66-969c-fe650949c344` |
| Pay bill | `https://www.mypatientvisit.com/#/login?practiceID=FCPGUL` |
| Phone | `tel:+17038769700` |
| Home | `https://www.silkvision.net/` |
| Special offers | `https://www.silkvision.net/special-offers` |
| Vision Correction | `https://www.silkvision.net/silk-vision-lasik-eye-surgery-center` |
| Eye Care | `https://www.silkvision.net/cataract-surgery-and-cataract-removal` |
| About / Meet Dr. Silk | `https://www.silkvision.net/trusted-eye-physicians-and-surgeons-northern-virginia` |
| Patients | `https://www.silkvision.net/registration-consent-forms` |
| Sitemap | `https://www.silkvision.net/sitemap` |
| Review Annandale | `https://maps.app.goo.gl/pcg77yQvGUgRG6GPA` |
| Review Manassas | `https://g.page/r/CWlAzNggLTwJEBA` |

External links: `target="_blank" rel="noopener"`.

## Media

- Photos/video on Cloudinary cloud `dsjbq35es`:
  `https://res.cloudinary.com/dsjbq35es/image/upload/f_auto,q_auto,w_{W}/{id}.jpg`;
  video `…/video/upload/q_auto/{id}.mp4`, poster `…/video/upload/so_2,f_auto,q_auto,w_{W}/{id}.jpg`.
- Hero: background in CSS (`70% 62% / cover`, anchored on the subject),
  `w_1800`, and `c_limit,w_3600` at ≥120rem.
- Never put a scrim, filter or crop over the clinical subject of a photo
  if it would hide what the page is about.
- Before/after pairs: local `images/cases/caseN-before.jpg` /
  `-after.jpg`, identical dimensions, with alt text per state.

## Deploy

GitHub Pages from the repo root (`.nojekyll`), repo named
`imageworksc/silkvision-<page>`, staging URL
`https://imageworksc.github.io/silkvision-<page>/`. Bump `?v=` on every
deploy that touches CSS/JS. The README lists structure, what changed from
the draft and **Pending from the practice**.
