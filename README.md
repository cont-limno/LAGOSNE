<h1 align="left">
<img width="100" src="./inst/lagos.png" alt="">
</h1>

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOS)](https://cran.r-project.org/package=LAGOS) 
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/LAGOS)](https://cran.r-project.org/package=LAGOS)

The `LAGOS` package provides an R interface to download LAGOS data from remote databases, store this data locally, and perform a variety of filtering and subsetting operations.

## Installation

### From RStudio

#### GUI

New Project -> Version Control -> Git ->

`https://github.com/jsta/LAGOS.git` -> Create Project

#### R prompt/console

`devtools::install()`
 
### Data

Until the data exports have been loaded to Gigascience (or elsewhere) users must supply the path to their `limno` and `geo` data folders to the `lagos_compile` function (see example below). Eventually, users will be able to run `lagos_get` to supply `lagos_compile` with the flat files from GigaScience without having to deal with file paths. The __output__ of `lagos_get` and `lagos_compile` is stored in the location returned by `rappdirs::user_data_dir`.

## Usage

### Load Package

```r 
library(LAGOS)
```

### Compile flat files

```r 
lagos_compile("1.054.2", format = "rds",
  limno_folder = "~/Downloads/Version1.054.2",
  geo_folder   = "~/Downloads/LAGOS_VER1.03")
```

### Load data

```r
dt <- lagos_load(version = "1.054.2", format = "rds")
```

### Select data

```r
# select specific columns from a specific table
dt_reduced <- lagos_select(dt, table_column_nested =
                 list("epi.nutr" = c("tp", "tn")))

names(dt_reduced)
head(dt_reduced$epi.nutr)

# select from specific tables using keywords (see help.search("lagos_select"))
table_columns <- list("epi.nutr" = c("waterquality"),
                    "hu4.chag" = c("deposition"))
dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)

names(dt_reduced)
head(dt_reduced$hu4.chag)
```

## Legacy code-base

The legacy code-base (minus the data) can be obtained by running the following command in your shell:

```
git clone https://github.com/jsta/LAGOS.git 

cd LAGOS

git checkout 553b0ba3875b29257aab1aaec71d3388070bd3e5
```

## References

Soranno, P.A., Bissell, E.G., Cheruvelil, K.S., Christel, S.T., Collins,
  S.M., Fergus, C.E., Filstrup, C.T., Lapierre, J.F., Lottig, N.R., Oliver,
  S.K., Scott, C.E., Smith, N.J., Stopyak, S., Yuan, S., Bremigan, M.T.,
  Downing, J.A., Gries, C., Henry, E.H., Skaff, N.K., Stanley, E.H.,
  Stow, C.A., Tan, P.N., Wagner, T. and Webster, K.E. 2015. Building a
  multi-scaled geospatial temporal ecology database from disparate data
  sources: fostering open science and data reuse. _Gigascience_, 4(1)"


