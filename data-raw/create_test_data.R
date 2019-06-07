library(dplyr)

# Create a testing dataset from compiled LAGOS database rds

dt        <- LAGOSNE::lagosne_load()

# id 2 llids with non-missing chla data in two different states
set.seed(5)
llids <- left_join(dplyr::select(dt$epi_nutr, lagoslakeid, chla),
                  dplyr::select(dt$locus, state_zoneid, lagoslakeid)) %>%
  left_join(dplyr::select(dt$state, state, state_zoneid)) %>%
  dplyr::filter(state %in% c("MA", "IA")) %>%
  dplyr::filter(!is.na(chla)) %>%
  group_by(state) %>%
  dplyr::filter(lagoslakeid %in% c(3201, 4510))

dt_subset <- purrr::map(dt, function(x){
  if("lagoslakeid" %in% names(x)){
    dplyr::filter(x,
                  lagoslakeid %in% llids$lagoslakeid) %>%
      group_by(lagoslakeid) %>%
      dplyr::sample_n(1) %>%
      ungroup() %>%
      data.frame()
  }else{
    head(x, n = 2)
  }
})

dt_subset$state    <- dplyr::filter(dt$state, state %in% llids$state)

# manually add rows for lake_info test
# dt_subset$state <- rbind(dt_subset$state,
#                          dt$state[which(dt$state$state == "MA"),])

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

dt_subset[(names(dt_subset) %in% exclude_names)] <- lapply(
  dt_subset[(names(dt_subset) %in% exclude_names)], function(x) x[0,])

saveRDS(dt_subset, "tests/testthat/lagos_test_subset.rds")
saveRDS(dt_subset, "inst/lagos_test_subset.rds")

lg_subset <- dt_subset
usethis::use_data(lg_subset, overwrite = TRUE)
