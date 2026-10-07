# Content & voice

Pages are in **US English**, written for an adult past sixty who has just
heard they may need eye care and wants a straight answer.

## Voice

- **Calm, plain, specific.** Short declarative sentences. Numbers over
  adjectives ("less than 15 minutes", "7–10 days"), never "quick" alone.
- **Honest about limits.** Every page says what the procedure *doesn't*
  do and who it isn't for ("Ziplyft isn't automatically better than
  traditional blepharoplasty."). The examination comes before the
  procedure: "Don't choose the procedure first."
- **Second person, warm, never salesy.** "Let Dr. Silk take a look." No
  exclamation marks, no "revolutionary", "painless", "guaranteed", "best".
- **The physician is the authority**, the technology is the tool: "The
  technology matters. So does the physician."

## Headings

- Section h2s are the **questions patients actually search**: "What is
  X?", "How does X work?", "Am I a good candidate for X?", "How much does X
  cost?", "How long do X results last?", "X recovery: what to expect",
  "X vs. traditional Y". These double as SEO and FAQ structure.
- The h1 names the procedure and the region: `{Procedure} in Northern
  Virginia`. Trademarks get `&trade;` on first use in h1/hero copy.
- Sentence case. No eyebrow labels above headings.

## Medical & compliance language

- Hedge outcomes: "typically", "most patients", "may", "for the right
  patient", "individual results and recovery times vary".
- Never promise results, painlessness, or permanence beyond what is true
  ("The excess skin removed does not grow back. Natural aging continues.").
- Insurance: cosmetic = generally self-pay; mention medical necessity
  evaluation where relevant.
- Before/after imagery always carries "Individual results and recovery
  times vary."
- Price: only an **approved** figure. Otherwise the visible `.price-slot`
  placeholder: `[Add approved Silk Vision price or starting price]`.
- Credentials (use exactly): Board-certified ophthalmologist ·
  Fellowship-trained cornea specialist · 26,000+ eye surgeries performed ·
  20+ years serving Northern Virginia.

## CTAs

| Where | Primary (solid) | Secondary (ghost) |
| --- | --- | --- |
| Header | Book a consultation | — |
| Hero | Schedule a consultation | (703) 876-9700 |
| Mid-page | Find out if you're a candidate · Compare your options · Get your treatment & pricing recommendation | See if X is right for you (→ `#candidate`) · Meet Dr. Silk |
| FAQ | — | Call (703) 876-9700 |
| Closing | Schedule your X consultation | Or call (703) 876-9700 |
| Sticky (phone) | Book consultation | Call now |

Verb first, specific, one line on a 320px phone (provide `lbl-short`).

## Typography in copy

- Curly quotes and apostrophes (’ “ ”), en dash for ranges (7–10), em dash
  with spaces for asides ( — ), `&nbsp;` in "Dr.&nbsp;Silk" and
  "(703)&nbsp;876-9700".
- One `strong.hl` per paragraph at most, on the claim.
- Lists: parallel phrasing, no trailing periods on fragments.

## Alt text

Describe what the image shows that matters to the page ("Close view of a
woman's eye with heavy, hooded upper-eyelid skin"); before/after alts name
the case and the state. Decorative SVGs are `aria-hidden`.
