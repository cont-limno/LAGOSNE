# Metadata for all lakes \> 1ha

A dataset containing identifying information for all lakes \> 1ha. This
includes lake name, lake size (area and perimeter), location (lat/long),
elevation, and codes identifying zones in which the lake is located.

## Format

A data frame with 141265 observations of 17 variables:

- lagoslakeid: unique identifier for each lake in LAGOS-NE. For each row
  of data in this table, the lagoslakeid identifies the focal lake for
  which other measures are calculated

- nhdid: the 'Permanent_identifier' from the NHD, but is called the
  NHDID in LAGOS-NE

- gnis_name: lake name from the GNIS database

- nhd_lat: latitude of centroid of the NHD lake polygon in decimal
  degrees (NAD83)

- nhd_long: longitude of centroid of the NHD lake polygon in decimal
  degrees (NAD83)

- lake_area_ha: surface area (in hectares) of lake waterbody polygon
  from NHD

- lake_perim_meters: perimeter (in meters) of lake waterbody polygon
  from the NHD

- nhd_fcode: NHD five-digit integer code with feature code plus
  additional characteristics/values

- nhd_ftype: NHD three-digit integer code providing a unique identifier
  of feature type for the waterbody

- iws_zoneid: the unique ID of the IWS that is estimated for the focal
  lake in the row of data that is identified by the lagoslakeid.

- hu4_zoneid: the unique ID of the HU4 zone that the focal lake is
  located within

- hu6_zoneid: the unique ID of the HU6 zone that the focal lake is
  located within

- hu8_zoneid: the unique ID of the HU8 zone that the focal lake is
  located within

- hu12_zoneid: the unique ID of the HU12 zone that the focal lake is
  located within

- edu_zoneid: the unique ID of the EDU zone that the focal lake is
  located within

- county_zoneid: the unique ID of the county that the focal lake is
  located within

- state_zoneid: the unique ID of the state that the focal lake is
  located within

- elevation_m: the elevation of the lake centroid, in meters (referenced
  to the North American Vertical Datum of 1988 (NAVD88)) and obtained
  from the National Elevation Dataset

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)

## See also

[`lakes.geo`](https://cont-limno.github.io/LAGOSNE/reference/lagoslakes.md)
