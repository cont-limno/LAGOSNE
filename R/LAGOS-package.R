#' R interface to the LAGOS lakes database
#' @name LAGOS-package
#' @aliases LAGOS
#' @docType package
#' @importFrom magrittr %>%
#' @title R interface to the LAGOS lakes database
#' @author \email{stachel2@msu.edu}
NULL

#' LAGOS Spatial Scale Metadata
#'
#' Data frames containing metadata for each spatial scale at which ecological context
#' data are derived in LAGOS. The spatial scales include 100m buffers (lakes4ha.buffer100m),
#' 500m buffers (lakes4ha.buffer500m), interlake watersheds (iws), hydrologic units (hu12, hu8,
#' hu4), ecological drainage units (edu), counties (county), and states (state). Each abbreviation
#' is the name of the data frame, with all or a subset of the following variables. For more information
#' about derivation of each spatial scale, see Details below or [insert supp docs] from Soranno et al. 2015.
#'
#' The nine LAGOS spatial scales were used to summarize the ecological context of each lake.
#' Ecological context themes include land use/land cover (LULC), connectivity (CONN), and
#' climate, hydrology, atmospheric deposition, and groundwater (CHAG). Not all themes
#' were derived at all scales due to scaling issues (e.g., scale of measurement larger than
#' size of zone). Briefly:
#' \itemize{
#'     \item iws: a dataframe with 51065 observations of 12 variables. The area of land
#'     that drains directly into a lake, and into all upstream-connected, permanent streams
#'     to that lake exclusive of any upstream lake watersheds for lakes ≥ 10 ha that are
#'     connected via permanent streams.  For details on how the watersheds were delineated,
#'     see additional file 8 in Soranno et al. (2015). Themes derived at the iws scale include
#'     LULC and CONN
#'     \item lakes4ha.buffer100m: a dataframe with 51065 of 3 variables. Buffers are a
#'     100 m equidistant buffer of the land that is 100 m from the lake shoreline, calculated
#'     using the ArcGIS Buffer tool. Themes derived at the 100m buffer scale include LULC.
#'     \item lakes4ha.buffer500m: a dataframe with 51065 of 3 variables. Buffers are a
#'     500 m equidistant buffer of the land that is 500 m from the lake shoreline, calculated
#'     using the ArcGIS Buffer tool. Themes derived at the 500m buffer scale include LULC and
#'     CONN.
#'     \item hu12: a dataframe with 20257 observations of 11 variables. The Watershed Boundary
#'     Dataset defines boundaries based on surface water drainage and creates nested Hydrologic
#'     Units (sometimes abbreviated and referred to as HUCs, which are hydrologic unit codes)
#'     that are georeferenced to the USGS 1:24,000 topographic base map. HUC12s are the sixth
#'     level of classificiation. HUC12s are defined along natural hydrologic breaks based
#'     on land surface and surface-water flow and they have a single flow outlet except in
#'     frontal, lake, braided-stream, or closed-basin hydrologic units. Themes derived at the
#'     HUC12 scale include LULC, CONN and CHAG.
#'     \item hu8: a data frame with 511 observations of 9 variables. HUC8s are the fourth
#'     level of classificiation. Sometimes called 'watersheds', a HUC8 is a geographic area
#'     representing part or all of a surface drainage basin, a combination of drainage
#'     basins, or a distinct hydrologic feature. Themes derived at the HUC8 scale include
#'     LULC, CONN, and CHAG.
#'     \item hu4: a data frame with 65 observations of 9 variables. HUC4s are the second level
#'     of classification, called a 'subregion'. A subregion includes the area drained by a
#'     river system, a reach of a river and its tributaries in that reach, a closed basin(s),
#'     or a group of streams forming a coastal drainage area. Themes derived at the HUC4
#'     scale include LULC, CONN, and CHAG.
#'     \item edu: a data frame with 91 observations of 10 variables. Ecological drainage units
#'     (EDUs) follow the WBD boundaries, and are of roughly similar size to HUC6s.
#'     EDUs were delineated by grouping the HUC8 watersheds based on common zoogeographic
#'     history, and physiographic and climatic characteristics. Themes derived at the EDU
#'     scale include LULC, CONN, and CHAG.
#'     \item county: a data frame with 955 observations of 8 variables. Counties (political
#'     boundary) within the 17-state region of LAGOS. Themes derived at the county scale
#'     include LULC, CONN, and CHAG.
#'     \item state: a dataframe with 17 observations of 7 variables. Themes derived at the
#'     state scale include LULC, CONN, and CHAG.
#' }
#'
#' @format Data frames with all or a subset of the following variables. Number of observations is
#' equal to the number of zones in each spatial scale (see Details below).
#' \itemize{
#'     \item *_nhdid: permanent lake-specific identifier from the National Hydrography
#'     Dataset (* = lakes4ha_buffer100m, lakes4ha_buffer500m, iws)
#'     \item *_name: text name of the zone (* = iws, hu12, hu8, hu4, county, state)
#'     \item hu*: unique zone identifier (* = 12, 8, 4)
#'     \item *_ha: area of spatial extent in hectares (* = lakes4ha_buffer100m, lakes4ha_buffer500m, hu12, hu8, hu4, edu, county)
#'     \item *_areaha: area of spatial extent in hectares (* = iws, )
#'     \item *_perimkm: perimeter of spatial extent in kilometers (* = iws, )
#'     \item *_lat: latitude of centroid of polygon in decimal degrees (NAD83) (* = iws, hu12, hu8, hu4, edu, county, state)
#'     \item *_long: longitude of centroid of polygon in decimal degrees (NAD83) (* = iws, hu12, hu8, hu4, edu, county, state)
#'     \item *_lakeareaha: lake area (ha) of focal lake within polygon (* = iws, )
#'     \item *_country: whether the polygon lies within the US ("US") or the US and Canada (US_CA) (* = hu12, edu)
#'     \item *_pct_in_usa: percent of polygon within the US boundary (* = iws, hu12, edu)
#'     \item *_ha_in_usa: area (ha) of polygon within the US boundary (* = iws, hu12, edu)
#'     \item *_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary (* = hu12, hu8, hu4, edu, county, state)
#'     \item *_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary (* = hu12, hu8, hu4, edu, county, state)
#'     \item *_zoneid: a unique identifier for each IWS in LAGOS, numbered 1:n with scale prefix (e.g., HU12_1) (* = iws, hu12, hu8, hu4, edu, county, state)
#'     \item *_lagoslakeid: LAGOS unique identifier for focal lake (* = lakes4ha_buffer100m, lakes_buffer500m, iws, )
#'     \item hu4_states: states that intersect hu4 zone polygon
#'     \item state: 2-letter state abbreviation
#'     \item county_state: state where county is located
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name iws
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
#' @aliases lakes4ha.buffer100m lakes4ha.buffer500m buffer100m buffer500m iws hu12 hu8 hu4 edu county state scale scales
NULL

