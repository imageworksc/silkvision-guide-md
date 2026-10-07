# Silk Vision design skill for Claude

Install this skill once, and Claude will build and review any Silk Vision &
Surgical Center page in the house style. The reference is the
[Ziplyft™ page](https://imageworksc.github.io/silkvision-ziplyft/): same
colours, fonts, components, copy rules and contact details.

## 📥 Install — 5 minutes, no coding needed

### 👉 **[Tutorial en español](docs/INSTALAR.md)** · **[Tutorial in English](docs/INSTALL.md)**

**Quick version**

| Where you use Claude | What to do |
| --- | --- |
| **claude.ai / desktop app** | 1. Download **[silkvision-design.zip](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip)** (don't unzip it) · 2. Settings → Capabilities → turn on *Code execution and file creation* · 3. Skills → **Upload skill** → choose the zip |
| **Claude Code** | `git clone https://github.com/imageworksc/silkvision-guide-md.git ~/.claude/skills/silkvision-design` and start a new session |

## ✍️ Make a new page

1. Fill in the **[content brief](templates/content-brief.md)**, or just have
   your copy or the old page's link ready.
2. Tell Claude: *"Build the Silk Vision [procedure] page with the
   silkvision-design skill. Here's the content: …"*
3. Check the section outline Claude proposes, then open the `index.html` it
   gives you.

Claude never invents prices, results or facts. Anything missing shows up
as a visible placeholder.

## What's inside

```
SKILL.md                     the guide Claude loads: rules, shared facts, workflow
references/
  tokens.md                  colour, type, space, radius, shadow, motion values
  components.md              copy-ready HTML for every component and section pattern
  page-blueprint.md          head, schema, shared shell, section order, links, deploy
  content-voice.md           voice, headings, medical language, CTAs
  qa-checklist.md            motion contract, accessibility floors, responsive sweep
templates/content-brief.md   fill-in form for a new page's content
assets/starter/              working page shell: CSS, JS, fonts, logos, favicons
scripts/new-page.sh          copies the starter into a new project folder
scripts/build-zip.sh         rebuilds silkvision-design.zip
docs/                        install tutorials (ES / EN)
```

## For maintainers

The Ziplyft page
([source](https://github.com/imageworksc/silkvision-ziplyft)) is the
reference, along with the office-based surgery page's
[`DESIGN.md`](https://github.com/imageworksc/silkvision-seal-of-approval).
When a newer page settles a new decision:

1. Update `SKILL.md` and `references/`.
2. Copy any shared CSS or JS changes into `assets/starter/`.
3. Run `./scripts/build-zip.sh` and commit the new zip. Claude.ai users
   download it from here, so it has to stay current.

Fonts: Poppins and Inter, SIL Open Font License (`assets/starter/fonts/`).
