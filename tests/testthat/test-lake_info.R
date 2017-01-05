context("lake_info")

test_that("lake_info works", {
  dt <- readRDS("lagos_test_subset.rds")

  expect_equal(nrow(
    LAGOS::lake_info(dt$lake.specific, "Benton Pond", "Massachusetts")), 1)

})

test_that("lake_info fails well", {
  skip("skip for now")
  dt <- readRDS("lagos_test_subset.rds")

  expect_error(LAGOS::lake_info(dt$lake.specific, "gibberish", "Wisconsin"),
               "Lake 'gibberish` not found")

})
