
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

`https://github.com/jsta/LAGOS.git` -&gt; Create Project

#### R prompt/console

`devtools::install()`

### Data

Until the data exports have been loaded to Gigascience (or elsewhere) users must supply the path to their `limno` and `geo` data folders to the `lagos_compile` function (see example below). Eventually, users will be able to run `lagos_get` to supply `lagos_compile` with the flat files from GigaScience without having to deal with file paths. The **output** of `lagos_get` and `lagos_compile` is stored in the location returned by `rappdirs::user_data_dir`.

Usage
-----

### Load Package

``` r
library(LAGOS)
#> Welcome to LAGOS version 1.087.0. To cite LAGOS in publications use: 
#>  
#> Soranno, P.A., Bissell, E.G., Cheruvelil, K.S., Christel, S.T., Collins,
#>     S.M., Fergus, C.E., Filstrup, C.T., Lapierre, J.F., Lottig, N.R., Oliver,
#>     S.K., Scott, C.E., Smith, N.J., Stopyak, S., Yuan, S., Bremigan, M.T.,
#>     Downing, J.A., Gries, C., Henry, E.H., Skaff, N.K., Stanley, E.H.,
#>     Stow, C.A., Tan, P.N., Wagner, T. and Webster, K.E. 2015. Building a
#>     multi-scaled geospatial temporal ecology database from disparate data
#>     sources: fostering open science and data reuse. Gigascience, 4(1)
```

### Compile flat files

``` r
lagos_compile("1.087.0", format = "rds",
  limno_folder = "~/Downloads/Version1.087.0",
  geo_folder   = "~/Downloads/LAGOS_VER1.04")
```

### Load data

``` r
dt <- lagos_load(version = "1.087.0", format = "rds")
```

### Select data

``` r
# select specific columns from a specific table
dt_sub <- lagos_select(dt, table_column_nested =
                 list("epi.nutr" = c("tp", "tn")))

names(dt_sub)
#> [1] "epi.nutr"
head(dt_sub$epi.nutr)
#>   tp tn
#> 1 30 NA
#> 2 10 NA
#> 3  5 NA
#> 4  9 NA
#> 5  5 NA
#> 6 27 NA

# select from specific tables using keywords (see help.search("lagos_select"))
table_columns <- list("epi.nutr" = c("waterquality"),
                    "hu4.chag" = c("deposition"))
dt_sub    <- lagos_select(dt, table_column_nested = table_columns)

names(dt_sub)
#> [1] "epi.nutr" "hu4.chag"
head(dt_sub$hu4.chag[,1:3])
#>   hu4_dep_no3_1985_min hu4_dep_no3_1985_max hu4_dep_no3_1985_mean
#> 1               9.3996              15.0864               11.4287
#> 2               9.8849              17.7732               13.0572
#> 3               9.0317              17.6846               11.8834
#> 4              13.1816              16.2030               14.8271
#> 5              12.8009              17.4017               14.4583
#> 6              12.0282              17.0828               14.9805
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
