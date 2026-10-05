# pocock-end-to-end-r

Template for the agentic SDLC lab. A Quarto website whose pages call tested R
functions; deploys to GitHub Pages on every push to `main`.

## Commands

- Test: `Rscript -e 'testthat::test_dir("tests/testthat")'` (from the repo root)
- Build the site: `quarto render`; preview: `quarto preview`
- Install packages once: `Rscript install.R`

## Layout

- `index.qmd` - home page; `_quarto.yml` - site config and navbar
- `R/stats.R` - functions the pages call; computation goes here
- `tests/testthat/test-stats.R` - testthat tests; they `source("../../R/stats.R")` because test_dir runs inside `tests/testthat`
- `data/rides.csv` - sample data (date, city, rides)
- `install.R` - local package install; `DESCRIPTION` - the same list for GitHub Actions (not an installable package)
- `_freeze/` - Quarto's cached chunk output (committed)
- `.github/workflows/publish.yml` - installs R and Quarto, runs tests, renders, deploys

## Conventions

- Computation lives in `R/` and gets a test; `.qmd` chunks only `source()` the functions and display results.
- Base R for data work; ggplot2 for charts. Adding a package means adding it to both `install.R` and `DESCRIPTION`.
- A new page is a new `.qmd` at the repo root, added to `website.navbar.left` in `_quarto.yml`.
- R chunks run through knitr. Keep chunks short.
- After changing a page, run `quarto render` and commit `_freeze/` together with the code. CI installs R and re-executes if the cache is missing, so forgetting is slow, not fatal.

## The lab workflow

`/grill-with-docs` -> `/to-spec` -> `/to-tickets` -> `/implement` -> `/code-review` -> PR -> merge (which deploys).
The feature being built is described in `FEATURE.md`. One ticket at a time, on a branch, small commits.
