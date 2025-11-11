# Query column keywords

Return a vector of column names, given a table name and keyword string.

## Usage

``` r
query_column_keywords(dt, table_name, keyword_string)
```

## Arguments

- dt:

  data.frame

- table_name:

  character

- keyword_string:

  character

## Examples

``` r
if (FALSE) { # \dontrun{
dt <- lagosne_load("1.087.3")
query_column_keywords(dt, "hu12.chag", "hydrology")
} # }
```
