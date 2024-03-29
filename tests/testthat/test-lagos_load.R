context("lagos_load")

test_that("lagos_load fails well", {

  skip_on_cran()
  skip_on_ci()

  expect_error(lagosne_load("gibberish"),
    paste0("Dataset not found at: ",
    paste0(lagos_path(), "data_", "gibberish", ".qs"),
    "\n Try running the `lagosne_get` command."),
    fixed = TRUE)
})

test_that("legacyids have non-scientific notation", {

  skip_on_cran()
  skip_on_ci()

  lakes_limno <- lagosne_load()$lakes_limno
  expect_gt(
    nchar(lakes_limno[lakes_limno$lagoslakeid == 448,]$legacyid),
    11)# [1] "4.51733E+12"
})

test_that("sampledate is parsed correctly", {

  skip_on_cran()
  skip_on_ci()

  epi_nutr <- lagosne_load()$epi_nutr

  expect_equal(any(!is.na(epi_nutr$sampledate)), TRUE)
})
