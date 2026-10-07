# Silk Vision design skill

A Claude skill that holds the design and build guide for every Silk Vision &
Surgical Center web page, extracted from the shipped
[Ziplyft™ page](https://imageworksc.github.io/silkvision-ziplyft/)
([source](https://github.com/imageworksc/silkvision-ziplyft)) and the
[office-based surgery page](https://github.com/imageworksc/silkvision-seal-of-approval)'s
`DESIGN.md`.

With it installed, ask Claude for things like *"Build the Silk Vision LASIK
page"* or *"Review this Silk Vision page against the design system"*, and it
will follow the tokens, components, copy rules and QA checklist here.

## What's inside

```
SKILL.md                     the guide Claude loads: rules, shared facts, workflow
references/
  tokens.md                  colour, type, space, radius, shadow, motion values
  components.md              copy-ready HTML for every component and section pattern
  page-blueprint.md          head, schema, shared shell, section order, links, deploy
  content-voice.md           voice, headings, medical language, CTAs
  qa-checklist.md            motion contract, accessibility floors, responsive sweep
assets/starter/              a working page shell: CSS, JS, fonts, logos, favicons
scripts/new-page.sh          copies the starter into a new project folder
```

## Install

### Claude Code (CLI, desktop, VS Code)

Personal (all your projects):

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git ~/.claude/skills/silkvision-design
```

One project only (shared with the team through that repo):

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git .claude/skills/silkvision-design
```

Restart Claude Code (or start a new session). Check with `/skills` — it
appears as **silkvision-design**. Update later with `git pull` in that folder.

### Claude.ai / Claude desktop app

1. Download
   [**`silkvision-design.zip`**](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip)
   from the root of this repo.
2. In Claude: **Settings → Capabilities → Skills → Upload skill**, and pick
   the zip.
3. Make sure the skill is toggled on.

To rebuild the zip after editing the skill:

```bash
./scripts/build-zip.sh
```

## Starting a new page by hand

```bash
~/.claude/skills/silkvision-design/scripts/new-page.sh ~/code/silkvision-lasik
```

Then replace every `{{PLACEHOLDER}}` in `index.html` and the two
`HERO_IMAGE` URLs in `css/sections.css`.

## Updating the guide

The Ziplyft page is the reference. When a newer Silk Vision page settles a
new decision, update `SKILL.md` / `references/` and copy any shared CSS or JS
changes into `assets/starter/`, then rebuild the zip.

Fonts: Poppins and Inter, SIL Open Font License (licences in
`assets/starter/fonts/`).
