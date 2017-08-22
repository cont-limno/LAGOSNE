
<!-- README.md is generated from README.Rmd. Please edit that file -->
<img src="./inst/lagos_banner2.png" width="100%" />

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active) [![Travis-CI Build Status](https://travis-ci.org/cont-limno/LAGOS.svg?branch=master)](https://travis-ci.org/cont-limno/LAGOS) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOS)](https://cran.r-project.org/package=LAGOS) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/LAGOS)](https://cran.r-project.org/package=LAGOS)

The `LAGOS` package provides an R interface to download LAGOS-NE data from remote databases, store this data locally, and perform a variety of filtering and subsetting operations.

Installation
------------

``` r
# install devtools if not found
# install.packages("devtools")
devtools::install_github("cont-limno/LAGOS", update_dependencies = TRUE)
```

### Data

The `lagos_get` function downloads the LAGOS files corresponding to the specified version from the [EDI data repository](https://portal.edirepository.org/nis/home.jsp). Files are stored in a temporary directory before being "compiled" to an `R` data format in the location returned by `rappdirs::user_data_dir()`. Data only needs to be downloaded one time per version per machine.

``` r
library(LAGOS)
lagos_get("1.087.1")
```

Usage
-----

### Load Package

``` r
library(LAGOS)
#> Welcome to LAGOS version 1.087.1. To cite LAGOS in publications use: 
#>  
#> Soranno, P.A., Bissell, E.G., Cheruvelil, K.S., Christel, S.T., Collins,
#>     S.M., Fergus, C.E., Filstrup, C.T., Lapierre, J.F., Lottig, N.R., Oliver,
#>     S.K., Scott, C.E., Smith, N.J., Stopyak, S., Yuan, S., Bremigan, M.T.,
#>     Downing, J.A., Gries, C., Henry, E.H., Skaff, N.K., Stanley, E.H.,
#>     Stow, C.A., Tan, P.N., Wagner, T. and Webster, K.E. 2015. Building a
#>     multi-scaled geospatial temporal ecology database from disparate data
#>     sources: fostering open science and data reuse. Gigascience, 4(1)
```

### Load data

The `lagos_load` function returns a named list of `data.frame` objects. Use the `names()` function to see a list of available `data.frame`s.

``` r
dt <- lagos_load(version = "1.087.1")
names(dt)
#>  [1] "county"               "county.chag"          "county.conn"         
#>  [4] "county.lulc"          "edu"                  "edu.chag"            
#>  [7] "edu.conn"             "edu.lulc"             "hu4"                 
#> [10] "hu4.chag"             "hu4.conn"             "hu4.lulc"            
#> [13] "hu8"                  "hu8.chag"             "hu8.conn"            
#> [16] "hu8.lulc"             "hu12"                 "hu12.chag"           
#> [19] "hu12.conn"            "hu12.lulc"            "iws"                 
#> [22] "iws.conn"             "iws.lulc"             "state"               
#> [25] "state.chag"           "state.conn"           "state.lulc"          
#> [28] "buffer100m"           "buffer100m.lulc"      "buffer500m"          
#> [31] "buffer500m.conn"      "buffer500m.lulc"      "lakes.geo"           
#> [34] "epi_nutr"             "lakes_limno"          "secchi"              
#> [37] "lagos_source_program" "locus"
```

#### Preview a table

``` r
head(dt$county)
#>   county_state       county_name county_ha_in_nwi county_ha county_zoneid
#> 1           CT  Fairfield County         167421.8  168044.3      County_1
#> 2           IL       Ford County         125912.3  125912.3     County_10
#> 3           IL      Stark County          74682.0   74682.0    County_100
#> 4           IL Stephenson County         146269.3  146269.3    County_101
#> 5           IL   Tazewell County         170204.0  170204.0    County_102
#> 6           IL  Vermilion County         233543.6  233543.6    County_103
#>   county_pct_in_nwi county_lat conty_long
#> 1               100   41.27225  -73.38940
#> 2               100   40.59720  -88.22340
#> 3               100   41.09336  -89.79749
#> 4               100   42.35175  -89.66246
#> 5               100   40.50731  -89.51343
#> 6               100   40.18342  -87.73293
```

#### Read table metadata

``` r
help.search("datasets", package = "LAGOS")
```

| Package | Topic           | Title                                  |
|:--------|:----------------|:---------------------------------------|
| LAGOS   | chag            | CHAG Datasets                          |
| LAGOS   | classifications | LAGOS Spatial Classifications Metadata |
| LAGOS   | conn            | Connectivity Datasets                  |
| LAGOS   | epi.nutr        | Epilimnion Water Quality Data          |
| LAGOS   | lagoslakes      | Lake Geospatial Metadata               |
| LAGOS   | lakes\_limno    | Metadata for Lakes with Water Quality  |
| LAGOS   | locus           | Metadata for all lakes &gt; 1ha        |
| LAGOS   | lulc            | Land Use Land Cover (LULC) Data Frames |
| LAGOS   | secchi          | Secchi (Water Clarity) Data            |
| LAGOS   | source          | LAGOS sources                          |

### Select data

`lagos_select` is a convenience function whose primary purpose is to provide users with the ability to select subsets of LAGOS tables that correspond to specific keywords (see `LAGOS:::keyword_partial_key()`). See [here](http://adv-r.had.co.nz/Subsetting.html) for a comprehensive tutorial on generic `data.frame` subsetting.

``` r
# specific variables
 head(lagos_select(table = "epi_nutr", vars = c("tp", "tn")))
#>   tp tn
#> 1 30 NA
#> 2 10 NA
#> 3  5 NA
#> 4  9 NA
#> 5  5 NA
#> 6 27 NA
 head(lagos_select(table = "iws.lulc", vars = c("iws_nlcd2011_pct_95")))
#>   iws_nlcd2011_pct_95
#> 1                2.77
#> 2                2.97
#> 3                0.27
#> 4                0.00
#> 5                0.00
#> 6                0.00

# categories
head(lagos_select(table = "epi_nutr", categories = "waterquality"))
#>   chla colora colort dkn doc nh4 no2 no2no3 srp tdn tdp tkn tn toc ton tp
#> 1   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA  NA  NA 30
#> 2   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA  NA  NA 10
#> 3  3.9     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  5
#> 4  4.8     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  9
#> 5  2.1     NA     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  5
#> 6  6.6     15     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA 27
#>   secchi
#> 1     NA
#> 2     NA
#> 3    6.5
#> 4    5.8
#> 5    6.1
#> 6    2.4
head(lagos_select(table = "county.chag", categories = "hydrology"))
#>   county_baseflowindex_min county_baseflowindex_max
#> 1                       45                       55
#> 2                       30                       35
#> 3                       28                       35
#> 4                       34                       66
#> 5                       22                       40
#> 6                       28                       37
#>   county_baseflowindex_mean county_baseflowindex_std
#> 1                   48.3755                   1.8683
#> 2                   32.6106                   1.4480
#> 3                   31.5548                   1.3772
#> 4                   53.1078                   4.6081
#> 5                   32.4689                   4.1342
#> 6                   34.4157                   1.1100
head(lagos_select(table = "hu4.chag", categories = "deposition")[,1:4])
#>   hu4_dep_no3_1985_min hu4_dep_no3_1985_max hu4_dep_no3_1985_mean
#> 1               7.2171              10.0448                7.9366
#> 2               9.5538              21.1791               15.5290
#> 3              15.5222              22.8936               19.6234
#> 4               8.5831              31.3832               17.2809
#> 5              15.6669              24.2653               19.0625
#> 6              12.6550              26.8946               18.1940
#>   hu4_dep_no3_1985_std
#> 1               0.3868
#> 2               2.2330
#> 3               1.3634
#> 4               3.2954
#> 5               1.5500
#> 6               1.8389

# mix of specific variables and categories
head(lagos_select(table = "epi_nutr", vars = "lagoslakeid", categories = c("waterquality")))
#>   lagoslakeid chla colora colort dkn doc nh4 no2 no2no3 srp tdn tdp tkn tn
#> 1           2   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA
#> 2           2   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA
#> 3           2  3.9     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA
#> 4           2  4.8     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA
#> 5           2  2.1     NA     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA
#> 6           3  6.6     15     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA
#>   toc ton tp secchi
#> 1  NA  NA 30     NA
#> 2  NA  NA 10     NA
#> 3  NA  NA  5    6.5
#> 4  NA  NA  9    5.8
#> 5  NA  NA  5    6.1
#> 6  NA  NA 27    2.4
```

Published LAGOS subsets
-----------------------

``` r
# Oliver et al. 2015
lagos_get_oliver_2015()
```

``` r
dt <- lagos_load_oliver_2015()
head(dt)
#>   lagoslakeid     nhdid hu4id lat_decimal long_decimal   area zmaxobs
#> 1           1  50524769   202    42.54739    -73.17425 114.95     2.7
#> 2           2 123632625   108    42.18409    -73.04728  24.87     6.1
#> 3           3  50524793   202    42.53081    -73.19155  75.41     1.8
#> 4           4 135695054   109    42.45435    -71.14079   9.26     5.2
#> 5           5 135693974   109    42.60405    -70.82267  14.00     3.4
#> 6           6 122373608   110    42.14209    -72.11992  80.29    13.7
#>   zmaxpredict
#> 1        10.6
#> 2         7.1
#> 3         8.6
#> 4         3.7
#> 5         5.4
#> 6        10.1
```

Legacy Versions
---------------

### R Package

To install versions of `LAGOS` compatible with older versions of LAGOS-NE run the following command where `ref` is set to the desired version (in the example, it is version 1.054.1):

``` r
# install devtools if not found
# install.packages("devtools")
devtools::install_github("cont-limno/LAGOS", ref = "v1.054.1")
```

### Data

Until older datasets have been made available in a public repository, LAGOS users will need to use the `lagos_compile` function (not `lagos_get`) and supply the path to their local `locus`, `limno` and `geo` data folders. Replace the paths in the example below with the path to each respective folder on your system. Most people will have access to these folders through Dropbox. For example, the `limno_folder` would be assigned to something like: `C:/Users/FWL/Dropbox/CSI_LAGOS-exports/LAGOS-NE-LIMNO-EXPORT`

``` r
library(LAGOS)
lagos_compile("1.054.1", format = "rds",
  limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
  geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
  locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT")
```

References
----------

Oliver, SK, PA Soranno, CE Fergus, T Wagner, K Webster, CE Scott, LA Winslow, J Downing, and EH Stanley. 2015. “LAGOS - Predicted and Observed Maximum Depth Values for Lakes in a 17-State Region of the U.S.” <https://dx.doi.org/10.6073/pasta/edc06bbae6db80e801b6e52253f2ea09>.

Soranno, PA, EG Bissell, KS Cheruvelil, ST Christel, SM Collins, CE Fergus, CT Filstrup, et al. 2015. “Building a Multi-Scaled Geospatial Temporal Ecology Database from Disparate Data Sources: Fostering Open Science and Data Reuse.” Gigascience 4 (1). <https://dx.doi.org/10.1186/s13742-015-0067-4>.

Stachelek, J, and SK Oliver. 2017. LAGOS: R Interface to the Lake Multi-Scaled Geospatial & Temporal Database. <https://github.com/cont-limno/LAGOS>.
