# LAGOS

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOS)](https://cran.r-project.org/package=LAGOS) 
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/LAGOS)](https://cran.r-project.org/package=LAGOS)

The `LAGOS` package provides an R interface to download LAGOS data from remote databases, store this data locally, and perform a variety of filtering and subsetting operations.

## Installation

### Package dependencies

`LAGOS` requires some packages not yet available from CRAN. The development versions of the `DBI` and `RSQLite` packages can be installed by running the following commands from the R console:

```r
devtools::install_github("rstats-db/DBI")
devtools::install_github("rstats-db/RSQLite")
```

To install from Github, you'll need a [development environment](https://support.rstudio.com/hc/en-us/articles/200486498-Package-Development-Prerequisites).

### From the Shell (In RStudio: Tools -> Shell...)

`git clone https://github.com/jsta/LAGOS.git`

`cd LAGOS`

`Rscript -e 'devtools::install()'`
 
## Usage

For development purposes, the package will assume that the raw `txt` files required to run `LAGOS:::lagos_compile` will be located in a `data-raw` folder within the repository (but not under version control) in the same structure as Dropbox. Eventually, users will be able to run `LAGOS::lagos_get` to supply `LAGOS::lagos_compile` with the flat files from GigaScience stored in the location returned by `rappdirs::user_data_dir`.

```
LAGOS
|
|___man
|
|___R
|
|___data-raw
    |
    |___Geo
    |
    |___ Limno10541

```

### Compile `txt` files to `rds`

```r
LAGOS:::lagos_compile(version = "1.054.1", format = "rds")
```

### Compile `txt` files to `sqlite`

```r
LAGOS:::lagos_compile(version = "1.054.1", format = "sqlite")
```

### Load compiled `rds` object

```r
dt <- LAGOS::lagos_load(version = "1.054.1")
```

### Select desired table-columns

```r
table_columns <- list("epi.nutr" = c("lagoslakeid", "tp", "tn"),
                  "iws.lulc" = c("iws_lagoslakeid", "iws_nlcd2011_pct_95"))
dt_reduced    <- LAGOS::lagos_select(dt, table_columns)
dt_reduced    <- dplyr::left_join(dt_reduced$limno_data, dt_reduced$geo_data,
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
