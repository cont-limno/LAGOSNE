#' R interface to the LAGOS lakes database
#' @name LAGOS-package
#' @aliases LAGOS
#' @docType package
#' @title R interface to the LAGOS lakes database
#' @author \email{stachel2@msu.edu}
NULL

#' Watershed Data
#'
#' A dataset containing information on the interlake watershed (IWS) characteristics for LAGOS lakes.
#' For details on how the watersheds were delineated, see additional file 8 in Soranno et al. (2015).
#'
#' @format A data frame with 51065 observations and 12 variables:
#' \itemize{
#'     \item iws_nhdid: permanent lake-specific identifier from the National Hydrography Dataset
#'     \item iws_areaha: area (ha) of IWS
#'     \item iws_perimkm: perimeter (km) of IWS
#'     \item iws_lat: latitude of centroid of IWS polygon in decimal degrees (NAD83)
#'     \item iws_long: longitude of centroid of IWS polygon in decimal degrees (NAD83)
#'     \item iws_lakeareaha: lake area (ha) of focal lake within iws polygon
#'     \item iws_pct_in_usa: percent of polygon within the US boundary
#'     \item iws_ha_in_usa: area (ha) of polygon within the US boundary
#'     \item iws_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item iws_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item iws_zoneid: a unique identifier for each IWS in LAGOS
#'     \item iws_lagoslakeid: a unique identifier for each lake in LAGOS
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name iws
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' HUC 12 Data
#'
#' A dataset containing information about the HUC 12 characteristics for LAGOS lakes.
#' For details on hydrologic units, refer to the USGS hydrologic unit code documentation.
#'
#' @format A data frame with 20257 observations of 12 variables:
#' \itemize{
#'     \item hu12: NHD HUC identifier
#'     \item hu12_name: text name of the zone
#'     \item hu12_country: zonal units identified as totally within the US ("US") or cross the US-Canada border ("US_CA")
#'     \item hu12_pct_in_us: percent of polygon within the US boundary
#'     \item hu12_zoneid: unique zone identifier
#'     \item hu12_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu12_ha: surface area (ha) of zonal polygon
#'     \item hu12_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu12_pct_in_usa: percent of polygon within the US boundary
#'     \item hu12_ha_in_usa: area (ha) of polygon within the US boundary
#'     \item hu12_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item hu12_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name hu12
#' @references \href{http://water.usgs.gov/GIS/huc.html}{USGS Hydrologic Unit Maps}
NULL

#' HUC 8 Data
#'
#' A dataset containing information about the HUC 8 characteristics for LAGOS lakes.
#' For details on hydrologic units, refer to the USGS hydrologic unit code documentation.
#'
#' @format A data frame with 511 observations of 9 variables:
#' \itemize{
#'     \item hu8_states: abbreviations of states intersecting each zonal unit
#'     \item hu8: NHD HUC identifier
#'     \item hu8_name: text name of the zone
#'     \item hu8_ha: surface area (ha) of zonal polygon
#'     \item hu8_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu8_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu8_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item hu8_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item hu8_zoneid: unique zone identifier
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name hu8
#' @references \href{http://water.usgs.gov/GIS/huc.html}{USGS Hydrologic Unit Maps}
NULL

#' HUC 4 Data
#'
#' A dataset containing information about the HUC 4 characteristics for LAGOS lakes.
#' For details on hydrologic units, refer to the USGS hydrologic unit code documentation.
#'
#' @format A data frame with 65 observations of 9 variables:
#' \itemize{
#'     \item hu4_states: abbreviations of states intersecting each zonal unit
#'     \item hu4: NHD HUC identifier
#'     \item hu4_name: text name of the zone
#'     \item hu4_ha: surface area (ha) of zonal polygon
#'     \item hu4_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu4_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item hu4_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item hu4_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item hu4_zoneid: unique zone identifier
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name hu4
#' @references \href{http://water.usgs.gov/GIS/huc.html}{USGS Hydrologic Unit Maps}
NULL

