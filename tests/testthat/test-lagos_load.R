context("lagos_load")

test_that("lagos_load fails well", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  expect_error(lagosne_load("gibberish"),
    paste0("Dataset not found at: ",
    paste0(lagos_path(), "data_", "gibberish", ".rds"),
    "\n Try running the `lagosne_get` command."),
    fixed = TRUE)
})

test_that("legacyids have non-scientific notation", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  lakes_limno <- lagosne_load()$lakes_limno
  expect_gt(
    nchar(lakes_limno[lakes_limno$lagoslakeid == 448,]$legacyid),
    11)# [1] "4.51733E+12"
})
