# Query LAGOSNE names

Return a vector of table names whose associated tables have columns that
grep to query.

## Usage

``` r
query_lagos_names(grep_string, scale = NA, dt = lagosne_load())
```

## Arguments

- grep_string:

  character search string to grep to table column names

- scale:

  character filter results by one of:

  - county

  - edu

  - hu4

  - hu8

  - hu12

  - state

- dt:

  data.frame output of
  [`lagosne_load`](https://cont-limno.github.io/LAGOSNE/reference/lagosne_load.md)

## Examples

``` r
if (FALSE) { # \dontrun{
query_lagos_names("_dep_")
query_lagos_names("_dep_", "hu4")
query_lagos_names("chla")
query_lagos_names("secchi")
query_lagos_names("conn")
} # }
```
