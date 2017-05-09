context("lake_info")

test_that("lake_info works", {
  dt <- readRDS("lagos_test_subset.rds")

  expect_equal(nrow(
    lake_info(dt, "Benton Pond", "Massachusetts")), 1)

})

test_that("lake_info fails well", {
  dt <- readRDS("lagos_test_subset.rds")

  expect_error(lake_info(dt, "gibberish", "Wisconsin"),
               "Lake 'gibberish' in Wisconsin not found")

})
