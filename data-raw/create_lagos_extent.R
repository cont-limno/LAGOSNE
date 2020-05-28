library(concaveman)
library(LAGOSNE)
library(sf)

dt <- LAGOSNE::lagosne_load(lagosne_version())
dt <- coordinatize(dt$locus)

lg_extent <- concaveman(
  st_sf(st_union(st_geometry(dt))))$polygons

devtools::use_data(lg_extent, overwrite = TRUE)
