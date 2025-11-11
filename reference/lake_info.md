# Get a summary of lake attribute information

Return lake attribute information from its name and state or its
lagoslakeid.

## Usage

``` r
lake_info(lagoslakeid = NA, name = NA, state = NA, dt = lagosne_load(), ...)
```

## Arguments

- lagoslakeid:

  numeric lake id

- name:

  character lake name not caps sensitive

- state:

  character state name not caps sensitive

- dt:

  list of data.frames. output of
  [`lagosne_load`](https://cont-limno.github.io/LAGOSNE/reference/lagosne_load.md).

- ...:

  arguments passed to [`agrepl`](https://rdrr.io/r/base/agrep.html) to
  fuzzy match lake name

## Examples

``` r
if (FALSE) { # \dontrun{
lake_info(lagoslakeid = 4314)
lake_info(lagoslakeid = 7441)
lake_info(lagoslakeid = 244)
lake_info(lagoslakeid = 4686)
lake_info(lagoslakeid = 8016)
lake_info(lagoslakeid = c(21864, 2317))
lake_info(lagoslakeid = c(1441))
lake_info(lagoslakeid = c(125428, 1441))
lake_info(lagoslakeid = c(4686, 8016))

# fuzzy matching to lake name
lake_info(name = "Duck Lake", state = "Michigan")
# exact matching to lake name
lake_info(name = "Duck Lake", state = "Michigan",
          max.distance = list(all = 0))

lake_info(name = "Sunapee Lake", state = "New Hampshire")
lake_info(name = c("Sunapee Lake", "Oneida Lake"),
              state = c("New Hampshire", "New York"))
} # }
```
