# Convert table names for display

Convert table names for display

## Usage

``` r
display_names(nms_raw)
```

## Arguments

- nms_raw:

  character vector of column names

## Examples

``` r
if (FALSE) { # \dontrun{
lg <- lagosne_load("1.087.3")
cbind(names(lg$iws), display_names(names(lg$iws)))
cbind(names(lg$county.chag), display_names(names(lg$county.chag)))
cbind(names(lg$county.conn), display_names(names(lg$county.conn)))
cbind(names(lg$county.lulc), display_names(names(lg$county.lulc)))
cbind(names(lg$hu4), display_names(names(lg$hu4)))
cbind(names(lg$locus), display_names(names(lg$locus)))
cbind(names(lg$epi_nutr), display_names(names(lg$epi_nutr)))
cbind(names(lg$lakes_limno), display_names(names(lg$lakes_limno)))
cbind(names(lg$lakes.geo), display_names(names(lg$lakes.geo)))
} # }
```