#' County Data
#'
#' A dataset containing information about county characteristics for LAGOS lakes.
#' For details on zone delineations, see additional file 7 in Soranno et al. (2015).
#'
#' @format A data frame with 955 observations of 8 variables:
#' \itemize{
#'     \item county_state: abbreviation of state corresponding to the county
#'     \item county_name: text name of the zone
#'     \item county_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item county_ha: surface area (ha) of polygon
#'     \item county_zoneid: unique zone identifier
#'     \item county_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item county_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item county_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name county
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Ecological Drainage Unit Data
#'
#' A dataset containing information about ecological drainage unit (EDU) characteristics for LAGOS lakes.
#' For details on zone delineations, see additional file 7 in Soranno et al. (2015).
#'
#' @format A data frame with 91 observations of 10 variables:
#' \itemize{
#'     \item csi_edu: text name of the zone
#'     \item edu_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item edu_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item edu_country: zonal units identified as totally within the US ("US") or cross the US-Canada border ("US_CA")
#'     \item edu_zoneid: unique zone identifier
#'     \item edu_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item edu_ha: surface area (ha) of polygon
#'     \item edu_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item edu_pct_in_usa: percent of polygon within the US boundary
#'     \item edu_ha_in_usa: area (ha) of polygon within the US boundary
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name edu
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' State Data
#'
#' A dataset containing information about state characteristics for LAGOS lakes.
#' For details on zone delineations, see additional file 7 in Soranno et al. (2015).
#'
#' @format A data frame with 17 observations of 7 variables:
#' \itemize{
#'     \item state: abbreviation of state name
#'     \item state_name: text name of state
#'     \item state_zoneid: unique zone identifier
#'     \item state_lat: latitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item state_long: longitude of centroid of each polygon in decimal degrees (NAD83)
#'     \item state_pct_in_nwi: percent of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     \item state_ha_in_nwi: area (ha) of polygon within the USFWS National Wetland Inventory (NWI) boundary
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name state
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Watershed LULC Data
#'
#' A dataset containing information on the land use and land cover (LULC) characteristics calculated at the interlake watershed spatial extent.
#' For details on how the watersheds were delineated, see additional file 8 in Soranno et al. (2015).
#' Original data sources and layers from which each metric was derived can be found in additional file 5 of Soranno et al. (2015).
#'
#' Note the variable descriptions below for each National Land Cover Database (NLCD)
#' code are not repeated for each year and statistic combination.
#' NLCD data come from multiple years (* = 1992, 2001, 2006 and 2011) and were calculated as either the total area in hectares of coverage or percent coverage (** = ha, pct).
#'
#' @format A data frame with 51065 observations of 158 variables:
#' \itemize{
#'    \item iws_nhdid
#'    \item iws_canopy2001_*: per pixel tree canopy percent for zone, 2001. Summary statistics include minimum, maximum, mean and standard deviation (* = min, max, mean, std).
#'    \item iws_damdensity_*: dams in zone. Summary statistics include a point count, points per hectare, and points per square kilometer (* = pointcount, poinsperha, pointspersqkm)
#'    \item iws_nlcd*_**_0: No data
#'    \item iws_nlcd*_**_11: Open water
#'    \item iws_nlcd*_**_21: Residential, low intensity
#'    \item iws_nlcd*_**_22: Residential, high intensity
#'    \item iws_nlcd*_**_23: Commercial/industrial/transportation
#'    \item iws_nlcd*_**_24: Developed, high Intensity. Note, this variable was not calculated in 1992 (* = 2001, 2006, 2011)
#'    \item iws_nlcd*_**_31: Bare rock/sand/clay
#'    \item iws_nlcd1992_**_32: Quarries/strip mines/gravel pits. Note, this variable only calculated in 1992.
#'    \item iws_nlcd1992_**_33: Transitional (barren). Note, this variable only calculated in 1992.
#'    \item iws_nlcd*_**_41: Deciduous forest
#'    \item iws_nlcd*_**_42: Evergreen forest
#'    \item iws_nlcd*_**_43: Mixed forest
#'    \item iws_nlcd1992_**_51: Shrubland. Note, this variable only calculated in 1992.
#'    \item iws_nlcd1992_**_52: Scrub/shrub. Note, this variable not calculated in 1992 (* = 2001, 2006, 2011)
#'    \item iws_nlcd1992_**_61: Orchards/vineyards/other. Note, this variable only calculated in 1992.
#'    \item iws_nlcd*_**_71: Grasslands/herbaceous
#'    \item iws_nlcd*_**_81: Pasture/hay
#'    \item iws_nlcd*_**_82: Row crops
#'    \item iws_nlcd1992_**_83: Small grains. Note, this variable only calculated in 1992.
#'    \item iws_nlcd1992_**_85: Urban/recreational grasses. Note, this variable only calculated in 1992.
#'    \item iws_nlcd*_**_90: Woody wetlands. Note, this variable not calculated in 1992 (* = 2001, 2006, 2011). Equivalent code for 1992 = 91.
#'    \item iws_nlcd1992_**_91: Woody wetlands. Note, this variable only calculated in 1992. Equivalent code for 2001, 2006 and 2011 = 90.
#'    \item iws_nlcd1992_**_92: Emergent herbaceous wetlands. Note, this variable only calculated in 1992. Equivalent code for 2001, 2006, and 2011 = 95.
#'    \item iws_nlcd*_**_95: Emergent herbaceous wetlands. Note, this variable not calculated in 1992. Equivalent code for 1992 = 92.
#'    \item iws_roaddensity_*: Roads within the zone, calculated as sum of the length in meters, or sum of the length in meters divided by area of zone in hectares (* = sum_lengthm, density_mperha)
#'    \item iws_slope_*: The slope at each cell is the slope with respect to its immediate neighbors (10m scale). Cells in IWS summarized as either the minimum, maximum, mean, or standard deviation (* = min, max, mean, std)
#'    \item iws_tri_*: Terrain ruggedness index (TRI) at each cell in meters with repsect to its immediate neighbors (10m scale). Cells in IWS summarized as either the minimum, maximum, mean, or standard deviation (* = min, max, mean, std)
#'    \item iws_zoneid: unique zone identifier
#'    \item iws_lagoslakeid: unique integer identifier for each lake in LAGOS
#'    \item lakeconnection:
#'    \item borderiws:
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name iws.lulc
#' @references Soranno et al. (2015) \href{http://www.mrlc.gov/nlcd2011.php}{National Land Cover Database},
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
