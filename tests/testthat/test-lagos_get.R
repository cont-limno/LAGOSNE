context("lagos_get")

test_that("lagos_get works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  lagos_get()

  expect_message(lagos_get())
})

