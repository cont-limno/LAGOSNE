# Select and filter LAGOSNE data

Select and filter LAGOSNE data with keyword helpers.

## Usage

``` r
lagosne_select(
  table = NULL,
  vars = NULL,
  categories = NULL,
  dt = lagosne_load(lagosne_version())
)
```

## Arguments

- table:

  character name of a dt table

- vars:

  character vector of specific column names to select from table

- categories:

  what type of variables should be kept. Note not all scale-category
  options are available. Variable categories include:

  - "waterquality" - includes all in-situ chemistry, chlorophyll, and
    water clarity measurements from the epi_nutr table.

  - "deposition" - all atmospheric deposition variables from the .chag
    tables

  - "hydrology" - baseflow, groundwater, runoff, and overland flow
    variables from the .chag tables

  - "climate" - 30-year normal precipitation and temperature variables
    from the .chag tables

  - "geology" - all surficial geology variables from the .chag tables

  - "topography" - Terrain Roughness Index and slope variables from the
    .lulc tables

  - "lulc1992" - all 1992 land use/land cover variables from the .lulc
    tables

  - "lulc2001" - all 2001 land use/land cover variables from the .lulc
    tables

  - "lulc2006" - all 2006 land use/land cover variables from the .lulc
    tables

  - "lulc2011" - all 2011 land use/land cover variables from the .lulc
    tables

  - "lakes" - all lake connectivity metrics from the .conn tables

  - "wetlands" - all wetland connectivity metrics from the .conn tables

  - "streams" - all stream/river connectivity metrics from the .conn
    tables

- dt:

  data.frame of local copy of LAGOSNE data. Can be loaded with
  [`lagosne_load`](https://cont-limno.github.io/LAGOSNE/reference/lagosne_load.md)
  and will use version as specified in
  [`lagosne_version`](https://cont-limno.github.io/LAGOSNE/reference/lagosne_version.md).

## Examples

``` r
if (FALSE) { # \dontrun{
dt <- lagosne_load("1.087.3")

# specific variables
head(lagosne_select(table = "epi_nutr", vars = c("tp", "tn")))
head(lagosne_select(table = "iws.lulc", vars = c("iws_nlcd2011_pct_95")))

# categories
head(lagosne_select(table = "epi_nutr", categories = "waterquality"))
head(lagosne_select(table = "county.chag", categories = "hydrology"))
head(lagosne_select(table = "hu4.chag", categories = "deposition"))

# mix of specific variables and categories
head(lagosne_select(table = "epi_nutr", vars = "lagoslakeid", categories = c("waterquality")))

} # }
```
