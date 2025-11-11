# Convert a LAGOSNE flat file into a spatial object

This function turns a data.frame into a spatial object using a
reasonable default projection.

## Usage

``` r
coordinatize(dt, latname = "nhd_lat", longname = "nhd_long", crs = 4326)
```

## Arguments

- dt:

  data.frame

- latname:

  character name of latitude column; default is "nhd_lat"

- longname:

  character name of longitude column; default is "nhd_long"

- crs:

  numeric epsg code; default is 4326 WGS84-lat-long

## Examples

``` r
if (FALSE) { # \dontrun{
dt <- lagosne_load("1.087.3")
res <- coordinatize(dt$locus)

library(maps)
map("state", xlim = c(-97.90363, -66.99892), ylim = c(34.61761, 49.41941))
plot(res$geometry, add = TRUE, pch = 19, cex = 0.05)
} # }
```
