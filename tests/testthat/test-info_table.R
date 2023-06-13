context("info_table")

test_that("info_table works", {
  skip_on_cran()
  skip_on_ci()

  lg <- lagosne_load("1.087.3")
  expect_s3_class(LAGOSNE:::info_table(lg), "data.frame")
})
