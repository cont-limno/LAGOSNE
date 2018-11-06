context("query_lagos_names")

test_that("query_lagos_names works", {

  dt <- readRDS("lagos_test_subset.rds")

  expect_equal(query_lagos_names("chla"), "epi_nutr")

  })
