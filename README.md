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

Until the data exports have been loaded to Gigascience (or elsewhere) users must supply the path to their `limno` and `geo` data folders to the `lagos_compile` function (see example below). Eventually, users will be able to run `lagos_get` to supply `LAGOS::lagos_compile` with the flat files from GigaScience without having to deal with file paths. All data returned by `lagos_get` and `lagos_compile` is stored in the location returned by `rappdirs::user_data_dir`.

## Usage

```{r }
library(LAGOS)
```

### Compile `txt` files to `rds`

```r
lagos_compile("1.054.2", format = "rds",
  limno_folder = "~/Downloads/Version1.054.2",
  geo_folder   = "~/Downloads/LAGOS_VER1.03")
```

### Load compiled `rds` object

```r
dt <- lagos_load(version = "1.054.2", format = "rds")
```

### Select desired table-columns from `rds`

```r
table_columns <- list("epi.nutr" = c("lagoslakeid", "tp", "tn"),
                      "iws.lulc" = c("iws_lagoslakeid", "iws_nlcd2011_pct_95"))
dt_rds    <- lagos_select(dt_rds, table_column_nested = table_columns)

dt_rds    <- dplyr::left_join(dt_rds$epi.nutr, dt_rds$iws.lulc,
                  by = c("lagoslakeid" = "iws_lagoslakeid"))
```

## Legacy code-base

The legacy code-base minus the data can be obtained by running the following command in your shell:

```
git clone https://github.com/jsta/LAGOS.git 

cd LAGOS

git checkout 553b0ba3875b29257aab1aaec71d3388070bd3e5
```

## Design Philisophy

The design of the LAGOS data package will be guided by these principles:

 * **Package structure and styling will follow best practices for R-data packages.** See the [rOpenSci packaging guide](https://github.com/ropensci/onboarding/blob/master/packaging_guide.md)
 
 * **Internal code will follow a functional programming style.** See the [Motivation Section](http://adv-r.had.co.nz/Functional-programming.html#fp-motivation) of the Functional Programming chapter of the Advanced R book.

## References

[https://help.github.com/articles/distributing-large-binaries/](https://help.github.com/articles/distributing-large-binaries/)

[https://github.com/richfitz/datastorr/blob/master/vignettes/datastorr.Rmd](https://github.com/richfitz/datastorr/blob/master/vignettes/datastorr.Rmd)

[https://github.com/dfalster/baad/releases](https://github.com/dfalster/baad/releases)
