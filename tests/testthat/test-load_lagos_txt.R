# context("load_lagos_txt")
#
# test_that("load_lagos_txt is equivalent to a read.table call", {
#   skip("This test is only necessary to check backwards compatibility with
#        legacy codebase")
#   lagos.program <- read.table('lagos_program_10541.txt',
#                               header=T,
#                               sep = "\t",
#                               quote = "",
#                               dec = ".",
#                               strip.white=T,
#                               comment.char="")
#
#   expect_equal(lagos.program,
#                load_lagos_txt('lagos_program_10541.txt'))
#
#   })
