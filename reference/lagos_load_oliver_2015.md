# Load depth data from Oliver et al. 2015.

Load depth data from Oliver et al. 2015.

## Usage

``` r
lagos_load_oliver_2015(fpath = NA)
```

## Format

A data frame with 50607 observations of 8 variables:

- lagoslakeid: unique identifier for each lake in LAGOS-NE. For each row
  of data in this table, the lagoslakeid identifies the focal lake for
  which other measures are calculated

- nhdid: the 'Permanent_identifier' from the NHD, but is called the
  NHDID in LAGOS-NE

- hu4id: the unique ID of the HU4 zone that the focal lake is located
  within

- lat_decimal: lattitude geographic coordinate in decimal degrees

- long_decimal: longitude geographic coordinate in decimal degrees

- area: lake area in hectares

- zmaxobs: observed maximum lake depth (meters)

- zmaxpredict: predicted maximum lake depth (meters)

## Arguments

- fpath:

  file.path optionally specify custom location of csv data file

## References

Oliver SK, Soranno PA, Fergus EC, Wagner T, Webster KE, Scott C, Winslow
LA, Downing JA, Stanley EH. 2015. LAGOS - Predicted and observed maximum
depth values for lakes in a 17-state region of the U.S. Long Term
Ecological Research Network.
doi:10.6073/pasta/f00a245fd9461529b8cd9d992d7e3a2f

## Examples

``` r
if (FALSE) { # \dontrun{
lagos_load_oliver_2015()
} # }
```
