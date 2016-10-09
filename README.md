# LAGOS

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/LAGOS)](https://cran.r-project.org/package=LAGOS) 
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/LAGOS)](https://cran.r-project.org/package=LAGOS)

The `LAGOS` package provides an R interface to download LAGOS data from remote databases, store this data locally, and perform a variety of filtering and subsetting operations.

## Design Philisophy

The design of the LAGOS data package will be guided by these principles:

 * **Package structure and styling will follow best practices for R-data packages.** See the [rOpenSci packaging guide](https://github.com/ropensci/onboarding/blob/master/packaging_guide.md)
 
 * **Internal code will follow a functional programming style.** See the [Motivation Section](http://adv-r.had.co.nz/Functional-programming.html#fp-motivation) of the Functional Programming chapter of the Advanced R book.
 
## Installation

### From the Shell (In RStudio: Tools -> Shell...)

`git clone https://github.com/jsta/LAGOS.git`

`cd LAGOS`

`Rscript -e 'devtools::install()'`
 
## Usage

For development purposes, the package will assume that the raw `txt` files required to run `LAGOS:::lagos_compile` will be located in a `data-raw` folder within the repository (but not under version control) in the same structure as Dropbox. Eventually, users will be able to run `LAGOS::lagos_get` to supply `LAGOS::lagos_compile` with the flat files from GigaScience stored in the location returned by `rappdirs::user_data_dir`.

```
LAGOS
|
|
|___man
|
|___R
|
|___data-raw
    |
    |
    |___Geo
    |
    |
    |___ Limno10541

```

### Compile `txt` files to `rds`

```
LAGOS:::lagos_compile(version = "1.054.1")
```

### Load compiled `rds` object

```
dt <- LAGOS::lagos_load(version = "1.054.1")
```

### Select desired table-columns

```
table_columns <- list("iws.lulc" = c("lakeconnection"), "hu4.chag" = c("hu4_baseflowindex_min"))
dt_reduced <- LAGOS::lagos_select(dt, table_columns)
```

## Legacy code-base

The legacy code-base minus the data can be obtained by running the following command in your shell:

```
git clone https://github.com/jsta/LAGOS.git 

cd LAGOS

git checkout 553b0ba3875b29257aab1aaec71d3388070bd3e5
```

## References

[https://help.github.com/articles/distributing-large-binaries/](https://help.github.com/articles/distributing-large-binaries/)

[https://github.com/richfitz/datastorr/blob/master/vignettes/datastorr.Rmd](https://github.com/richfitz/datastorr/blob/master/vignettes/datastorr.Rmd)

[https://github.com/dfalster/baad/releases](https://github.com/dfalster/baad/releases)
