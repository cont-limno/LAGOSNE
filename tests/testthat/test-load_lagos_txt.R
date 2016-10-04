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

})
