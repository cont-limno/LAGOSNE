context("lagos_select")

test_that("lagos_select works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  dt <- readRDS("lagos_test_subset.rds")
  dt_reduced <- lagos_select(dt, table_column_nested = list("epi.nutr" = c("tp", "tn")))
  expect_equal(nrow(dt_reduced), 2)
})
