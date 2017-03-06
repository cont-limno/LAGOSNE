context("lagos_load")

test_that("lagos_load fails well", {
  expect_error(lagos_load("gibberish"),
    paste0("Dataset not found at: ",
    paste0(lagos_path(), "data_", "gibberish", ".rds"),
    "\n Try running the appropriate `lagos_get*` and/or `lagos_compile` commands."),
    fixed = TRUE)
})
