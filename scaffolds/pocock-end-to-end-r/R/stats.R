# Summaries of the rides data. Computation lives here; pages only display.

load_rides <- function(path = "data/rides.csv") {
  df <- read.csv(path, stringsAsFactors = FALSE)
  df$date <- as.Date(df$date)
  df
}

total_rides <- function(df) {
  sum(df$rides)
}

# Total rides per city, one row per city, sorted by city name.
rides_by_city <- function(df) {
  out <- aggregate(rides ~ city, data = df, FUN = sum)
  out <- out[order(out$city), , drop = FALSE]
  rownames(out) <- NULL
  out
}
