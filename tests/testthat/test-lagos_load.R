context("lagos_load")

test_that("lagos_load fails well", {
  skip("until I figure out how to regexp error messages")

  expect_error(lagos_load("gibberish"), regexp = "* Try running the appropriate `lagos_get*` and/or `lagos_compile` commands.")
})
