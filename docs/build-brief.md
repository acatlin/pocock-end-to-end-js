**Agentic SDLC Lab — Build Brief for the Slide Deck**

Matt Pocock’s five-step workflow, run end to end on a small website deployed to GitHub Pages. Python, R and JavaScript editions.

*Version 1.1 · 5 October 2026 · For the Claude session that builds the deck, and for the presenter*

Contents: 1 Purpose, audience and objective · 2 Session plan · 3 Slide-by-slide outline · 4 Step notes · 5 Demo script · 6 Pre-work · 7 Rules · 8 Deck format rules · 9 Attribution and links · 10 Open questions and build notes · Appendix A Student pre-work guide · Appendix B Instructor runbook · Appendix C Decision log

# 1. Purpose, audience and objective

## 1.1 What this document is

A build brief. A Claude session using the pptx skill builds a slide deck from this document for a two-hour lab session in which graduate data science students run Matt Pocock’s five-step agentic workflow end to end and finish with a live web page they specified, ticketed, built, reviewed, merged and deployed. The brief is written to be self-sufficient: everything the deck builder would otherwise have to ask the presenter is in here.

One outline builds **three editions** of the deck — Python, R and JavaScript — for separate audiences. The editions differ in exactly four slots, marked ★ in the slide outline: the pre-work check (slide 6), the demo slide (slide 7), the implement slide (slide 11) and the backup appendix (B1–B5). Everything else is identical. Output files: pocock-sdlc-lab-python.pptx, pocock-sdlc-lab-r.pptx and pocock-sdlc-lab-js.pptx. The JavaScript edition is the simplest to run: a static site with Node’s built-in test runner, no Quarto and no language runtime to install in CI; it is the right default for a cohort with no language preference.

The brief is institution-neutral and will be reused across cohorts. Fill-in fields appear as \[COHORT\], \[DATE\], \[ZOOM LINK\] and \[PRESENTER\]; the builder leaves them as visible placeholders.

## 1.2 Audience

- A small graduate seminar group — the schedule is written for up to eight students. The debrief is the one block that scales with headcount (one link per student in chat); with more than eight, add a minute per extra student there.

- Data science students, not software engineers. They already use Claude Code day to day; Pocock’s skills are new to them. Expect comfort with notebooks and scripts, little or no habit of specs, tickets, tests or pull requests.

- One language per cohort: a Python cohort gets the Python edition, an R cohort the R edition, a JavaScript cohort the JavaScript edition. Appendix A keeps all three test-runner tracks so a mixed room still works.

- Delivered remotely over Zoom with screen share and chat (assumed; the deck’s font rules follow from this).

## 1.3 Objective

Each student leaves the session with a live page on a website they own, produced by the full loop — /grill-with-docs → /to-spec → /to-tickets → /implement → /code-review → merge → deploy — and with the pull request behind it as the record. Students who could not complete pre-work watch the lab and finish on their own afterwards.

## 1.4 The intro’s argument (two halves, equal weight)

The five-minute intro carries exactly two ideas, and the deck gives them one slide each at equal weight:

1.  **Pocock’s half: the agent is only as good as the spec.** Unspecified agent work fails in predictable ways — the agent builds the wrong thing, the scope drifts, and the diff is too big to review. The loop separates thinking from typing: every decision is made before code exists, in writing the agent can read.

2.  **The presenter’s half: this is where your judgment goes.** Once the agent does the typing, a data scientist’s value is in deciding what to build, what “done” means, and whether the result is right. Answering the grill, approving the spec and reading the review are the judgment steps, and that discipline — judgment over implementation effort — is what employers now hire for.

# 2. Session plan

114 minutes planned, 120 hard stop. The 6-minute reserve goes to implement first, then grill, and only if the room needs it. Step slides show the base box only.

| **Time** | **Block**                           | **Minutes** | **What happens**                                                             |
|----------|-------------------------------------|-------------|------------------------------------------------------------------------------|
| 0–5      | Intro                               | 5           | Slides 1–5: the promise, the two arguments, the five steps                   |
| 5–10     | Pre-work check                      | 5           | Slide 6: each item confirmed in chat; anyone blocked switches to watching    |
| 10–40    | Live demo                           | 30          | Slide 7 then screen share: the full loop on the demo repo, rehearsed feature |
| 40–45    | Break                               | 5           | Slide 8 goes up before the break so the first command is visible on return   |
| 45–60    | Step 1: /grill-with-docs            | 15          | Students answer the interview on their own feature                           |
| 60–70    | Step 2: /to-spec                    | 10          | Spec published as a GitHub issue; students read and correct it               |
| 70–78    | Step 3: /to-tickets                 | 8           | One to three ticket issues with blocking links                               |
| 78–98    | Step 4: /implement                  | 20          | Test-first build on a branch; local render passes                            |
| 98–110   | Step 5: /code-review, merge, deploy | 12          | Review, open PR, merge, watch the Action, open the live URL                  |
| 110–114  | Debrief                             | 4           | Live URL + PR link in chat, one sentence on where each person stalled        |

# 3. Slide-by-slide outline

Fourteen main slides plus a backup appendix. ★ marks a slot that differs between editions. Every slide carries speaker notes; the “Notes” column is the gist the builder expands.

