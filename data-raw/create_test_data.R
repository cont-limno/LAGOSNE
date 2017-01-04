# Create a testing dataset from compiled LAGOS database rds

# LAGOS:::lagos_compile("1.054.1", "rds")

dt <- LAGOS::lagos_load("1.087.0")

dt_subset <- purrr::map(dt, function(x) head(x, n = 2))

# names(dt_subset)
exclude_names <- c("lakes4ha.buffer100m",
                   "lakes4ha.buffer100m.lulc",
                   "lakes4ha.buffer500m.conn",
                   "lakes4ha.buffer500m.lulc",
                   "lakes4ha.buffer500m",
                   "hu8",
                   "hu8.chag",
                   "hu8.conn",
                   "hu8.lulc",
                   "hu12",
                   "hu12.chag",
                   "hu12.conn",
                   "hu12.lulc",
                   "name",
                   "type",
                   "variables",
                   "observations",
                   "identifier",
                   "group",
                   "county",
                   "county.chag",
                   "county.conn",
                   "county.lulc")

dt_subset <- dt_subset[!(names(dt_subset) %in% exclude_names)]

saveRDS(dt_subset, "tests/testthat/lagos_test_subset.rds")
