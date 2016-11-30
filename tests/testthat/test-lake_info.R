context("lake_info")

test_that("lake_info fails well", {

  dt <- readRDS("lagos_test_subset.rds")

  expect_error(LAGOS::lake_info(dt$lake.specific, "gibberish", "Wisconsin"),
               "Lake 'gibberish` not found")

})
