# pocock-end-to-end-r

Template repository for the agentic SDLC lab, R edition. A Quarto website whose
pages call tested functions in `R/stats.R`, deployed to GitHub Pages by a
workflow on every push to `main`.

## Setup and verify

```bash
Rscript --version                                      # R 4.x (install from cran.r-project.org)
Rscript install.R                                      # installs testthat, knitr, rmarkdown, ggplot2
Rscript -e 'testthat::test_dir("tests/testthat")'      # expected: a summary line with FAIL 0 and PASS 3
quarto --version                                       # 1.x (install from quarto.org/docs/get-started)
quarto render                                          # expected: "Output created: _site/index.html"
quarto preview                                         # opens the site in a browser; Ctrl+C to stop
```

Run the test command from a terminal, not from the RStudio "Run Tests" button:
the agent runs tests from the shell, so that is the path that has to work.

## Layout

| Path | What it is |
|---|---|
| `index.qmd`, `_quarto.yml` | The site. New pages are new `.qmd` files added to the navbar in `_quarto.yml`. |
| `R/stats.R` | Functions the pages call. Computation lives here and gets tests. |
| `tests/testthat/test-stats.R` | testthat tests; they `source()` the functions with a relative path. |
| `data/rides.csv` | Sample data: daily ride counts for three cities, July-September 2026. |
| `install.R`, `DESCRIPTION` | Package list for local install and for GitHub Actions respectively. |
| `.github/workflows/publish.yml` | Installs R and Quarto, runs the tests, renders, deploys `_site/` to Pages. |
| `_freeze/` | Quarto's cached chunk output. Commit it after rendering; it makes deploys faster. |
| `CLAUDE.md` | Context for Claude Code. |
| `FEATURE.md` | The one-sentence feature you will build in the lab. |

## Deploy

Settings -> Pages -> Build and deployment -> Source: **GitHub Actions**. Then
every push to `main` publishes the site at `https://<handle>.github.io/<repo>/`.
The R workflow takes a few minutes the first time while packages install; later
runs are cached.

## License

MIT.
