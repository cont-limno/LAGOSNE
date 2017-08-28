context("lagos_load")

test_that("lagos_load fails well", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  expect_error(lagos_load("gibberish"),
    paste0("Dataset not found at: ",
    paste0(lagos_path(), "data_", "gibberish", ".rds"),
    "\n Try running the appropriate `lagos_get*` and/or `lagos_compile` commands."),
    fixed = TRUE)
})
