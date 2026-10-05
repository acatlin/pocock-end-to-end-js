# pocock-end-to-end-js

Template repository for the agentic SDLC lab, JavaScript edition. A small static
site with tested ES modules, deployed to GitHub Pages by a workflow on every push
to `main`. No framework, no bundler, no dependencies: Node 20+ is all you need.

## Setup and verify

```bash
node -v        # v20 or higher
npm test       # expected: "# pass 3"
npm start      # serves site/ at http://localhost:8080 (Ctrl+C to stop)
```

## Layout

| Path | What it is |
|---|---|
| `site/index.html`, `site/style.css` | The pages. Paths are relative so the site works under a GitHub Pages subpath. |
| `site/src/csv.js`, `site/src/stats.js` | ES modules used by the pages and by the tests. Computation lives here. |
| `site/data/rides.csv` | Sample data: daily ride counts for three cities, July-September 2026. |
| `tests/*.test.js` | Tests, run by Node's built-in test runner. |
| `scripts/serve.js` | Zero-dependency local static server. |
| `.github/workflows/publish.yml` | Runs the tests, then deploys `site/` to GitHub Pages. |
| `CLAUDE.md` | Context for Claude Code. |
| `FEATURE.md` | The one-sentence feature you will build in the lab. |

## Deploy

Settings -> Pages -> Build and deployment -> Source: **GitHub Actions**. Then
every push to `main` publishes the site at `https://<handle>.github.io/<repo>/`.

Pages has to be enabled once in every repo: the setting is not copied when you
create a repo from this template. Until it is on, the `Publish site` workflow
passes the tests and then fails at `actions/configure-pages` with "Get Pages site
failed". You can also enable it from the command line, then re-run the failed run:

```bash
gh api -X POST repos/<handle>/<repo>/pages -f build_type=workflow
gh run rerun <run-id> --failed    # find the id with: gh run list
```

## Triage labels

The `/triage` skill applies five labels, mapped in `docs/agents/triage-labels.md`.
A repo created from this template copies the files but not the labels: it starts
with GitHub's default labels, which include `wontfix` but not the other four.
Create them once in every repo:

```bash
gh label create needs-triage    --color FBCA04 --description "Maintainer needs to evaluate this issue"
gh label create needs-info      --color D876E3 --description "Waiting on reporter for more information"
gh label create ready-for-agent --color 0E8A16 --description "Fully specified, ready for an AFK agent"
gh label create ready-for-human --color 1D76DB --description "Requires human implementation"
```

## License

MIT.
