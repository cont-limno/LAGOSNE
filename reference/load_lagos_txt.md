# Load LAGOSNE data from disk

A wrapper for [`read.table`](https://rdrr.io/r/utils/read.table.html)
with a default set of parameters.

## Usage

``` r
load_lagos_txt(file_name, sep = "\t", ...)
```

## Arguments

- file_name:

  character

- sep:

  character separator (tab or comma separated values)

- ...:

  Options passed on to
  [`read.table`](https://rdrr.io/r/utils/read.table.html)

## Value

data.frame
