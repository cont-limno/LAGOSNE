# Lake Geospatial Metadata

A dataset containing geospatial identifiers, upstream lake connectivity,
and wetland connectivity of all lakes in LAGOSNE \>1 hectare.

## Format

A data frame with 141271 observations and 31 variables:

- lagoslakeid: unique lake identifier in LAGOSNE

- lakes_nhdid: unique lake identifier from the National Hydrography
  Dataset (NHD)

- iws_zoneid: zone ID of interlake watershed (IWS) in which focal lake
  is located

- hu4_zoneid: zone ID of HUC4 in which focal lake is located

- hu6_zoneid: zone ID of HUC6 in which focal lake is located

- hu8_zoneid: zone ID of HUC8 in which focal lake is located

- hu12_zoneid: zone ID of HU12 in which focal lake is located

- edu_zoneid: zone ID of ecological drainage unit (EDU) in which focal
  lake is located

- county_zoneid: zone ID of county in which focal lake is located

- state_zoneid: two-letter abbreviation of state in which focal lake is
  located

- upstream_lakes_4ha_count: count of lakes \>= 4 ha upstream of the
  focal lake, connected via the NHD network of all surface flow
  connections (defined as ephemeral, intermittent, or permanent streams,
  or any other connections)

- upstream_lakes_4ha_area_ha: total area of lakes \>= 4 ha upstream of
  the focal lake, connected via the NHD network of all surface flow
  connections (defined as ephemeral, intermittent, or permanent streams,
  or any other connections)

- upstream_lakes_10ha_count: count of lakes \>= 10 ha upstream of the
  focal lake, connected via the NHD network of all surface flow
  connections (defined as ephemeral, intermittent, or permanent streams,
  or any other connections)

- upstream_lakes_10ha_area_ha: total area of lakes \>= 10ha upstream of
  the focal lake, connected via the NHD network of all surface flow
  connections (defined as ephemeral, intermittent, or permanent streams,
  or any other connections)

- latewisconsinglaciation_glacial: glaciation status during the Late
  Wisconsin glaciation, where 'Glaciated' where the whole zone was
  glaciated, 'Not_Glaciated' where the whole zone was not glaciated, and
  'Partially_Glaciated' where a part of the zone was glaciated

- wlconnections_allwetlands\_\*: the wetland polygons that intersect or
  are within 30 m buffer around a lake shoreline, measured as count,
  area (ha), or sum of shoreline length (km) that intersects or touches
  wetland polygons (\* = count, contributing_area_ha, shoreline_km).

- wlconnections_forestedwetlands_count: the forested wetland polygons
  that intersect or are within 30 m buffer around a lake shoreline,
  measured as count, area (ha), or sum of shoreline length (km) that
  intersects or touches wetland polygons (\* = count,
  contributing_area_ha, shoreline_km).

- wlconnections_scrubshrubwetlands_count: the scrub-shrub wetland
  polygons that intersect or are within 30 m buffer around a lake
  shoreline, measured as count, area (ha), or sum of shoreline length
  (km) that intersects or touches wetland polygons (\* = count,
  contributing_area_ha, shoreline_km).

- wlconnections_openwaterwetlands_count: the open water wetland polygons
  that intersect or are within 30 m buffer around a lake shoreline,
  measured as count, area (ha), or sum of shoreline length (km) that
  intersects or touches wetland polygons (\* = count,
  contributing_area_ha, shoreline_km).

- wlconnections_otherwetlands_count: the other-wetland polygons that
  intersect or are within 30 m buffer around a lake shoreline, measured
  as count, area (ha), or sum of shoreline length (km) that intersects
  or touches wetland polygons (\* = count, contributing_area_ha,
  shoreline_km).

- lakeconnection: connectivity of focal lake to upstream features
  (DR_LakeStream = drainage lake with an upstream lake, DR_Stream =
  drainage lake with upstream stream, Headwater = lake with outlet but
  no inlet, Isolated = lake with no inlets or outlets)

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)
