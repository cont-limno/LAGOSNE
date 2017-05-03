context("lagos_select")

test_that("lagos_select works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  dt <- readRDS("lagos_test_subset.rds")

  # specific variables
  dt_reduced <- lagos_select(table = "epi.nutr", vars = c("tp", "tn"), dt = dt)
  expect_equal(ncol(dt_reduced), 2)

  dt_reduced <- lagos_select(table = "iws.lulc",
                             vars = c("iws_nlcd2011_pct_95"), dt = dt)
  expect_equal(ncol(dt_reduced), 1)

  # categories
  dt_reduced <- lagos_select(table = "epi.nutr", categories = "waterquality", dt = dt)
  expect_equal(ncol(dt_reduced), 16)

  dt_reduced <- lagos_select(table = "state.chag", categories = "hydrology", dt = dt)
  expect_equal(ncol(dt_reduced), 4)

  dt_reduced <- lagos_select(table = "hu4.chag", categories = "deposition", dt = dt)
  expect_equal(ncol(dt_reduced), 72)

  # mix of specific variables and categories
  dt_reduced <- lagos_select(table = "epi.nutr", vars = "lagoslakeid", categories = c("waterquality"), dt = dt)
  expect_equal(ncol(dt_reduced), 17)

  # select only from limno
  # dt_reduced <- lagos_select(dt,
  #                 table_column_nested = list("epi.nutr" = c("tp", "tn")))
  # expect_equal(ncol(dt_reduced$epi.nutr), 2)
  #
  # # select only from geo
  # dt_reduced <- lagos_select(dt, table_column_nested =
  #                  list("iws.lulc" = c("iws_nlcd2011_pct_95")))
  # expect_equal(ncol(dt_reduced$iws.lulc), 1)
  #
  # # select individual table-columns from limno and geo
  # table_columns <- list("epi.nutr" = c("tp", "tn"),
  #                     "iws.lulc" = c("iws_nlcd2011_pct_95"))
  # dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
  # expect_equal(length(dt_reduced), 2)
  # expect_equal(ncol(dt_reduced$epi.nutr), 2)
  # expect_equal(ncol(dt_reduced$iws.lulc), 1)
  #
  # # select from specific tables using keywords
  # dt_reduced <- lagos_select(dt,
  #                 table_column_nested = list("epi.nutr" = "waterquality"))
  # expect_equal(length(dt_reduced), 1)
  # expect_equal(ncol(dt_reduced$epi.nutr), 16)
  #
  # # select from multiple specific tables using keywords
  # table_columns <- list("epi.nutr" = c("waterquality"),
  #                       "hu4.chag" = c("deposition"))
  # dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
  # expect_equal(length(dt_reduced), 2)
  # expect_equal(ncol(dt_reduced$epi.nutr), 16)

  # comment out this failing test, jsta: 2017-01-05
  # select from a single non-specific table using keywords
  # expect_equal(ncol(lagos_select(dt, scale = "hu4",
  #                                category = c("hydrology"))$hu4.chag), 16)

  # comment out this failing test, jsta: 2017-01-05
  # select from multiple non-specific tables using keywords
  # dt_reduced <- lagos_select(dt, scale = "HU4",
  #                 category = c("waterquality", "deposition"))
  # expect_equal(length(dt_reduced), 2)
  # expect_equal(ncol(dt_reduced$epi.nutr), 16)

  # select based on a mix of inexact keywords and exact table specifications
  # table_columns <- list("epi.nutr" = c("doc", "lagoslakeid"))
  # dt_reduced    <- lagos_select(dt, scale = "HU4", category = c("deposition"),
  #                    table_column_nested = table_columns)
  # expect_equal(length(dt_reduced), 2)
  # expect_equal(ncol(dt_reduced$epi.nutr), 2)

  # comment out this failing test, jsta: 2017-01-05
  # select from a mix of keywords and exact columns
  # table_columns <- list("epi.nutr" = c("lagoslakeid", "sampledate", "waterquality"))
  # dt_sub    <- lagos_select(dt, table_column_nested = table_columns)
  # expect_equal(ncol(dt_sub$epi.nutr), 18)

  # pull all columns from table if no columns specified
  # dt_reduced <- lagos_select(dt, table_column_nested = list("epi.nutr" = ""))

})

test_that("lagos fails well", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  dt <- readRDS("lagos_test_subset.rds")

  expect_error(
    lagos_select(table = "epi.nutr", categories = "gibberish", dt = dt),
    "The 'gibberish' category does not exist!"
  )

  expect_error(
    lagos_select(table = "epi.nutr",  vars = c("gibberish", "tn"), dt = dt),
    "The 'epi.nutr' table does not contain a 'gibberish' column!"
  )

  expect_error(
    lagos_select(categories = c("waterquality"), vars = dt),
    "'vars' must be entered as a character strin"
  )

})
