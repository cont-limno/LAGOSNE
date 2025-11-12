# Metadata for Lakes with Water Quality

A dataset containing depth and names for lakes included in the limno
module.

## Format

A data frame with observations of 8 variables:

- lagoslakeid: unique lake identifier developed for LAGOS-NE

- nhdid: the 'Permanent_identifier' from the NHD, but is called the
  NHDID in LAGOS-NE

- lagosname1: name of lake from source dataset used as the authoritative
  lake name for LAGOSNE

- meandepth: mean lake depth (meters)

- meandepthsource: source of mean depth data, see "lagos_source_program"
  for definitions

- maxdepth: maximum lake depth (meters)

- maxdepthsource: source of maximum depth data, see
  "lagos_source_program" for definitions

- legacyid: unique lake identifier from the original water quality
  source dataset, this is not standardized and each source dataset has
  its own system

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)

## See also

[`lakes.geo`](https://cont-limno.github.io/LAGOSNE/reference/lagoslakes.md)
