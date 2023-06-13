context("lake_info")

test_that("lake_info works", {
  dt <- readRDS("lagos_test_subset.rds")
  # dt <- readRDS(system.file("lagos_test_subset.rds", package = "LAGOSNE"))

  expect_equal(nrow(
    lake_info(name = "Pine Lake", state = "Iowa", dt = dt)), 1)

  # not in test dataset
  # expect_equal(nrow(
  #   lake_info(dt, lagoslakeid = 6302)), 1)

})

test_that("lake_info works with the full export", {
  skip_on_cran()
  skip_on_ci()

  llids <- c("6992", "7026")
  expect_equal(nrow(
    lake_info(llids)
    ), 2)
})

test_that("lake_info works with corner cases", {
  skip_on_cran()
  skip_on_ci()

  # multiple matches
  expect_equal(nrow(
    lake_info(name = "Duck Lake", state = "Michigan",
              max.distance = list(all = 0))), 7)

})

test_that("lake_info fails well", {
  dt <- readRDS("lagos_test_subset.rds")

  expect_error(lake_info(name = "gibberish", state = "Wisconsin", dt = dt),
               "Lake 'gibberish' in Wisconsin not found")

})