| **\#**  | **Slide**                                          | **Content**                                                                                                                                                                                                                                                                                                                                                                                                                                                              | **Notes**                                                                                        |
|---------|----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| 1       | Title                                              | “Ship a page with an agent: the five-step loop.” \[COHORT\], \[DATE\], \[PRESENTER\].                                                                                                                                                                                                                                                                                                                                                                                    | One sentence: by the end you will have a live page you built with an agent, the disciplined way. |
| 2       | The promise and the clock                          | The promise in one sentence (live page, your site, specced → deployed, agent does the typing). The session plan from section 2 as a compact table.                                                                                                                                                                                                                                                                                                                       | Time boxes are hard. Say the 120 stop out loud.                                                  |
| 3       | Why, part 1: the agent is only as good as the spec | Three failure modes of unspecified agent work: wrong thing, scope drift, unreviewable diff. The loop puts every decision in writing before code.                                                                                                                                                                                                                                                                                                                         | Credit Pocock and the skills repo. Equal weight with slide 4.                                    |
| 4       | Why, part 2: where your judgment goes              | When the agent types, you decide what to build, what done means, and whether it is right. The grill, the spec review and the code review are the judgment steps. Judgment over implementation effort is what employers hire for.                                                                                                                                                                                                                                         | Presenter’s framing. Equal weight with slide 3.                                                  |
| 5       | The five steps                                     | The chain: 1 grill-with-docs (or wayfinder) → 2 to-spec → 3 to-tickets → 4 implement → 5 code-review, plus today’s tail: merge → deploy. The step-1 fork: grill-with-docs for a feature inside a repo (today); grill-me is the same interview without a repo; wayfinder is for work too big for one session and hands off to to-spec.                                                                                                                                    | Use step numbers only; palette stays teal. Mention /setup-matt-pocock-skills was pre-work.       |
| 6 ★     | Pre-work check                                     | Checklist, one line each: Claude Code runs · skills installed · repo from template, public, Issues on · gh auth status OK · Claude Code may run gh · setup skill done · tests pass (★ pytest -q → 3 passed / ★ testthat → PASS 3 / ★ npm test → \# pass 3) · site builds locally (★ quarto render / ★ npm start) · baseline site live · feature sentence written. Blocked rule: anything failing → watch today, finish on your own later; no setup debugging in-session. | Ask for a thumbs-up per item in chat. Five minutes, no exceptions.                               |
| 7 ★     | Watch the whole loop                               | “Live demo: acatlin/pocock-demo-python” / “acatlin/pocock-demo-r” / “acatlin/pocock-demo-js”, the rehearsed feature in one sentence, 30 minutes, “backups in appendix”.                                                                                                                                                                                                                                                                                                  | Demo script is section 5. Hard-cut rule: overrun → backup slide.                                 |
| 8       | Step 1: /grill-with-docs                           | Step-slide template (see below). Box 45–60.                                                                                                                                                                                                                                                                                                                                                                                                                              | Content from section 4. Goes up before the break.                                                |
| 9       | Step 2: /to-spec                                   | Template. Box 60–70.                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Content from section 4.                                                                          |
| 10      | Step 3: /to-tickets                                | Template. Box 70–78.                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Content from section 4.                                                                          |
| 11 ★    | Step 4: /implement                                 | Template. Box 78–98. ★ One line: “Tests: pytest”, “Tests: testthat — same loop, the agent writes testthat tests” or “Tests: node --test”. Exit check includes a local site build (★ quarto render / ★ npm start).                                                                                                                                                                                                                                                        | Content from section 4. Reserve minutes go here first.                                           |
| 12      | Step 5: /code-review → merge → deploy              | Template. Box 98–110. Sequence: review → fix or acknowledge → gh pr create → gh pr merge → watch Actions → open your URL.                                                                                                                                                                                                                                                                                                                                                | Content from section 4. Pages deploy takes about a minute.                                       |
| 13      | Debrief                                            | Paste in chat: live URL, PR link, one sentence on where you stalled. Presenter keeps the links as the completion record.                                                                                                                                                                                                                                                                                                                                                 | Four minutes. Stall sentences feed the next cohort’s revision.                                   |
| 14      | After today                                        | When to use grill-with-docs (one session, in a repo) vs wayfinder (multi-session, hands off to to-spec). /ask-matt as the router when unsure which skill fits. Names that changed in older material: to-prd → to-spec, to-issues → to-tickets, pathfinder → wayfinder. Links from section 9.                                                                                                                                                                             | Do not mention in-progress skills; they rename often.                                            |
| B1–B5 ★ | Backup appendix                                    | One captured terminal output per step from the edition’s rehearsal, cropped to the moment of the exit check. Used when a live step overruns.                                                                                                                                                                                                                                                                                                                             | Captured during Appendix B step 8. Placeholders until then.                                      |

### Step-slide template (slides 8–12)

All five step slides use one layout, in this order, so students learn where to look:

- **Header:** step number and skill name, time box printed (e.g. “Step 1 · /grill-with-docs · 45–60”).

- **Command:** what to type, in monospace, large.

- **What you’ll see:** two or three lines describing the output.

- **Exit check:** the one condition that means “move on”, phrased so it can be verified over screen share in seconds.

- **If you stall:** one line. The five-minute rule applies: after five minutes of presenter help, the student switches to watching.

- The slide stays on screen while students work. No animations, nothing that has to be clicked through.

# 4. Step notes

One block per skill: what it does, the command, what the student sees, the exit check, likely stalls. Facts about the skills were checked against the mattpocock/skills repository and its docs on 1 October 2026. **Builder:** before finalizing slides 8–12, read each skill’s current SKILL.md in the repo and align the command wording and output names; Pocock renames and reworks skills often.

## Step 1 — /grill-with-docs (15 min)

|                     |                                                                                                                                                                                                                                                                                                                                                      |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it does**    | Interviews the student about the feature until every branch of the design is resolved, after reading the repository’s documentation. Pocock’s own routing: grill-with-docs when there is a codebase and the work fits one session; grill-me is the same interview for non-code or no-repo situations; wayfinder is for work too big for one session. |
| **Command**         | /grill-with-docs followed by the feature sentence from FEATURE.md (e.g. “Add a page that shows total rides per month as a bar chart from data/rides.csv”).                                                                                                                                                                                           |
| **What you’ll see** | A sequence of questions about the feature, each asked only when the questions it depends on are settled, with recommendations. Answer each; say “yes” when the recommendation is right.                                                                                                                                                              |
| **Exit check**      | The skill reports no open branches, and the student can state the feature in three sentences (what, where on the site, how we know it works).                                                                                                                                                                                                        |
| **Likely stalls**   | Vague answers (“whatever you think”) make the interview longer, not shorter. A feature sentence with “and” in it is two features: cut one now. Accepting every default without reading is skipping the judgment step.                                                                                                                                |
| **Coaching note**   | The quality of the answers is the point of this step. Students should treat each question as a product decision they will have to defend in the spec review.                                                                                                                                                                                         |

## Step 2 — /to-spec (10 min)

|                     |                                                                                                                                                                                                              |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it does**    | Turns the grill conversation into a spec (a PRD) and publishes it to the repository’s issue tracker — for this lab, a GitHub issue. Formerly named /to-prd.                                                  |
| **Command**         | /to-spec                                                                                                                                                                                                     |
| **What you’ll see** | A new GitHub issue created and its number and URL printed. gh issue view \<n\> --web opens it.                                                                                                               |
| **Exit check**      | The spec issue exists; the student has read it end to end and either agrees with it or has edited the issue to fix it. Nothing moves to tickets that the student has not read.                               |
| **Likely stalls**   | Tracker not configured → /setup-matt-pocock-skills was skipped in pre-work (that student watches from here). A spec longer than a screen means the feature was not tiny: trim it in the issue before step 3. |

## Step 3 — /to-tickets (8 min)

|                     |                                                                                                                                                                                      |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it does**    | Breaks the spec into tracer-bullet tickets, each declaring which tickets block it, created as GitHub issues with native blocking links. Formerly named /to-issues.                   |
| **Command**         | /to-tickets (reference the spec issue number if asked).                                                                                                                              |
| **What you’ll see** | One to three new issues, each linked to the spec, with blocking relationships. gh issue list shows them.                                                                             |
| **Exit check**      | One to three ticket issues exist and the student can say in what order they will be built.                                                                                           |
| **Likely stalls**   | More than three tickets means the spec grew: close the extras and note it in the spec issue. Tickets that depend on each other are fine; a ticket the student cannot explain is not. |

## Step 4 — /implement (20 min)

|                               |                                                                                                                                                                                                                                                                                                                                                                                        |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it does**              | Builds the work described by the tickets, test-first, driving /tdd at seams agreed with the student, and closes out with a code review before committing.                                                                                                                                                                                                                              |
| **Command**                   | /implement (give the ticket number if asked; one ticket at a time).                                                                                                                                                                                                                                                                                                                    |
| **What you’ll see**           | A failing test, then code until it passes, then the full test run, then a commit on a working branch. The agent may ask where to put the test boundary; let it propose, then decide.                                                                                                                                                                                                   |
| **Exit check**                | Tests pass (★ Python: pytest -q prints N passed; ★ R: the testthat summary shows FAIL 0; ★ JavaScript: npm test prints \# fail 0). The site builds locally: ★ Python and R, quarto render succeeds and the new page shows in quarto preview, with the \_freeze/ output committed alongside the code; ★ JavaScript, npm start serves the site and the new page loads at localhost:8080. |
| **Likely stalls**             | The agent asks about test seams: for a page plus a function, test the function, check the page renders. A render error in a code chunk is fixed locally before moving on. Forgetting to commit \_freeze/ is not fatal — CI installs the runtime and re-executes — but it makes the deploy slower. Missing test runner cannot happen if pre-work was done.                              |
| **Edition line (★ slide 11)** | Python: “Tests: pytest.” R: “Same loop; the agent writes testthat tests and runs them with Rscript.” JavaScript: “Same loop; the agent writes node:test tests and runs them with npm test; the page is plain HTML and ES modules.”                                                                                                                                                     |

## Step 5 — /code-review → merge → deploy (12 min)

|                     |                                                                                                                                                                                                                                                                                                                                                                                                 |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **What it does**    | Reviews the diff since a fixed point on two axes — standards (the repo’s coding standards plus a code-smell baseline) and spec (does it faithfully implement the originating issue) — run as parallel sub-agents so neither pollutes the other. Implement already runs a review before each commit; this is the standalone review of the whole branch against main, followed by the ship steps. |
| **Command**         | /code-review (diff against main), then: gh pr create --fill, gh pr merge --squash --delete-branch, gh run watch, open https://\<handle\>.github.io/\<repo\>/.                                                                                                                                                                                                                                   |
| **What you’ll see** | Findings grouped by axis. Fix the ones that matter; acknowledge the rest in the PR description. After merge, the Pages workflow runs for about a minute (JavaScript and Python) to a few minutes (R, while packages install; cached after the first run).                                                                                                                                       |
| **Exit check**      | PR merged, the workflow is green, and the new page is live at the student’s URL.                                                                                                                                                                                                                                                                                                                |
| **Likely stalls**   | A finding the student does not understand: ask, do not silently accept. The Action fails: check Settings → Pages → Source is “GitHub Actions”. The page looks old: hard refresh; Pages caches for a minute.                                                                                                                                                                                     |

# 5. Demo script

The demo is the same loop students will run, on a repo created from the same template they use (acatlin/pocock-demo-python, acatlin/pocock-demo-r or acatlin/pocock-demo-js, created fresh from the template before each cohort so the loop starts from baseline). It is rehearsed against a clock; the backup captures B1–B5 come from the rehearsal. One language per session.

### Rehearsed feature

A feature that fits the 20-minute rule and exercises every step visibly. Working choice for all three editions: **“Add a page ‘By month’ that shows total rides per month as a bar chart, computed by a tested function from data/rides.csv.”** The tested function gives /implement a real red-green cycle; the page gives the deploy something to show. The presenter may substitute any feature that is one page plus one tested function. In the JavaScript edition the page is site/by-month.html plus a ridesByMonth function in site/src/stats.js with a test; in Python and R it is a new .qmd page plus a function in rides/stats.py or R/stats.R with a test.

### Demo time boxes (30 minutes)

| **Minutes** | **Step**                    | **What the room sees**                                                                      | **Hard-cut at** |
|-------------|-----------------------------|---------------------------------------------------------------------------------------------|-----------------|
| 0–2         | Setup                       | Terminal in the demo repo, claude open, FEATURE.md on screen.                               | —               |
| 2–9         | /grill-with-docs            | Prepared answers typed quickly; narrate why each answer is a judgment call.                 | 9 → B1          |
| 9–13        | /to-spec                    | Issue appears; open it in the browser; read it aloud; edit one line to show it is editable. | 13 → B2         |
| 13–16       | /to-tickets                 | Two issues with blocking links; gh issue list.                                              | 16 → B3         |
| 16–24       | /implement                  | Failing test, code, passing test, commit; quarto preview (or npm start) shows the page.     | 24 → B4         |
| 24–30       | /code-review, merge, deploy | Findings; gh pr create; gh pr merge; gh run watch; the page live.                           | 30 → B5         |

### Prepared grill answers

Fill this table during rehearsal with the questions the skill actually asked; keep it on a second screen during the live demo. Typical shape:

| **Likely question**                              | **Prepared answer**                                                                            |
|--------------------------------------------------|------------------------------------------------------------------------------------------------|
| Where does the page live in the site navigation? | Top-level nav item after Home.                                                                 |
| Month granularity and ordering?                  | Calendar months, chronological, from the CSV’s date column.                                    |
| Where does the computation live?                 | A function in the source module, returning a table of month and total; the page only plots it. |
| How do we know it works?                         | One unit test on the function against a three-row fixture; the page renders without error.     |
| Chart library?                                   | Whatever the template already uses; no new dependency.                                         |

### Capture plan

- During the final rehearsal, screenshot the terminal at the moment each exit check is met: B1 end of grill, B2 the spec issue in the browser, B3 gh issue list, B4 the passing test run plus the preview, B5 the green Action and the live page.

- Crop to the relevant lines; at least 16pt equivalent monospace once placed on a slide.

- Record the actual minutes per step; if any step ran over its demo box twice, shrink the feature, not the box.

# 6. Pre-work

Pre-work is mandatory and takes 60–90 minutes. The student-facing guide is Appendix A; it is written to be sent or printed on its own. Send it one week before the session; the self-check reply (Appendix A, step 14) is due three days before, which is what tells the presenter who will be watching rather than doing. Students who have not completed pre-work watch the lab and finish on their own afterwards.

### Message to students (paste into whatever channel the cohort uses)

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 79%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Subject</strong></td>
<td>Pre-work for the agentic SDLC lab on [DATE] — about 90 minutes, self-check due [DATE minus 3 days]</td>
</tr>
<tr class="even">
<td><strong>Body</strong></td>
<td><p>In our [DATE] session you will run Matt Pocock’s five-step agentic workflow end to end on a small website of your own, and leave with a page you specified, built, reviewed and deployed live — with Claude Code doing the typing.</p>
<p>For that to fit in two hours, the setup has to be done before we meet: install the skills, authorize GitHub from the command line, create your repo from the class template, and confirm your tests and site build. The attached guide walks every step with a verify command and the exact output to look for. Budget 60–90 minutes and do it at least three days ahead.</p>
<p>When you are done, reply with the self-check in step 14 (four pasted outputs and your one-sentence feature). If a step still fails after 15 minutes of trying, reply with the step number and the error text — do not lose an evening to it.</p>
<p>Anyone who arrives without the pre-work done will watch the lab and finish on their own afterwards; there is no time in the session to debug setups.</p>
<p>Zoom: [ZOOM LINK]</p></td>
</tr>
</tbody>
</table>

# 7. Rules

- **Time boxes are hard.** Each step slide shows its box; the presenter calls the transitions. 120 minutes is the stop regardless of where anyone is.

- **Tiny feature:** something you could hand-code in about 20 minutes. One page or one chart. If the feature sentence contains “and”, it is two features.

- **Step-1 default is /grill-with-docs.** Students are inside a repo, which is the case the skill is for. /grill-me and /wayfinder are named on slides 5 and 14 only.

- **Artifacts live on GitHub:** the spec is an issue, tickets are issues, work is a branch, shipping is a merged PR, deployment is the Pages workflow. Nothing is “done” in a local file.

- **Blocked at the pre-work check:** watch today, finish on your own later. No setup debugging in-session.

- **Mid-lab stall:** five minutes of presenter help, then the student switches to watching and finishes later. The presenter keeps a visible clock.

- **Demo hard-cut:** any demo step that overruns its box switches to the backup capture for that step.

- **Debrief deliverable:** live URL plus PR link in chat, plus one sentence on where the student stalled. The presenter keeps the links as the completion record and the stall sentences as input to the next revision of this brief.

- **Intro balance:** Pocock’s argument and the presenter’s argument get equal weight and one slide each.

- **Reserve:** six minutes, to implement first, then grill, only if needed.

# 8. Deck format rules

- **Palette:** the presenter’s teal set — deep teal \#012E36 backgrounds, teal \#028090 and mint \#02C39A accents, white body text. No other accent colors; Pocock’s chart colors are not used.

- **Count:** at most 14 main slides, plus the backup appendix (B1–B5 for the edition being built).

- **Step slides** use the single template in section 3; same positions on every one.

- **Speaker notes** on every slide, expanded from the Notes column in section 3 and the step notes in section 4.

- **Screen-share legibility:** body text 20pt minimum; terminal captures and commands 16pt monospace minimum; one command per line; no text in the bottom 8% of the slide where Zoom controls sit.

- **Step slides stay up** while students work: no builds, no animations, nothing to click through.

- **Placeholders** for \[COHORT\], \[DATE\], \[ZOOM LINK\], \[PRESENTER\] remain visible until filled; the builder does not invent values.

- **Three editions from one build:** the builder produces all three files from one source, varying only the four ★ slots.

# 9. Attribution and links

The workflow, the skill names and their behavior are Matt Pocock’s. The deck credits him on slides 3 and 14 and links to the sources below. The skills repository is MIT-licensed; the deck quotes none of its text.

| **Resource**                                           | **Link**                                             | **Used for**                                               |
|--------------------------------------------------------|------------------------------------------------------|------------------------------------------------------------|
| mattpocock/skills (repository, README, per-skill docs) | https://github.com/mattpocock/skills                 | Skill behavior, install command, setup skill, deprecations |
| AI Hero (Pocock’s articles and changelogs)             | https://www.aihero.dev                               | The intended flow, v1.1 changes, wayfinder routing         |
| Claude Code documentation                              | https://code.claude.com/docs                         | Install, permissions, /permissions rules                   |
| GitHub CLI manual                                      | https://cli.github.com/manual                        | gh auth login, gh repo create --template, PR commands      |
| Quarto: publishing to GitHub Pages                     | https://quarto.org/docs/publishing/github-pages.html | Actions workflow, freeze: auto, Pages source               |
| GitHub Pages documentation                             | https://docs.github.com/pages                        | Enabling Pages with a GitHub Actions source                |

# 10. Open questions and build notes

1.  **Rehearsed feature per edition.** Section 5 proposes “By month” bar chart; confirm or substitute after the scaffolds exist.

2.  **Setup skill output.** If /setup-matt-pocock-skills writes repository files (tracker config, label vocabulary, doc layout), commit them to the template repos so students inherit the configuration. Appendix A step 10 then becomes a verification only; decide after the first run on the template (Appendix B step 6).

3.  **Deploy mechanism.** All three templates deploy with the GitHub Pages Actions source: the workflow runs the tests, builds the site (quarto render for Python and R; nothing to build for JavaScript) and deploys with actions/deploy-pages. No gh-pages branch and no local quarto publish are involved. Quarto’s documented alternative publishes to a gh-pages branch and needs one local quarto publish gh-pages run first; it is not used here. Confirm in Appendix B step B4 that a fresh template-created repo deploys with no setting beyond Settings → Pages → Source: GitHub Actions.

4.  **Runtimes in CI.** The Python workflow installs Python and requirements.txt; the R workflow installs R and the packages listed in DESCRIPTION; both then render with execution, so a student who forgets to commit \_freeze/ gets a slower deploy rather than a failed one. freeze: auto stays on because committed \_freeze/ output makes renders and deploys faster. The JavaScript workflow needs only Node. Executed Python chunks require Jupyter and R chunks require knitr and rmarkdown; the scaffolds pin both.

5.  **Verification status (5 October 2026).** The JavaScript and Python scaffolds’ test suites were run and pass; every workflow and Quarto configuration file parses; the Python and JavaScript implementations agree on the sample data (34,405 rides). Not yet executed anywhere: the R test suite, the Quarto renders, the three Pages workflows on GitHub, and the setup skill. Appendix B steps B3–B5 cover each.

6.  **Claude plan.** Claude Code is not included in the free Claude.ai plan. Appendix A says so up front; cohorts without a paid plan or API access need a solution before pre-work is sent.

7.  **Group size above eight.** Add a minute of debrief per extra student and consider a second pair of eyes for the stall rule.

8.  **Fill-in fields** remain placeholders in all three editions until the presenter fills them for a cohort.

# Appendix A — Student pre-work guide

This appendix is written for students and can be sent or printed on its own. Every step has four parts: **Do**, **Verify**, **Expected** and **If it fails**. Work through them in order; later steps depend on earlier ones. Budget 60–90 minutes. Commands are for a terminal: Terminal on macOS, Git Bash or PowerShell on Windows, any shell on Linux. Replace \<handle\> with your GitHub username.

### Before you start

- You need a Claude account on a plan that includes Claude Code (the free Claude.ai plan does not) and a GitHub account (free is fine).

- Python students use the Python template, R students the R template, JavaScript students the JavaScript template. Where a step differs, it says **Python:**, **R:** or **JavaScript:**.

- Do this at least three days before the session and send the self-check (step 14). If a step still fails after 15 minutes, send the step number and the error text instead.

### Step 1 — Claude Code installed and signed in

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p>macOS, Linux or WSL: curl -fsSL https://claude.ai/install.sh | bash. macOS alternative: brew install --cask claude-code.</p>
<p>Windows: install Git for Windows first (git-scm.com/downloads/win), then in PowerShell: irm https://claude.ai/install.ps1 | iex.</p>
<p>Open a new terminal, run claude, and sign in when prompted.</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>claude --version and then claude doctor</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>A version number, and doctor reports no problems with the installation.</td>
</tr>
<tr class="even">
<td><strong>If it fails</strong></td>
<td>“command not found” right after installing: open a new terminal so PATH updates. Sign-in refused: your Claude plan does not include Claude Code.</td>
</tr>
</tbody>
</table>

### Step 2 — Node.js 20 or newer (needed for the skills installer and for the JavaScript edition)

|                 |                                                                                                                   |
|-----------------|-------------------------------------------------------------------------------------------------------------------|
| **Do**          | If node -v prints nothing or a version below 20, install the LTS release from nodejs.org and open a new terminal. |
| **Verify**      | node -v                                                                                                           |
| **Expected**    | v20 or higher (v22 or v24 is typical).                                                                            |
| **If it fails** | On Windows, confirm the installer added Node to PATH by opening a new PowerShell window.                          |

### Step 3 — Install Matt Pocock’s skills

|                 |                                                                                                                                                             |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | Run npx skills@latest add mattpocock/skills. The installer asks which skills to add and which agent to install them for: choose all skills and Claude Code. |
| **Verify**      | Run claude, type / and scroll the slash-command list.                                                                                                       |
| **Expected**    | You see /grill-with-docs, /to-spec, /to-tickets, /implement, /code-review and /setup-matt-pocock-skills.                                                    |
| **If it fails** | Re-run the installer and restart Claude Code. If the list is still missing them, check that a ~/.claude/skills folder now exists.                           |

### Step 4 — Git identity

|                 |                                                                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | If either command below prints nothing: git config --global user.name "Your Name" and git config --global user.email "you@example.edu". |
| **Verify**      | git config --global user.name and git config --global user.email                                                                        |
| **Expected**    | Your name and email.                                                                                                                    |
| **If it fails** | “git: command not found” means Git is not installed: macOS xcode-select --install, Windows Git for Windows, Linux your package manager. |

### Step 5 — GitHub CLI installed

|                 |                                                                                                                                                      |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | macOS: brew install gh. Windows: winget install --id GitHub.cli. Linux: follow cli.github.com for your distribution. Open a new terminal afterwards. |
| **Verify**      | gh --version                                                                                                                                         |
| **Expected**    | A version line starting gh version 2.                                                                                                                |
| **If it fails** | New terminal window; on Windows, sign out and in if PATH did not refresh.                                                                            |

### Step 6 — Authorize GitHub from the command line

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p>Run gh auth login and answer: <strong>GitHub.com</strong> → <strong>HTTPS</strong> → <strong>Yes</strong>, authenticate Git with your GitHub credentials → <strong>Login with a web browser</strong>. Copy the one-time code shown, press Enter, paste the code in the browser, and authorize.</p>
<p>Then run gh auth setup-git so git push uses the same login.</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>gh auth status</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>A line saying you are logged in to github.com as &lt;handle&gt;, with a token scope list that includes repo.</td>
</tr>
<tr class="even">
<td><strong>If it fails</strong></td>
<td>No browser available: choose “Paste an authentication token” instead and create a classic token with the repo and workflow scopes at github.com/settings/tokens. Two-factor prompts are normal; complete them.</td>
</tr>
</tbody>
</table>

### Step 7 — Create your repo from the class template

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p><strong>Python:</strong> gh repo create pocock-lab --public --clone --template acatlin/pocock-end-to-end-python</p>
<p><strong>R:</strong> gh repo create pocock-lab --public --clone --template acatlin/pocock-end-to-end-r</p>
<p><strong>JavaScript:</strong> gh repo create pocock-lab --public --clone --template acatlin/pocock-end-to-end-js</p>
<p>Then cd pocock-lab. Use a template, not a fork: forked repos have Issues switched off by default, and the workflow needs Issues.</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>gh repo view --web opens your repository in the browser.</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>The repo is under your account, is public, and shows an <strong>Issues</strong> tab.</td>
</tr>
<tr class="even">
<td><strong>If it fails</strong></td>
<td>No Issues tab: Settings → General → Features → tick Issues. Repo is private: Settings → General → Danger Zone → Change visibility to public (GitHub Pages on a free account requires a public repo).</td>
</tr>
</tbody>
</table>

### Step 8 — Turn on GitHub Pages and deploy the baseline site

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p>In the browser: Settings → Pages → Build and deployment → Source: <strong>GitHub Actions</strong>.</p>
<p>Back in the terminal, trigger a deploy: git commit --allow-empty -m "Trigger Pages" &amp;&amp; git push.</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>gh run watch (pick the run named Publish site), then open https://&lt;handle&gt;.github.io/pocock-lab/.</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>The run finishes green and the baseline site loads with the template’s home page.</td>
</tr>
<tr class="even">
<td><strong>If it fails</strong></td>
<td>Run fails at the deploy step: the Pages source is still “Deploy from a branch”; change it and re-run from the Actions tab. 404 after a green run: wait a minute and hard-refresh.</td>
</tr>
</tbody>
</table>

### Step 9 — Let Claude Code run gh, quarto and your tests without asking every time

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p>The template ships .claude/settings.json with Allow rules for gh, your test command and the routine git commands, and Deny rules for the destructive ones (force push, hard reset, rm -rf). In the repo, run claude, then /permissions to see them.</p>
<p>If a rule you need is missing, add it under Allow; your additions are saved to .claude/settings.local.json. Alternatively, choose “Yes, don’t ask again” the first time a command is requested during the lab.</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>/permissions lists the rules under Allow.</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>Rules for Bash(gh:*), your test command (★ Bash(pytest:*) / Bash(Rscript:*) / Bash(npm test:*)) and the git commands, sourced from .claude/settings.json.</td>
</tr>
<tr class="even">
<td><strong>If it fails</strong></td>
<td>An empty list means you are not inside the repo folder. Rules you add must be typed exactly, including the parentheses and :*.</td>
</tr>
</tbody>
</table>

### Step 10 — Point the skills at this repo’s issue tracker

|                 |                                                                                                                                                                                                                                                                                                                 |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | In claude, inside the repo, run /setup-matt-pocock-skills. When it asks which issue tracker to use, choose GitHub Issues for this repository; accept the defaults for labels and documentation layout. If it created or changed files, commit them: git add -A && git commit -m "Configure skills" && git push. |
| **Verify**      | gh issue create --title "setup test" --body "delete me" then gh issue close \<number\>                                                                                                                                                                                                                          |
| **Expected**    | The first command prints an issue URL; the second closes it.                                                                                                                                                                                                                                                    |
| **If it fails** | gh says not logged in: redo step 6. Permission denied creating the issue: the repo is a fork; go back to step 7.                                                                                                                                                                                                |

### Step 11 — Install the project’s dependencies and run its tests

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Python — Do</strong></td>
<td><p>Create and activate a virtual environment: python -m venv .venv, then macOS/Linux source .venv/bin/activate or Windows .venv\Scripts\activate.</p>
<p>Install: pip install -r requirements.txt</p></td>
</tr>
<tr class="even">
<td><strong>Python — Verify</strong></td>
<td>pytest -q</td>
</tr>
<tr class="odd">
<td><strong>Python — Expected</strong></td>
<td>3 passed</td>
</tr>
<tr class="even">
<td><strong>Python — If it fails</strong></td>
<td>pytest: command not found: the venv is not active. “collected 0 items”: run from the repo root.</td>
</tr>
<tr class="odd">
<td><strong>R — Do</strong></td>
<td><p>Install R 4.x from cran.r-project.org if Rscript --version fails.</p>
<p>Install packages: Rscript install.R (installs testthat, knitr, rmarkdown and the plotting package).</p></td>
</tr>
<tr class="even">
<td><strong>R — Verify</strong></td>
<td>Rscript -e 'testthat::test_dir("tests/testthat")' — from the terminal, not the RStudio Run Tests button; the agent runs tests from the shell, so this is the path that has to work.</td>
</tr>
<tr class="odd">
<td><strong>R — Expected</strong></td>
<td>A summary line showing FAIL 0 and PASS 3.</td>
</tr>
<tr class="even">
<td><strong>R — If it fails</strong></td>
<td>Rscript not recognized on Windows: add C:\Program Files\R\R-4.x.x\bin to PATH and open a new terminal. “there is no package called testthat”: Rscript install.R installed to a different library than Rscript reads; run Rscript -e '.libPaths()' and install there.</td>
</tr>
<tr class="odd">
<td><strong>JavaScript — Do</strong></td>
<td>Nothing to install: the template has no dependencies. Node 20 or newer from step 2 is all it needs.</td>
</tr>
<tr class="even">
<td><strong>JavaScript — Verify</strong></td>
<td>npm test</td>
</tr>
<tr class="odd">
<td><strong>JavaScript — Expected</strong></td>
<td>A summary ending # pass 3 and # fail 0.</td>
</tr>
<tr class="even">
<td><strong>JavaScript — If it fails</strong></td>
<td>No tests found, or an error about --test: Node is older than 20; redo step 2. “Cannot find module”: run from the repo root.</td>
</tr>
</tbody>
</table>

### Step 12 — The site builds locally (Quarto for Python and R; npm start for JavaScript)

|                 |                                                                                                                                                                                                                                                                                            |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | **Python and R:** install Quarto from quarto.org/docs/get-started (an installer for each OS) and open a new terminal. **JavaScript:** nothing to install.                                                                                                                                  |
| **Verify**      | **Python and R:** quarto --version, then in the repo quarto render. **JavaScript:** npm start, then open http://localhost:8080 in a browser; stop the server with Ctrl+C.                                                                                                                  |
| **Expected**    | **Python and R:** a version 1.x, and render ends with Output created: \_site/index.html; quarto preview shows the site in a browser (Ctrl+C to stop). **JavaScript:** the home page shows the rides table and bar chart.                                                                   |
| **If it fails** | **Python and R:** quarto check lists what is missing; Python edition: Jupyter is installed by step 11, make sure the venv is active; R edition: knitr and rmarkdown come from install.R. **JavaScript:** a blank page means the file was opened directly instead of served; use npm start. |

### Step 13 — Choose your tiny feature

|                 |                                                                                                                                                                                                                                                                                                                                             |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**          | Open FEATURE.md at the repo root and replace the placeholder with one sentence describing one page or one chart you will add to the site. The rule: you could hand-code it in about 20 minutes. If your sentence has “and” in it, it is two features; keep one. Commit: git add FEATURE.md && git commit -m "Feature sentence" && git push. |
| **Verify**      | cat FEATURE.md                                                                                                                                                                                                                                                                                                                              |
| **Expected**    | One sentence, no “and”.                                                                                                                                                                                                                                                                                                                     |
| **If it fails** | Stuck choosing: pick the simplest summary of the sample data you can imagine as a chart.                                                                                                                                                                                                                                                    |

### Step 14 — Send the self-check (due three days before the session)

|              |                                                                                                                                                                                                                                                                                |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | Reply to the pre-work message with four pasted outputs and one sentence: the output of gh auth status; the output of your test command (step 11); the output of quarto --version (Python and R) or node -v (JavaScript); your live URL from step 8; and your feature sentence. |
| **Expected** | The presenter replies within a day if anything needs fixing.                                                                                                                                                                                                                   |

# Appendix B — Instructor runbook: template and demo repos

Run once per edition before the first cohort, and steps 7–9 again before each cohort. The scaffold folders are produced after this brief is approved. Same four-part format as Appendix A.

### Repositories

| **Repo**                         | **Role**                                                                                                      | **Lifecycle**                                       |
|----------------------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| acatlin/pocock-end-to-end-python | Python template: Quarto site, sample data, tested source module, pytest, Pages workflow, FEATURE.md           | Built once; stays at baseline; marked as a template |
| acatlin/pocock-end-to-end-r      | R template: same, with testthat and install.R                                                                 | Built once; stays at baseline; marked as a template |
| acatlin/pocock-end-to-end-js     | JavaScript template: static site, ES modules, Node’s test runner, Pages workflow, FEATURE.md; no dependencies | Built once; stays at baseline; marked as a template |
| acatlin/pocock-demo-python       | Demo repo for Python cohorts, created from the template exactly as students do                                | Deleted and recreated before each cohort            |
| acatlin/pocock-demo-r            | Demo repo for R cohorts                                                                                       | Deleted and recreated before each cohort            |
| acatlin/pocock-demo-js           | Demo repo for JavaScript cohorts                                                                              | Deleted and recreated before each cohort            |

### Step B1 — Create the template repo from the scaffold

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 83%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Do</strong></td>
<td><p>Unzip the scaffold, cd pocock-end-to-end-python (or -r, or -js), then: git init &amp;&amp; git add -A &amp;&amp; git commit -m "Initial template".</p>
<p>gh repo create pocock-end-to-end-python --public --source=. --push</p></td>
</tr>
<tr class="even">
<td><strong>Verify</strong></td>
<td>gh repo view --web</td>
</tr>
<tr class="odd">
<td><strong>Expected</strong></td>
<td>Public repo under acatlin with the scaffold files and an Issues tab.</td>
</tr>
</tbody>
</table>

### Step B2 — Mark it as a template

|              |                                                                                                              |
|--------------|--------------------------------------------------------------------------------------------------------------|
| **Do**       | gh repo edit acatlin/pocock-end-to-end-python --template (or Settings → General → tick Template repository). |
| **Verify**   | Open the repo page.                                                                                          |
| **Expected** | A green **Use this template** button.                                                                        |

### Step B3 — Local environment and tests on the template

|              |                                                                                                                                        |
|--------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | Appendix A steps 11 and 12 on this folder. Python and R: after quarto render, commit the \_freeze/ folder so the first deploy is fast. |
| **Verify**   | Test command, then quarto render (Python, R) or npm start (JavaScript).                                                                |
| **Expected** | 3 passed, PASS 3 or \# pass 3, and Output created: \_site/index.html or the served home page.                                          |

### Step B4 — Pages on the template (confirms the workflow)

|              |                                                                                                                                           |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | Settings → Pages → Source: GitHub Actions; git commit --allow-empty -m "Trigger Pages" && git push.                                       |
| **Verify**   | gh run watch, then https://acatlin.github.io/pocock-end-to-end-python/                                                                    |
| **Expected** | Green run, baseline site live, with no setting changed beyond the Pages source. If anything else was needed, add it to Appendix A step 8. |

### Step B5 — Permissions and setup skill on the template

|              |                                                                                                                                                                                                                                  |
|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | Appendix A steps 9 and 10 in the template folder. Then git status.                                                                                                                                                               |
| **Verify**   | Inspect what /setup-matt-pocock-skills wrote.                                                                                                                                                                                    |
| **Expected** | If it wrote repo files, commit and push them so students inherit the tracker configuration, and reduce Appendix A step 10 to the verification commands. Keep .claude/settings.local.json out of the template; it is per-machine. |

### Step B6 — Walk Appendix A as a student

|              |                                                                                                                                                       |
|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | Create pocock-demo-python (or -r, -js) from the template with Appendix A step 7, then do steps 8–13 in that repo exactly as written, timing yourself. |
| **Verify**   | Every Expected line matched what you saw.                                                                                                             |
| **Expected** | Appendix A corrected wherever it was wrong, before it goes to students.                                                                               |

### Step B7 — Rehearse the demo

|              |                                                                                                                                                                                          |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | On a branch in the demo repo, run the full loop on the rehearsed feature with a stopwatch, using the section 5 boxes. Fill the prepared-answers table from the questions actually asked. |
| **Verify**   | Minutes per step recorded.                                                                                                                                                               |
| **Expected** | Every step inside its demo box on the second run; if not, shrink the feature.                                                                                                            |

### Step B8 — Capture the backups

|              |                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**       | On the final rehearsal, screenshot each exit-check moment per the section 5 capture plan; save as B1.png … B5.png and hand them to the deck builder. |
| **Expected** | Five captures, cropped, legible at 16pt-equivalent.                                                                                                  |

### Step B9 — Reset before each cohort

|            |                                                                                                                                                                                 |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Do**     | gh repo delete acatlin/pocock-demo-python --yes (or -r, -js), then recreate it with Appendix A steps 7–10 so the live demo starts from baseline with no issues and no branches. |
| **Verify** | gh issue list is empty; the baseline site is live.                                                                                                                              |

# Appendix C — Decision log

The decisions this brief encodes, in the order they were made, so a later revision can see what was a choice and what was a consequence.

| **\#** | **Decision**                | **Choice**                                                                                                                          |
|--------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| 1      | Document type               | Build brief for the deck                                                                                                            |
| 2      | Audience                    | Small graduate DS seminar, Claude Code users new to the skills; institution-neutral; reused across cohorts                          |
| 3      | Objective                   | Full loop in-session, ending with a live page and the PR behind it                                                                  |
| 4      | Task                        | Repo created from a class template; tiny feature = one page or one chart, 20-minute rule                                            |
| 5      | Length and format           | 114 planned / 120 stop; short intro, 30-minute live demo, students run the loop live                                                |
| 6      | Demo                        | One upfront live walkthrough with captured backup slides; one language per session                                                  |
| 7      | Pre-work                    | Mandatory, detailed, student-facing (Appendix A), with a self-check due three days before                                           |
| 8      | Step-1 default              | /grill-with-docs (students are in a repo); /grill-me is the no-repo variant                                                         |
| 9      | Artifacts                   | GitHub issues, branch, PR, Pages deployment                                                                                         |
| 10     | Debrief                     | Live URL + PR link in chat + one-sentence stall report                                                                              |
| 11     | Demo repos                  | acatlin/pocock-end-to-end-python and -r as templates; pocock-demo-\* created from them                                              |
| 12     | Intro                       | Pocock’s argument and the presenter’s argument, equal weight                                                                        |
| 13     | Blocked students            | Watch today, finish on their own later; five-minute rule mid-lab                                                                    |
| 14     | Deck rules                  | Teal palette, ≤14 slides + appendix, one step template, speaker notes, 20pt/16pt minimums                                           |
| 15     | Builder                     | Claude with the pptx skill, three editions from one outline                                                                         |
| 16     | Slide 14                    | /ask-matt as the router; /retro and /implement-spec left out                                                                        |
| 17     | Website                     | Quarto site deployed to GitHub Pages by a workflow; merge is the deploy                                                             |
| 18     | Test runners                | pytest (Python), testthat (R), Node’s built-in node:test (JavaScript); all three tracks in Appendix A                               |
| 19     | JavaScript edition (5 Oct)  | Added as the simplest edition: static site, no Quarto, no dependencies; third template and demo repo                                |
| 20     | Shipped permissions (5 Oct) | Templates carry .claude/settings.json with Allow rules for gh, the test command and routine git, and Deny rules for destructive git |
| 21     | CI runtimes (5 Oct)         | Python and R workflows install the runtime and render with execution; committed \_freeze/ is a speed-up, not a requirement          |
