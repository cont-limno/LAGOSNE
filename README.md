
<!-- README.md is generated from README.Rmd. Please edit that file -->
<h1 align="left">
<img width="800" src="./inst/lagos_banner.png" alt="">
</h1>
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOS)](https://cran.r-project.org/package=LAGOS) [![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/LAGOS)](https://cran.r-project.org/package=LAGOS)

The `LAGOS` package provides an R interface to download LAGOS data from remote databases, store this data locally, and perform a variety of filtering and subsetting operations.

Installation
------------

### From RStudio

#### GUI

New Project -&gt; Version Control -&gt; Git -&gt;

`https://github.com/cont-limno/LAGOS.git` -&gt; Create Project

#### R prompt/console

`devtools::install()`

### Data

Until the data exports have been loaded to Gigascience (or elsewhere) users must supply the path to their `limno` and `geo` data folders to the `lagos_compile` function (see example below). Eventually, users will be able to run `lagos_get` to supply `lagos_compile` with the flat files from GigaScience without having to deal with file paths. The **output** of `lagos_get` and `lagos_compile` is stored in the location returned by `rappdirs::user_data_dir`.

### Compile flat files

``` r
library(LAGOS)
lagos_compile("1.087.1", format = "rds",
  limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
  geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
  locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT")
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

``` r
dt <- lagos_load(version = "1.087.1", format = "rds")
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
#> [31] "buffer500m.conn"      "buffer500m.lulc"      "epi.nutr"            
#> [34] "lake.specific"        "secchi"               "lagos.censor.epi"    
#> [37] "lagos.source.program" "locus"                "name"                
#> [40] "type"                 "variables"            "observations"        
#> [43] "identifier"           "group"
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

### Select data

The following section is experimental. See [here](http://adv-r.had.co.nz/Subsetting.html) for a tutorial on convential `data.frame` subsetting.

``` r

# select specific columns from a specific table
dt_sub <- lagos_select(dt, table_column_nested =
                 list("epi.nutr" = c("lagoslakeid", "sampledate", "tp", "tn")))

names(dt_sub)
#> [1] "epi.nutr"
head(dt_sub$epi.nutr)
#>   lagoslakeid sampledate tp tn
#> 1           2 1996-05-14 30 NA
#> 2           2 1996-08-07 10 NA
#> 3           2 2006-07-13  5 NA
#> 4           2 2006-08-16  9 NA
#> 5           2 2006-09-07  5 NA
#> 6           3 2002-07-17 27 NA

# select from specific tables using keywords (see help.search("lagos_select"))
table_columns <- list("epi.nutr" = c("waterquality"),
                      "hu4.chag" = c("deposition"))
dt_sub    <- lagos_select(dt, table_column_nested = table_columns)

names(dt_sub)
#> [1] "epi.nutr" "hu4.chag"
head(dt_sub$hu4.chag[,1:3])
#>   hu4_dep_no3_1985_min hu4_dep_no3_1985_max hu4_dep_no3_1985_mean
#> 1               7.2171              10.0448                7.9366
#> 2               9.5538              21.1791               15.5290
#> 3              15.5222              22.8936               19.6234
#> 4               8.5831              31.3832               17.2809
#> 5              15.6669              24.2653               19.0625
#> 6              12.6550              26.8946               18.1940
head(dt_sub$epi.nutr)
#>   chla colora colort dkn doc nh4 no2 no2no3 srp tdn tdp tkn tn toc ton tp
#> 1   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA  NA  NA 30
#> 2   NA     NA     NA  NA  NA  20  NA     20  NA  NA  NA  NA NA  NA  NA 10
#> 3  3.9     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  5
#> 4  4.8     NA     15  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  9
#> 5  2.1     NA     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA  5
#> 6  6.6     15     NA  NA  NA  NA  NA     NA  NA  NA  NA  NA NA  NA  NA 27
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

Legacy code-base
----------------

The legacy code-base (minus the data) can be obtained by running the following commands in your shell:

``` shell
git clone https://github.com/cont-limno/LAGOS.git 

cd LAGOS

git checkout 553b0ba3875b29257aab1aaec71d3388070bd3e5
```

References
----------

Soranno, P.A., Bissell, E.G., Cheruvelil, K.S., Christel, S.T., Collins, S.M., Fergus, C.E., Filstrup, C.T., Lapierre, J.F., Lottig, N.R., Oliver, S.K., Scott, C.E., Smith, N.J., Stopyak, S., Yuan, S., Bremigan, M.T., Downing, J.A., Gries, C., Henry, E.H., Skaff, N.K., Stanley, E.H., Stow, C.A., Tan, P.N., Wagner, T. and Webster, K.E. 2015. Building a multi-scaled geospatial temporal ecology database from disparate data sources: fostering open science and data reuse. *Gigascience*, 4(1)

Oliver SK, Soranno PA, Fergus CE, Wagner T, Webster K, Scott C, Winslow LA, Downing J, Stanley EH. 2015. LAGOS - Predicted and observed maximum depth values for lakes in a 17-state region of the U.S. DOI: 10.6073/pasta/edc06bbae6db80e801b6e52253f2ea09
