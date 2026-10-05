# Claude Code handoff — Agentic SDLC lab

Version 1.1 · 5 October 2026

## Why the rest belongs in Claude Code

Everything that remains needs your machine: a `gh` login, Node (and Quarto, Python or R for those editions), Pocock's skills installed, your screen for captures, and GitHub itself. Building the lab's own repos through the loop is also the best rehearsal there is.

Three sessions, in this order. Each prompt is written to be pasted as the first message of a fresh Claude Code session started in the kit folder, and each ends with an acceptance check so you know when the session is done.

## Kit layout

```
pocock-sdlc-lab/
  CLAUDE.md                               # tells Claude Code what this folder is and the guardrails
  README.md
  docs/Pocock-SDLC-Lab-Build-Brief.docx   # v1.1 — the spec for everything
  docs/build-brief.md                     # the same brief as Markdown, so Claude Code can read it
  docs/Pocock-SDLC-Lab-Summary.docx       # one-page summary and the 150-minute version
  docs/CLAUDE-CODE-HANDOFF.md             # this file
  scaffolds/pocock-end-to-end-js/         # template contents, JavaScript edition (simplest)
  scaffolds/pocock-end-to-end-python/     # template contents, Python edition
  scaffolds/pocock-end-to-end-r/          # template contents, R edition
  captures/                               # B1..B5 screenshots land here, per edition
```

Keep `scaffolds/` untouched as the record of v1.1. Work in copies under `~/repos/` (the prompts say so).

## Before session 1

Your own machine needs Appendix A steps 1–6 of the brief: Claude Code signed in, Node 20+, Pocock's skills (`npx skills@latest add mattpocock/skills`), git identity, GitHub CLI, `gh auth login` plus `gh auth setup-git`. For the Python edition add Python 3.12 and Quarto; for the R edition, R 4.x and Quarto. The JavaScript edition needs nothing beyond Node.

Start every session with:

```bash
cd ~/pocock-sdlc-lab
claude
```

## Session 1 — Template repos (one edition per run; start with JavaScript)

Estimated 30–45 minutes per edition. Paste this, changing `js` to `python` or `r` for the other editions:

```
Read docs/build-brief.md, in particular Appendix B. We are doing steps B1–B5 for the
JavaScript edition. The scaffold is scaffolds/pocock-end-to-end-js. First copy it to
~/repos/pocock-end-to-end-js and work there; never modify scaffolds/.

B1: git init, commit "Initial template", then
    gh repo create pocock-end-to-end-js --public --source=. --push
B2: gh repo edit acatlin/pocock-end-to-end-js --template, then confirm the
    "Use this template" button exists (gh repo view --web).
B3: run the README's setup and verify commands and compare the output with the
    Expected lines in Appendix A step 11 and 12 (for Python and R, also commit _freeze/
    after quarto render).
B4: tell me when to click Settings → Pages → Source: GitHub Actions; after I confirm,
    push an empty commit, run gh run watch, and report the live URL and whether the
    page shows the rides table and chart.
B5: run /permissions and list the rules that came from .claude/settings.json; then I
    will run /setup-matt-pocock-skills myself and choose GitHub Issues — afterwards
    show me git status, explain what it wrote, and commit the repo-level files to the
    template (never .claude/settings.local.json).

Rules: before any command that changes GitHub, say what it will do and wait for my
yes. At the end of each step, quote the Expected line from the brief and say whether
it matched. Finish with a list titled "Corrections to the brief" containing any line
in Appendix A or B that was wrong or missing, with the exact replacement text.
```

Acceptance: the template repo is public under `acatlin`, marked as a template, Issues on, the Pages run is green and the baseline site is live, the test command and local build match the brief's Expected lines, and the setup skill's repo files are committed. Apply the "Corrections to the brief" to the Word file before moving on.

## Session 2 — Rehearsal and captures (the edition you will teach first)