#' Land Use Land Cover (LULC) Data Frames
#'
#' Datasets containing information on the land use and land cover (LULC) characteristics calculated at
#' all LAGOS spatial extents (see ?scales). the interlake watershed spatial extent.
#'
#' Original data sources and layers from which each metric was derived can be found in additional file 5 of Soranno et al. (2015).
#'
#' Note the variable descriptions above for each National Land Cover Database (NLCD)
#' code are not repeated for each year and statistic combination.
#' NLCD data come from multiple years (* = 1992, 2001, 2006, 2011) and were calculated as either the total area in hectares of coverage or percent coverage (** = ha, pct).
#'
#' @format Data frames with all or a subset of the following variables. Number of observations is
#' equal to the number of zones in each spatial scale (see Details below). Wildcard options include
#' table names of the 9 LAGOS spatial scales (* = lakes4ha.buff100m, lakes4ha.buffer500m,
#' iws, hu12, hu8, hu4, edu, county, state), year of measurement (** = 1992, 2001, 2006,
#' 2011), and unit of measurement in hectares or percent of zone area (*** = ha, pct unless
#' noted otherwise). Each variable is available at each scale, year, and unit unless
#' otherwise noted.
#' \itemize{
#'    \item *_nhdid (* = lakes4ha_buffer100m, lakes4ha_buffer500m, iws)
#'    \item *_canopy2001_***: per pixel tree canopy percent measured 2001. Summary
#'    statistics include minimum, maximum, mean and standard deviation (*** = min, max, mean,
#'    std).
#'    \item *_damdensity_***: dams in zone. Summary statistics include a point count,
#'    points per hectare, and points per square kilometer (*** = pointcount, poinsperha,
#'    pointspersqkm)
#'    \item *_nlcd**_***_0: No data
#'    \item *_nlcd**_***_11: Open water
#'    \item *_nlcd**_***_21: Residential, low intensity
#'    \item *_nlcd**_***_22: Residential, high intensity
#'    \item *_nlcd**_***_23: Commercial/industrial/transportation
#'    \item *_nlcd**_***_24: Developed, high Intensity. Note, this variable was not
#'    measured in 1992 (** = 2001, 2006, 2011)
#'    \item *_nlcd**_***_31: Bare rock/sand/clay
#'    \item *_nlcd1992_***_32: Quarries/strip mines/gravel pits measured in 1992
#'    \item *_nlcd1992_***_33: Transitional (barren) measured in 1992
#'    \item *_nlcd**_***_41: Deciduous forest
#'    \item *_nlcd**_***_42: Evergreen forest
#'    \item *_nlcd**_***_43: Mixed forest
#'    \item *_nlcd1992_***_51: Shrubland measured in 1992.
#'    \item *_nlcd1992_***_52: Scrub/shrub. Note, this variable not measured in 1992
#'    (** = 2001, 2006, 2011)
#'    \item *_nlcd1992_***_61: Orchards/vineyards/other measured in 1992.
#'    \item *_nlcd**_***_71: Grasslands/herbaceous
#'    \item *_nlcd**_***_81: Pasture/hay
#'    \item *_nlcd**_***_82: Row crops
#'    \item *_nlcd1992_***_83: Small grains measured in 1992.
#'    \item *_nlcd1992_***_85: Urban/recreational grasses measured in 1992.
#'    \item *_nlcd**_***_90: Woody wetlands. Note, this variable not calculated in 1992
#'    (** = 2001, 2006, 2011). Equivalent code for 1992 = 91.
#'    \item *_nlcd1992_***_91: Woody wetlands measured in 1992. Equivalent code for 2001,
#'    2006 and 2011 = 90.
#'    \item *_nlcd1992_***_92: Emergent herbaceous wetlands measured in 1992. Equivalent
#'    code for 2001, 2006, and 2011 = 95.
#'    \item *_nlcd**_***_95: Emergent herbaceous wetlands. Note, this variable not calculated
#'     in 1992 (** = 2001, 2006, 2011). Equivalent code for 1992 = 92.
#'    \item *_roaddensity_***: Roads within the zone, calculated as sum of the length in
#'    meters, or sum of the length in meters divided by area of zone in hectares
#'    (*** = sum_lengthm, density_mperha)
#'    \item *_slope_***: The slope at each cell is the slope with respect to its immediate
#'    neighbors (10m scale). Cells in zone summarized as either the minimum, maximum, mean,
#'    or standard deviation (*** = min, max, mean, std)
#'    \item *_tri_***: Terrain ruggedness index (TRI) at each cell in meters with repsect to
#'    its immediate neighbors (10m scale). Cells in zone summarized as either the minimum,
#'    maximum, mean, or standard deviation (*** = min, max, mean, std)
#'    \item *_zoneid: unique zone identifier
#'    \item *_lagoslakeid: unique integer identifier for each lake in LAGOS
#'    \item lakeconnection:
#'    \item borderiws:
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name iws.lulc
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}; \href{http://www.mrlc.gov/nlcd2011.php}{National Land Cover Database},
NULL

#' Epilimnion Data
#'
#' A dataset containing physical and chemical attributes of the lakes' epilimnion (surface waters).
#'
#' @format A data frame with 276588 observations and 94 variables:
#' \itemize{
#'             \item eventida10542: unique combination of programid, lakeid, and date for each sampling event in LAGOS
#'             \item lagoslakeid: unique integer identifier for each lake in LAGOS
#'             \item programname: name of the sampling/monitoring program that collected the data
#'             \item programtype: categorical description of the type of sampling/monitoring effort (Federal Agency, LTER = Long Term Ecological Research program, National Survey Program, Non-Profit Agency, State Agency, State Agency/Citizen Monitoring Program, State Agency/University/Citizen Monitoring Program, State Agency/Citizen Monitoring Program, Tribal Agency, University)
#'             \item lagosversion: current version of LAGOS that the data record belongs to
#'             \item sampledate: date at which the sample was collected, stored in date format (YYYY-MM-DD)
#'             \item chla: chlorophyll a (µg/l)
#'             \item colora: color, apparent (PCU)
#'             \item colort: color, true (PCU)
#'             \item dkn: nitrogen, dissolved Kjeldahl  (µg/l as N)
#'             \item doc: carbon, dissolved organic (µg/l as C)
#'             \item nh4: nitrogen, ammonium NH4 (µg/l as N)
#'             \item no2: nitrogen, nitrite NO2 (µg/l as N)
#'             \item no2no3: nitrogen, nitrite NO2 + nitrate NO3 nitrogen (µg/l as N)
#'             \item srp: phosphorus, soluble reactive  (µg/l as P)
#'             \item tdn: nitrogen, total dissolved (µg/l as N)
#'             \item tdp: phosphorus, total dissolved (µg/l as P)
#'             \item tkn: nitrogen, total Kjeldahl (µg/l as N)
#'             \item tn: nitrogen, total (µg/l as N)
#'             \item toc: carbon, total organic (µg/l as C)
#'             \item ton: nitrogen, total organic (µg/l as N)
#'             \item tp: phosphorus, total (µg/l as P)
#'             \item secchi: Secchi disk transparency (m)
#'             \item *_qual: data flags from the source program for each water quality parameter. For example, "chla_qual" is the variable name for the data flag for chlorophyll a observations.
#'             \item *_censorcode: identifies whether a data value is censored and the censor type for each water quality parameter. For example, "chla_censorcode" is the variable name for censor information regarding chlorophyll a observations.
#'             \item *_detectionlimit: the detection limit used by the source program for each water quality parameter. For example, "chla_detectionlimit" is the name of the variable that reports detection limits for chlorophyll a observations.
#'             \item *_labmethodname: analytical procedure, from a standards body if available for each water quality parameter. For example, "chla_labmethodname" is the variable name for lab methods associated with each chlorophyll a observation.
#'             \item chla_methodinfo: flag to indicate variable was sampled using different methods. "CHLA_UNFILTERED" means that a sample was
#'             \item nh4_methodinfo: flag to indicate variable was sampled using different methods. "DISSOLVED" means that a sample was
#'             \item secchi_methodinfo: flag to indicate variable was sampled using different methods. "SECCHI_VIEW" means that Secchi depth was measured using a viewer box, whereas "SECCHI_VIEW_UNKNOWN" reports observations where it is unclear if a Secchi viewer box was used. A secchi observation without a methodinfo code means the Secchi depth was made without the viewer box.
#'             \item sampleyear: year in which sample was collected
#'             \item samplemonth: month in which sample was collected
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name epi.nutr
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Lake Attributes
#'
#' A dataset containing attributes of lakes.
#'
#' @format A data frame with 141271 observations and 109 variables:
#' \itemize{
#'              \item lagoslakeid
#'              \item nhdid
#'              \item nhd_lat
#'              \item nhd_long
#'              \item lake_area_ha
#'              \item lake_perim_meters
#'              \item nhd_fcode
#'              \item nhd_ftype
#'              \item greatlakes
#'              \item lagosname1
#'              \item meandepth
#'              \item maxdepth
#'              \item iws_zoneid
#'              \item hu4_zoneid
#'              \item hu4_name
#'              \item hu6_zoneid
#'              \item hu6_name
#'              \item hu8_zoneid
#'              \item hu8_name
#'              \item hu12_zoneid
#'              \item hu12_name
#'              \item edu_zoneid
#'              \item edu_name
#'              \item county_zoneid
#'              \item county_name
#'              \item state_name
#'              \item state_zoneid
#'              \item hu4
#'              \item hu6
#'              \item hu12
#'              \item hu8
#'              \item iws_areaha
#'              \item iws_perimkm
#'              \item iws_pct_in_usa
#'              \item iws_ha_in_usa
#'              \item iws_pct_in_nwi
#'              \item iws_ha_in_nwi
#'              \item lakeconnectivity
#'              \item lakes4ha_upstreamlakes_upstream_lakes_4ha_count
#'              \item lakes4ha_upstreamlakes_upstream_lakes_4ha_area_ha
#'              \item lakes4ha_upstreamlakes_upstream_lakes_10ha_count
#'              \item lakes4ha_upstreamlakes_upstream_lakes_10ha_area_ha
#'              \item lakes4ha_latewisconsinglaciation_glacial
#'              \item iws_wetlands_allwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_allwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_allwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_allwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_allwetlandsundissolved_count
#'              \item iws_wetlands_isolatedwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_isolatedwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_isolatedwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_isolatedwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_isolatedwetlandsundissolved_count
#'              \item iws_wetlands_singlewetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_singlewetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_singlewetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_singlewetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_singlewetlandsundissolved_count
#'              \item iws_wetlands_connectedwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_connectedwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_connectedwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_connectedwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_connectedwetlandsundissolved_count
#'              \item iws_wetlands_forestedwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_forestedwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_forestedwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_forestedwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_forestedwetlandsundissolved_count
#'              \item iws_wetlands_scrubshrubwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_scrubshrubwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_scrubshrubwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_scrubshrubwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_scrubshrubwetlandsundissolved_count
#'              \item iws_wetlands_openwaterwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_openwaterwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_openwaterwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_openwaterwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_openwaterwetlandsundissolved_count
#'              \item iws_wetlands_regimeawetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_regimeawetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_regimeawetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_regimeawetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_regimeawetlandsundissolved_count
#'              \item iws_wetlands_regimecwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_regimecwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_regimecwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_regimecwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_regimecwetlandsundissolved_count
#'              \item iws_wetlands_regimefwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_regimefwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_regimefwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_regimefwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_regimefwetlandsundissolved_count
#'              \item iws_wetlands_regimegwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_regimegwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_regimegwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_regimegwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_regimegwetlandsundissolved_count
#'              \item iws_wetlands_regimehwetlandsundissolved_avgsize_ha
#'              \item iws_wetlands_regimehwetlandsundissolved_overlapping_area_ha
#'              \item iws_wetlands_regimehwetlandsundissolved_contributing_area_ha
#'              \item iws_wetlands_regimehwetlandsundissolved_overlapping_area_pct
#'              \item iws_wetlands_regimehwetlandsundissolved_count
#'              \item iws_wetlands_allwetlandsdissolved_avgsize_ha
#'              \item iws_wetlands_allwetlandsdissolved_overlapping_area_ha
#'              \item iws_wetlands_allwetlandsdissolved_contributing_area_ha
#'              \item iws_wetlands_allwetlandsdissolved_overlapping_area_pct
#'              \item iws_wetlands_allwetlandsdissolved_count
#'              \item iws_nwiexclusions
#'              \item samplemonth
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name lagoslakes
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL
