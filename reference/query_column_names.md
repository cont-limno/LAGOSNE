# Query column names

Return a vector of column names, given a table name and grep query
string.

## Usage

``` r
query_column_names(dt, table_name, grep_string)
```

## Arguments

- dt:

  data.frame

- table_name:

  character

- grep_string:

  character

## Examples

``` r
if (FALSE) { # \dontrun{
dt <- lagosne_load("1.087.3")
query_column_names(dt, "hu4.chag", "_dep_")
query_column_names(dt, "county.chag", "baseflowindex")
} # }
```
