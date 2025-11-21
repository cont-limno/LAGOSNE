context("lagos_get")

test_that("lagosne_get urls are active", {

  skip_on_cran()

  # LAGOSNE_lakeslocus101.csv
  expect_true(
    LAGOSNE:::url_exists(paste0("https://portal.edirepository.org/nis/",
      "dataviewer?packageid=edi.100.4&entityid=ce274065dfb5b453c5696f715fe4e269"))
  )
})

test_that("external download urls are active", {
  skip_on_cran()

  # collins et al. 2017
  expect_true(
    LAGOSNE:::url_exists(paste0("http://pasta.lternet.edu/package/data/eml/",
      "knb-lter-ntl/332/5/d9e3a388e566a2428a93b982a000e2c4"))
  )

  # oliver et al. 2015
  expect_true(
    LAGOSNE:::url_exists(paste0("http://pasta.lternet.edu/package/data/eml/",
      "knb-lter-ntl/320/4/4a283c25f3548c0f78d8a01658e4a353"))
  )
})
