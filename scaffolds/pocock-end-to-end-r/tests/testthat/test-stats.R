source("../../R/stats.R")

sample_rides <- function() {
  data.frame(
    date = as.Date(c("2026-07-01", "2026-07-01", "2026-07-02")),
    city = c("Miami", "Boston", "Boston"),
    rides = c(10, 20, 30),
    stringsAsFactors = FALSE
  )
}

test_that("total_rides sums the rides column", {
  expect_equal(total_rides(sample_rides()), 60)
})

test_that("rides_by_city totals per city in alphabetical order", {
  out <- rides_by_city(sample_rides())
  expect_equal(out$city, c("Boston", "Miami"))
  expect_equal(out$rides, c(50, 10))
})
