# pocock-end-to-end-python

Template repository for the agentic SDLC lab, Python edition. A Quarto website
whose pages call tested functions in `rides/`, deployed to GitHub Pages by a
workflow on every push to `main`.

## Setup and verify

```bash
python -m venv .venv
source .venv/bin/activate          # Windows: .venv\Scripts\activate
pip install -r requirements.txt
pytest -q                          # expected: "3 passed"
quarto --version                   # 1.x (install from quarto.org/docs/get-started)
quarto render                      # expected: "Output created: _site/index.html"
quarto preview                     # opens the site in a browser; Ctrl+C to stop
```

## Layout

| Path | What it is |
|---|---|
| `index.qmd`, `_quarto.yml` | The site. New pages are new `.qmd` files added to the navbar in `_quarto.yml`. |
| `rides/stats.py` | Functions the pages call. Computation lives here and gets tests. |
| `tests/test_stats.py` | pytest tests (`pyproject.toml` puts the repo root on the path). |
| `data/rides.csv` | Sample data: daily ride counts for three cities, July-September 2026. |
| `.github/workflows/publish.yml` | Installs Python and Quarto, runs the tests, renders, deploys `_site/` to Pages. |
| `_freeze/` | Quarto's cached chunk output. Commit it after rendering; it makes deploys faster. |
| `CLAUDE.md` | Context for Claude Code. |
| `FEATURE.md` | The one-sentence feature you will build in the lab. |

## Deploy

Settings -> Pages -> Build and deployment -> Source: **GitHub Actions**. Then
every push to `main` publishes the site at `https://<handle>.github.io/<repo>/`.

## License

MIT.
