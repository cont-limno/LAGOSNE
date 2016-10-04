context("load_lagos_txt")

test_that("load_lagos_txt is equivalent to a read.table call", {
  lagos.program <- read.table('../../data-raw/Limno10541/lagos_program_10541.txt',
                              header=T,
                              sep = "\t",
                              quote = "",
                              dec = ".",
                              strip.white=T,
                              comment.char="")

  expect_equal(lagos.program,
               load_lagos_txt('../../data-raw/Limno10541/lagos_program_10541.txt'))

  # epi.nutr <- read.table("../../data-raw/Limno10541/lagos_epi_nutr_10541.txt",
  #                        header = TRUE,
  #                        sep = "\t",
  #                        quote = "",
  #                        dec = ".",
  #                        strip.white = TRUE,
  #                        comment.char = "",
  #                        colClasses=c(sampledate = "POSIXct"))
  #
  # expect_equal(epi.nutr,
  #              load_lagos_txt('../../data-raw/Limno10541/lagos_epi_nutr_10541.txt', colClasses = c(sampledate = "POSIXct")))

  })
