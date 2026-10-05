# pocock-end-to-end-python

Template for the agentic SDLC lab. A Quarto website whose pages call tested
Python functions; deploys to GitHub Pages on every push to `main`.

## Commands

- Activate the environment first: `source .venv/bin/activate` (Windows: `.venv\Scripts\activate`)
- Test: `pytest -q`
- Build the site: `quarto render`; preview: `quarto preview`

## Layout

- `index.qmd` - home page; `_quarto.yml` - site config and navbar
- `rides/stats.py` - functions the pages call; computation goes here
- `tests/test_stats.py` - pytest tests; `pyproject.toml` puts the repo root on `sys.path`
- `data/rides.csv` - sample data (date, city, rides)
- `_freeze/` - Quarto's cached chunk output (committed)
- `.github/workflows/publish.yml` - installs Python and Quarto, runs tests, renders, deploys

## Conventions

- Computation lives in `rides/` and gets a test; `.qmd` chunks only call functions and display results.
- A new page is a new `.qmd` at the repo root, added to `website.navbar.left` in `_quarto.yml`.
- Python chunks run through Jupyter (`jupyter` is in `requirements.txt`); keep chunks short.
- After changing a page, run `quarto render` and commit `_freeze/` together with the code. CI installs Python and re-executes if the cache is missing, so forgetting is slow, not fatal.
- No new dependencies without a reason; pandas and matplotlib are already available.

## The lab workflow

`/grill-with-docs` -> `/to-spec` -> `/to-tickets` -> `/implement` -> `/code-review` -> PR -> merge (which deploys).
The feature being built is described in `FEATURE.md`. One ticket at a time, on a branch, small commits.
