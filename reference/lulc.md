# Land Use Land Cover (LULC) Data Frames

Datasets containing information on the land use and land cover (LULC)
characteristics calculated at all LAGOSNE spatial classifications (see
?scales) from the National Land Cover Dataset (NLCD).

## Format

Data frames with all or a subset of the following variables. Number of
observations is equal to the number of zones in each spatial scale (see
Details below). Wildcard options include the 9 LAGOSNE spatial scales
(\* = buffer100m, buffer500m, iws, hu12, hu8, hu4, edu, county, state),
year of measurement (\*\* = 1992, 2001, 2006, 2011), and unit of
measurement in hectares or percent of zone area (\*\*\* = ha, pct unless
noted otherwise). Each variable is available at each scale, year, and
unit unless otherwise noted.

- \*\_nhdid (\* = buffer100m, buffer500m, iws)

- \*\_canopy2001\_\*\*\*: per pixel tree canopy percent measured 2001.
  Summary statistics include minimum, maximum, mean and standard
  deviation (\*\*\* = min, max, mean, std).

- \*\_damdensity\_\*\*\*: dams in zone. Summary statistics include a
  point count, points per hectare, and points per square kilometer
  (\*\*\* = pointcount, pointsperha, pointspersqkm)

- \*\_nlcd\*\*\_\*\*\*\_0: No data

- \*\_nlcd\*\*\_\*\*\*\_11: Open water

- \*\_nlcd1992\_\*\*\*\_21: Residential, low intensity

- \*\_nlcd\*\*\_\*\*\*\_21: Developed, open space. Note, this variable
  was not measured in 1992 (\*\* = 2001, 2006, 2011)

- \*\_nlcd1992\_\*\*\*\_22: Residential, high intensity

- \*\_nlcd\*\*\_\*\*\*\_22: Developed, low intensity. Note, this
  variable was not measured in 1992 (\*\* = 2001, 2006, 2011)

- \*\_nlcd1992\_\*\*\*\_23: Commercial/industrial/transportation

- \*\_nlcd\*\*\_\*\*\*\_23: Developed, medium intensity. Note, this
  variable was not measured in 1992 (\*\* = 2001, 2006, 2011)

- \*\_nlcd\*\*\_\*\*\*\_24: Developed, high Intensity. Note, this
  variable was not measured in 1992 (\*\* = 2001, 2006, 2011)

- \*\_nlcd\*\*\_\*\*\*\_31: Bare rock/sand/clay

- \*\_nlcd1992\_\*\*\*\_32: Quarries/strip mines/gravel pits measured in
  1992

- \*\_nlcd1992\_\*\*\*\_33: Transitional (barren) measured in 1992

- \*\_nlcd\*\*\_\*\*\*\_41: Deciduous forest

- \*\_nlcd\*\*\_\*\*\*\_42: Evergreen forest

- \*\_nlcd\*\*\_\*\*\*\_43: Mixed forest

- \*\_nlcd1992\_\*\*\*\_51: Shrubland measured in 1992.

- \*\_nlcd1992\_\*\*\*\_52: Scrub/shrub. Note, this variable not
  measured in 1992 (\*\* = 2001, 2006, 2011)

- \*\_nlcd1992\_\*\*\*\_61: Orchards/vineyards/other measured in 1992.

- \*\_nlcd\*\*\_\*\*\*\_71: Grasslands/herbaceous

- \*\_nlcd\*\*\_\*\*\*\_81: Pasture/hay

- \*\_nlcd\*\*\_\*\*\*\_82: Row crops

- \*\_nlcd1992\_\*\*\*\_83: Small grains measured in 1992.

- \*\_nlcd1992\_\*\*\*\_85: Urban/recreational grasses measured in 1992.

- \*\_nlcd\*\*\_\*\*\*\_90: Woody wetlands. Note, this variable not
  calculated in 1992 (\*\* = 2001, 2006, 2011). Equivalent code for 1992
  = 91.

- \*\_nlcd1992\_\*\*\*\_91: Woody wetlands measured in 1992. Equivalent
  code for 2001, 2006 and 2011 = 90.

- \*\_nlcd1992\_\*\*\*\_92: Emergent herbaceous wetlands measured
  in 1992. Equivalent code for 2001, 2006, and 2011 = 95.

- \*\_nlcd\*\*\_\*\*\*\_95: Emergent herbaceous wetlands. Note, this
  variable not calculated in 1992 (\*\* = 2001, 2006, 2011). Equivalent
  code for 1992 = 92.

- \*\_roaddensity\_\*\*\*: Roads within the zone, calculated as sum of
  the length in meters, or sum of the length in meters divided by area
  of zone in hectares (\*\*\* = sum_lengthm, density_mperha)

- \*\_slope\_\*\*\*: The slope at each cell is the slope with respect to
  its immediate neighbors (10m scale). Cells in zone summarized as
  either the minimum, maximum, mean, or standard deviation (\*\*\* =
  min, max, mean, std)

- \*\_tri\_\*\*\*: Terrain ruggedness index (TRI) at each cell is the
  absolute difference in meters between the elevation of the focal cell
  and its immediate neighbors (10m scale). Cells in zone summarized as
  either the minimum, maximum, mean, or standard deviation (\*\*\* =
  min, max, mean, std)

- \*\_zoneid: unique zone identifier (\* = iws, hu12, hu8, hu4, edu,
  county, state)

- lagoslakeid: unique integer identifier for focal lake

- lakeconnection: connectivity class of focal lake. Only in iws.lulc
  table.

- borderiws: whether iws zone intersects Canadian border (1 = yes, NA =
  no). Only in iws.lulc table.

## Details

Original data sources and layers from which each metric was derived can
be found in additional file 5 of Soranno et al. (2015).

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)

## See also

[`lakes.geo`](https://cont-limno.github.io/LAGOSNE/reference/lagoslakes.md)
