# LAGOSNE 1.3.0

## MAJOR IMPROVEMENTS

* Added a new published LAGOSNE dataset from Collins et al. 2017

## MINOR IMPROVEMENTS

* Added documentation seealso cross-reference links

## BUG FIXES

* Fixed truncation of lake legacyids due to scientific notation

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




