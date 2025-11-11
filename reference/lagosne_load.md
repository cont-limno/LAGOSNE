# Load LAGOSNE data

Load LAGOSNE data from local system files

## Usage

``` r
lagosne_load(version = NULL, fpath = NA)
```

## Arguments

- version:

  character LAGOSNE database version string. Defaults to
  [`lagosne_version`](https://cont-limno.github.io/LAGOSNE/reference/lagosne_version.md)

- fpath:

  file.path optionally specify custom location of LAGOSNE rds file

## Examples

``` r
if (FALSE) { # \dontrun{
dt  <- lagosne_load("1.087.3")
} # }
```
