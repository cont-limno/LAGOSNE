context("display_names")

test_that("display_names works", {

  skip_on_cran()
  skip_on_ci()

  lg <- lagosne_load()

  expect_equal(display_names(names(lg$hu4))[9],
               "ID")
})
