# Connectivity Datasets

Datasets containing lake, stream, and wetland abundance and connectivity
metrics calculated at the 500m buffer (buffer500m.conn), HUC12
(hu12.conn), HUC8 (hu8.conn), HUC4 (hu4.conn), EDU (edu.conn), county
(county.conn) and state (state.conn) classifications.

## Format

Data frames with all or a subset of the following variables. Number of
observations is equal to the number of zones in each spatial
classification (see ?classifications). Wildcard options include a subset
of the LAGOSNE spatial classifications (\* = buffer500m, iws, hu12, hu8,
hu4, edu, county, state) and additional wildcards described below.

- Identifiers and Zone Metadata

  - \*\_zoneid: unique zone identifier

  - \*\_nwiexclusions: zones that are not completely covered by the
    National Wetlands Inventory

- Lake Connectivity Metrics. Lake abundance metrics are derived for all
  lakes, isolated lakes ("isolated" - no inflow or outflow streams),
  headwater lakes ("headwater" - no inflowing streams), stream drainage
  lakes ("drstream" - lakes with inflowing stream(s), with or without
  outflows, and no upstream lakes greater than 10 ha), and lake drainage
  lakes ("drlakeStream" lakes with inflowing stream(s) and at least one
  upstream lake greater than 10 ha).

  - \*\_lakes\_\*\*\_\*\*\*: all lakes that are within or intersect the
    zone boundary and are in a particular size class (\*\* = lakes4ha,
    lakes4to10ha, lakes10ha), expressed as average lake area (\*\*\* =
    agsize_ha) or count (\*\* = count)

  - \*\_lakes\_\*\*\_overlapping\_\*\*\*: all lakes that are clipped to
    the zone boundary and are in a particular size class (\*\* =
    lakes4ha, lakes4to10ha, lakes10ha), expressed as sum of lake area
    (\*\*\* = area_ha) or percent of zone area (\*\*\* = area_pct)

  - \*\_lakes\_\*\*\_contributing_area_ha: all lakes that are within or
    intersect the zone boundary, and are in a particular size class
    (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum of lake
    area

  - \*\_lakes\_\*\*\_isolated\_\*\*\*: all isolated lakes that are
    within or intersect the zone boundary, and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as
    average size in hectares (\*\*\* = avgsize_ha) or count (\*\*\* =
    count

  - \*\_lakes\_\*\*\_isolated_overlapping\_\*\*\*: all isolated lakes
    that are clipped to the zone boundary and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum
    of lake area (\*\*\* = area_ha) or percent of zone area (\*\*\* =
    area_pct)

  - \*\_lakes\_\*\*\_isolated_contributing_area_ha: all isolated lakes
    that are within or intersect the zone boundary, and are in a
    particular size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha),
    expressed as sum of lake area

  - \*\_lakes\_\*\*\_headwater\_\*\*\*: all headwater lakes that are
    within or intersect the zone boundary, and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as
    average size in hectares (\*\*\* = avgsize_ha) or count (\*\*\* =
    count

  - \*\_lakes\_\*\*\_headwater_overlapping\_\*\*\*: all headwater lakes
    that are clipped to the zone boundary and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum
    of lake area (\*\*\* = area_ha) or percent of zone area (\*\*\* =
    area_pct)

  - \*\_lakes\_\*\*\_headwater_contributing_area_ha: all headwater lakes
    that are within or intersect the zone boundary, and are in a
    particular size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha),
    expressed as sum of lake area

  - \*\_lakes\_\*\*\_drstream\_\*\*\*: all drstream lakes that are
    within or intersect the zone boundary, and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as
    average size in hectares (\*\*\* = avgsize_ha) or count (\*\*\* =
    count

  - \*\_lakes\_\*\*\_drstream_overlapping\_\*\*\*: all drstream lakes
    that are clipped to the zone boundary and are in a particular size
    class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum
    of lake area (\*\*\* = area_ha) or percent of zone area (\*\*\* =
    area_pct)

  - \*\_lakes\_\*\*\_drstream_contributing_area_ha: all drstream lakes
    that are within or intersect the zone boundary, and are in a
    particular size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha),
    expressed as sum of lake area

  - \*\_lakes\_\*\*\_drlakestream\_\*\*\*: all drlakestream lakes that
    are within or intersect the zone boundary, and are in a particular
    size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as
    average size in hectares (\*\*\* = avgsize_ha) or count (\*\*\* =
    count

  - \*\_lakes\_\*\*\_drlakestream_overlapping\_\*\*\*: all drlakestream
    lakes that are clipped to the zone boundary and are in a particular
    size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha), expressed as
    sum of lake area (\*\*\* = area_ha) or percent of zone area (\*\*\*
    = area_pct)

  - \*\_lakes\_\*\*\_drlakestream_contributing_area_ha: all drlakestream
    lakes that are within or intersect the zone boundary, and are in a
    particular size class (\*\* = lakes4ha, lakes4to10ha, lakes10ha),
    expressed as sum of lake area

  - \*\_latewisconsinglaciation_glaciation: zone glaciation status
    during the late Wisconsin glaciation (Glaciated, Not_Glaciated,
    Partially)

- Stream Connectivity Metrics

  - \*\_streamdensity_streams\_\*\*: all streams (NHDFlowline minus
    artificial lines through lakes) within the zone expressed as sum of
    length in meters (\*\* = sum_lengthm) or density in meters per
    hectare (\*\* = mperha)

  - \*\_streamdensity_headwaters\_\*: headwater streams (1st-3rd
    Strahler order) within the zone expressed as sum of length in meters
    (\*\* = sum_lengthm) or density in meters per hectare (\*\* =
    mperha)

  - \*\_streamdensity_midreaches\_\*: Midreach streams (4th-6th Strahler
    order) within the zone expressed as sum of length in meters (\*\* =
    sum_lengthm) or density in meters per hectare (\*\* = mperha)

  - \*\_streamdensity_rivers\_\*: large river-streams (\>6th Strahler
    order) within the zone expressed as sum of length in meters (\*\* =
    sum_lengthm) or density in meters per hectare (\*\* = mperha)

  - \*\_canalditchdensity\_\*\*: canals within the zone, expressed as
    sum of length in meters (\*\* = sum_lengthm) or density in meters
    per hectare (\*\* = mperha)

- Wetland Connectivity Metrics

  - \*\_wl_allwetlandsdissolved\_\*\*: all wetlands (regardless of
    vegetation, connection, or regime), expressed as average size in
    hectares (\*\* = avgsize_ha), total area of wetlands that is
    contained within or partially intersect the border of this zone
    (\*\* = overlapping_area_ha), total land area of this zone that is
    covered by all wetlands (\*\* = contributing_area_ha), or percent of
    land area of this zone that is covered by all wetlands (\*\* =
    overlapping_area_pct). Before calculating this value, contiguous
    patches of different types of wetlands were first dissolved to
    represent a single patch.

  - \*\_wl_allwetlandsundissolved\_\*\*: all wetlands (regardless of
    vegetation, connection, or regime), expressed as count (\*\* =
    count), average size in hectares (\*\* = avgsize_ha), total area of
    wetlands that is contained within or partially intersect the border
    of this zone (\*\* = overlapping_area_ha), total land area of this
    zone that is covered by all wetlands (\*\* = contributing_area_ha),
    or percent of land area of this zone that is covered by all wetlands
    (\*\* = overlapping_area_pct). Before calculating this value,
    contiguous patches of different types of wetlands were first
    dissolved to represent a single patch.

  - \*\_wl_isolatedwetlandsundissolved\_\*\*: isolated wetland patches
    (no intersecting streams within a 30 m buffer of the wetland patch)
    in this zone.all wetlands (regardless of vegetation, connection, or
    regime), expressed as count (\*\* = count), average size in hectares
    (\*\* = avgsize_ha), total area of wetlands that is contained within
    or partially intersect the border of this zone (\*\* =
    overlapping_area_ha), total land area of this zone that is covered
    by this wetland type (\*\* = contributing_area_ha), or percent of
    land area of this zone that is covered by this wetland type (\*\* =
    overlapping_area_pct). The patches were left as delineated by the
    National Wetlands Inventory ("undissolved") for calculating this
    variable.

  - \*\_wl_singlewetlandsundissolved\_\*\*: single wetland patches
    (intersected within a 30 m buffer by a single first order stream) in
    this zone, expressed as count (\*\* = count), average size in
    hectares (\*\* = avgsize_ha), total area of wetlands that is
    contained within or partially intersect the border of this zone
    (\*\* = overlapping_area_ha), total land area of this zone that is
    covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_connectedwetlandsundissolved\_\*\*: connected wetland patches
    (intersected within a 30 m buffer by a higher order stream or by
    multiple streams) in this zone, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_forestedwetlandsundissolved\_\*\*: forested wetland patches
    (dominated by woody vegetation 6m or taller) in this zone, expressed
    as count (\*\* = count), average size in hectares (\*\* =
    avgsize_ha), total area of wetlands that is contained within or
    partially intersect the border of this zone (\*\* =
    overlapping_area_ha), total land area of this zone that is covered
    by this wetland type (\*\* = contributing_area_ha), or percent of
    land area of this zone that is covered by this wetland type (\*\* =
    overlapping_area_pct). The patches were left as delineated by the
    National Wetlands Inventory ("undissolved") for calculating this
    variable.

  - \*\_wl_scrubshrubwetlandsundissolved\_\*\*: scrub-shrub wetland
    patches (dominated by woody vegetation \< 6m tall) in this zone,
    expressed as count (\*\* = count), average size in hectares (\*\* =
    avgsize_ha), total area of wetlands that is contained within or
    partially intersect the border of this zone (\*\* =
    overlapping_area_ha), total land area of this zone that is covered
    by this wetland type (\*\* = contributing_area_ha), or percent of
    land area of this zone that is covered by this wetland type (\*\* =
    overlapping_area_pct). The patches were left as delineated by the
    National Wetlands Inventory ("undissolved") for calculating this
    variable.

  - \*\_wl_openwaterwetlandsundissolved\_\*\*: open water wetland
    patches (dominated by woody vegetation \< 6m tall) in this zone,
    expressed as count (\*\* = count), average size in hectares (\*\* =
    avgsize_ha), total area of wetlands that is contained within or
    partially intersect the border of this zone (\*\* =
    overlapping_area_ha), total land area of this zone that is covered
    by this wetland type (\*\* = contributing_area_ha), or percent of
    land area of this zone that is covered by this wetland type (\*\* =
    overlapping_area_pct). The patches were left as delineated by the
    National Wetlands Inventory ("undissolved") for calculating this
    variable.

  - \*\_wl_regimefwetlandsundissolved\_\*\*: regime f (semipermanently
    flooded) wetland patches where surface water persists throughout the
    growing season in most years, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_regimegwetlandsundissolved\_\*\*: regime g (intermittently
    exposed) wetland patches where surface water persists throughout the
    growing season in most years, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha),
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_regimeawetlandsundissolved\_\*\*: regime a (temporarily
    flooded) wetland patches where surface water persists throughout the
    growing season in most years, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_regimecwetlandsundissolved\_\*\*: regime c (seasonally
    flooded) wetland patches where surface water persists throughout the
    growing season in most years, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

  - \*\_wl_regimehwetlandsundissolved\_\*\*: regime h (permanently
    flooded) wetland patches where surface water persists throughout the
    growing season in most years, expressed as count (\*\* = count),
    average size in hectares (\*\* = avgsize_ha), total area of wetlands
    that is contained within or partially intersect the border of this
    zone (\*\* = overlapping_area_ha), total land area of this zone that
    is covered by this wetland type (\*\* = contributing_area_ha), or
    percent of land area of this zone that is covered by this wetland
    type (\*\* = overlapping_area_pct). The patches were left as
    delineated by the National Wetlands Inventory ("undissolved") for
    calculating this variable.

## References

Soranno et al. (2017)
[doi:10.1093/gigascience/gix101](https://doi.org/10.1093/gigascience/gix101)
Gigascience 6:12

## See also

[`lakes.geo`](https://cont-limno.github.io/LAGOSNE/reference/lagoslakes.md)
