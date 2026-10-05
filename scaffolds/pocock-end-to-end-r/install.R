# Installs the packages this project needs. Run once: Rscript install.R
pkgs <- c("testthat", "knitr", "rmarkdown", "ggplot2")
missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0) {
  install.packages(missing, repos = "https://cloud.r-project.org")
}
cat("Installed:", paste(pkgs, collapse = ", "), "\n")