Estimated 60–90 minutes. You run the five skills yourself in this session; Claude Code is the tool, not the operator. Paste:

```
Read docs/build-brief.md sections 4 and 5 and Appendix B steps B6–B8. Edition: JavaScript.

B6: create the demo repo exactly as a student would:
    gh repo create pocock-demo-js --public --clone --template acatlin/pocock-end-to-end-js
    in ~/repos, then walk Appendix A steps 8–13 in it as written. Report every line
    whose Expected text did not match what we saw.
B7: I will now run the loop myself on a branch with FEATURE.md set to:
    "Add a page 'By month' that shows total rides per month as a bar chart, computed by
    a tested function." I will type /grill-with-docs, /to-spec, /to-tickets,
    /implement, /code-review, then gh pr create and gh pr merge. Your job between
    steps: keep the clock (I will say "start step N" and "end step N"), record minutes
    per step, and build the prepared-answers table from the questions the grill
    actually asked.
B8: when I say "capture N", I will paste or save a screenshot; file it as
    captures/js/B<N>.png. At the end write captures/js/rehearsal-notes.md with the
    minutes per step, the prepared-answers table, and any changes the brief needs.
```

Acceptance: `captures/js/B1.png` … `B5.png` exist and are cropped to the exit-check moment; every step fit its demo box on the second run (if not, shrink the feature, not the box); `rehearsal-notes.md` has the prepared-answers table; the PR is merged and the page is live. Then run B9 (delete and recreate the demo repo) before the cohort.

## Session 3 — The deck (one edition per run)

Two ways to do this. In Claude.ai, upload `captures/<edition>/` and the brief and say "build the JavaScript edition deck"; that was the decision in the brief. If you would rather stay in Claude Code, add Anthropic's public document skills (github.com/anthropics/skills, which include pptx) with the same installer you used for Pocock's — `npx skills@latest add anthropics/skills`, selecting pptx — confirm a pptx skill appears in the slash menu, then paste:

```
Read docs/build-brief.md in full. Build the JavaScript edition of the deck exactly as
sections 3 and 8 specify: 14 main slides plus backup slides B1–B5 from captures/js/;
the step-slide template on slides 8–12 (header with step, skill and time box;
command; what you'll see; exit check; if you stall); speaker notes on every slide
expanded from sections 3 and 4; teal palette (#012E36 background, #028090 and
#02C39A accents, white text); body text 20pt minimum, monospace 16pt minimum;
nothing in the bottom 8% of any slide; no animations. Leave [COHORT], [DATE],
[ZOOM LINK] and [PRESENTER] as visible placeholders. Output
docs/pocock-sdlc-lab-js.pptx. Before telling me it is done, render every slide to an
image and check the font-size and bottom-margin rules against each one.
```

Acceptance: 14 main slides plus 5 backups, every slide has notes, placeholders visible, fonts at or above the minimums, and the rendered images look right over a screen share.

## Guardrails for every session

- The decisions in Appendix C are fixed. The agent proposes corrections to Appendix A or B when reality differs; you apply them to the Word file.
- Templates stay at baseline. All feature work happens in demo repos created from them.
- Nothing destructive on GitHub without an explicit yes: `gh repo delete`, force push, branch deletion on the templates.
- `.claude/settings.local.json` is per-machine and never committed; `.claude/settings.json` ships with the templates.
- If a skill's behavior differs from the brief's step notes (Pocock renames often), the brief follows the skill, not the other way round; note the change in Appendix C.

## Running order

| # | Session | Editions | Time |
|---|---|---|---|
| 1 | Template repos | js, then python, then r | 30–45 min each |
| 2 | Rehearsal and captures | the edition taught first; others before their cohort | 60–90 min each |
| 3 | Deck | one run per edition | 30–60 min each |
| — | Before each cohort | B9: recreate the demo repo; fill placeholders; send Appendix A one week ahead | 15 min |
