context("coordinates")

test_that("coordinatize works", {
  dt  <- readRDS("lagos_test_subset.rds")
  res <- coordinatize(dt$locus)

  expect_equal(nrow(res), 2)
  expect_s3_class(res, "sf")
})
