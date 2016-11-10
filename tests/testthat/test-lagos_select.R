context("lagos_select")

test_that("lagos_select works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  dt <- readRDS("lagos_test_subset.rds")

  # select only from limno
  dt_reduced <- lagos_select(dt,
                  table_column_nested = list("epi.nutr" = c("tp", "tn")))
  expect_equal(ncol(dt_reduced$epi.nutr), 2)

  # select only from geo
  dt_reduced <- lagos_select(dt, table_column_nested =
                   list("iws.lulc" = c("iws_nlcd2011_pct_95")))
  expect_equal(ncol(dt_reduced$iws.lulc), 1)

  # select individual table-columns from limno and geo
  table_columns <- list("epi.nutr" = c("tp", "tn"),
                      "iws.lulc" = c("iws_nlcd2011_pct_95"))
  dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
  expect_equal(length(dt_reduced), 2)
  expect_equal(ncol(dt_reduced$epi.nutr), 2)
  expect_equal(ncol(dt_reduced$iws.lulc), 1)

  # select from specific tables using keywords
  dt_reduced <- lagos_select(dt,
                  table_column_nested = list("epi.nutr" = "waterquality"))
  expect_equal(length(dt_reduced), 1)
  expect_equal(ncol(dt_reduced$epi.nutr), 16)

  #' # select from multiple specific tables using keywords
  #' table_columns <- list("epi.nutr" = c("waterquality"),
  #'                    "hu4.chag" = c("deposition"))
  #' dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
  #'
  #' # select based non-specific tables using keywords
  #' dt_reduced <- lagos_select(dt, scale = "HU4",
  #'                category = c("waterquality", "deposition"))
  #'
  #' # select based on inexact keywords and exact table specification
  #' table_columns <- list("epi.nutr" = c("doc", "lagoslakeid"))
  #' dt_reduced    <- lagos_select(dt, scale = "HU4", category = c("deposition"),
  #'                   table_column_nested = table_columns)


})
