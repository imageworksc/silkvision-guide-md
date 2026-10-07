# How to install and use the Silk Vision skill in Claude

This guide is for anyone on the team, whether or not you code. It takes
about 5 minutes.

**What is a skill?** A package of instructions Claude loads when it needs
them. With this skill installed, Claude already knows Silk Vision's colours,
fonts, components, legal copy and contact details. Every new page then comes
out matching the [Ziplyft page](https://imageworksc.github.io/silkvision-ziplyft/).

Pick **one** option:

| You use… | Follow |
| --- | --- |
| claude.ai in a browser, or the Claude desktop app | [Option A](#option-a--claudeai-or-the-desktop-app-no-code) (no code) |
| Claude Code (terminal, VS Code, or the app's Code tab) | [Option B](#option-b--claude-code) |

---

## Option A — Claude.ai or the desktop app (no code)

### 1. Download the file

Click to download:
**[silkvision-design.zip](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip)**

⚠️ **Don't unzip it.** Claude needs the `.zip` as it is.

### 2. Turn on skills

1. Go to [claude.ai](https://claude.ai) (or open the app).
2. Open **Settings**. It's under your name or initial, bottom left.
3. Go to **Capabilities**.
4. Turn on **Code execution and file creation**. Skills need it.

### 3. Upload the skill

1. On the same page, scroll to **Skills**.
2. Click **Upload skill**.
3. Choose `silkvision-design.zip`.
4. Check that **silkvision-design** is listed and **toggled on**.

> On a Team or Enterprise plan, if you don't see the option, ask your
> admin to enable skills for the organization.

### 4. Test it

Start a new chat and type:

```
Use the silkvision-design skill and tell me which sections a Silk Vision procedure page has.
```

If Claude answers with the hero, facts bar, FAQ, closing call and so on,
it works ✅

---

## Option B — Claude Code

### For you (all projects)

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git ~/.claude/skills/silkvision-design
```

### For one project (and everyone who works in that repo)

From the project folder:

```bash
git clone https://github.com/imageworksc/silkvision-guide-md.git .claude/skills/silkvision-design
```

Start a **new** Claude Code session and type `/skills`. You should see
**silkvision-design**.

**No git?** Download the
[zip](https://github.com/imageworksc/silkvision-guide-md/raw/main/silkvision-design.zip),
unzip it, and move the `silkvision-design` folder into `~/.claude/skills/`
(on Windows: `C:\Users\YOU\.claude\skills\`).

---

## Building a new page

### Step 1 — Get the content ready

Pick whichever is easiest:

- **Fill in the form:** [templates/content-brief.md](../templates/content-brief.md).
  Fill in what you have and leave the rest blank.
- **Paste your doc:** the page copy from Word or Google Docs.
- **Give the link** to the current silkvision.net page you're rebuilding.

### Step 2 — Ask Claude

```
Build the Silk Vision LASIK page with the silkvision-design skill.
Here is the content: [paste text or attach the brief]
```

```
Rebuild this page in the Silk Vision design:
https://www.silkvision.net/cataract-surgery-and-cataract-removal
```

```
Review this Silk Vision page against the design system and list what doesn't comply.
```

### Step 3 — Review what you get

- Claude first shows the **section outline**. That's the time to correct it.
- Anything you didn't provide (price, photos…) becomes a **visible
  placeholder**. Claude never invents it.
- You get a folder with `index.html`. Open it in a browser to preview.

### Step 4 — Publish (for whoever handles GitHub)

1. Create `imageworksc/silkvision-<page>` and push the folder.
2. **Settings → Pages → Deploy from branch → main / root**.
3. It goes live at `https://imageworksc.github.io/silkvision-<page>/`.

---

## Updating the skill

- **Claude.ai:** download the zip again, delete the old skill in Settings →
  Skills, and upload the new one.
- **Claude Code:** `git -C ~/.claude/skills/silkvision-design pull`

## Troubleshooting

| Problem | Fix |
| --- | --- |
| No "Skills" in Settings | Turn on *Code execution and file creation* in Capabilities. On a Team or Enterprise plan, ask your admin. |
| "Invalid skill" on upload | Upload the `.zip` exactly as downloaded. Don't unzip it or re-zip it. |
| Claude doesn't use the skill | Name it in your message ("use the silkvision-design skill") and check that it's toggled on. |
| Not listed in `/skills` | Start a new session and check that `~/.claude/skills/silkvision-design/SKILL.md` exists. |
