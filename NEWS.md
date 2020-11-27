# LAGOSNE 2.0.2

## MAJOR IMPROVEMENTS

* Massive increase in data loading speed using the `qs` package

## BUG FIXES

* Update data documentation and `lake_info` function for LAGOS version 1.087.3

## MAINTENANCE CHANGES

* Turn off checking external URLs per CRAN policy

# LAGOSNE 2.0.1

## BUG FIXES

* Fixed critical error in date conversion for `epi_nutr` table.

# LAGOSNE 2.0.0

## MAJOR IMPROVEMENTS

* Added support for a new version of the LAGOSNE limno module `1.087.3`. A detailed breakdown of data changes are available from the [EDI data repository](https://portal.edirepository.org/nis/dataviewer?packageid=edi.101.3&entityid=d448003f31f07458f8ee59903dcc7da0)

* Added a new published LAGOSNE dataset from Collins et al. 2017

## MINOR IMPROVEMENTS

* Added documentation `seealso` cross-reference links

## BUG FIXES

* Fixed truncation of lake legacyids due to scientific notation (#96)

* Fixed excessive memory usage from caching in `lake_info` (#103)

# LAGOSNE 1.2.0

## MAJOR IMPROVEMENTS

* Major speed up on repeated calls to `lagosne_load` because results are now cached (memoized)

* Increased functionality and stability of the `lake_info` function (#92)

* Added ability to pass multiple categories to `lagosne_select` (#44)

## MINOR IMPROVEMENTS

* Include a polygon data object (`lg_extent`) representing the `LAGOSNE` footprint

* Parse dates as formatted strings rather than factors (#43)

## BUG FIXES

* Pad HUC ID codes to be fixed length (#76)

* All factor fields are now of type character (#82)

* `lake_info` now returns multiple matches to lake names (#92)

# LAGOSNE 1.1.0

## MINOR IMPROVEMENTS

* Streamline console output and avoid errors during non-interactive use (#59)

## BUG FIXES

* Switch data source URLs to enable downloads with more restrictive firewalls (#60)

# LAGOSNE 1.0.0

* Package name and functions changed to LAGOSNE
* Initial CRAN submission




