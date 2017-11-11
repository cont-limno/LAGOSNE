#' Interface to the LAGOSNE lakes database
#' @name LAGOSNE-package
#' @aliases LAGOSNE
#' @docType package
#' @importFrom magrittr %>%
#' @title R interface to the LAGOSNE lakes database
#' @author \email{stachel2@msu.edu}
NULL

#' LAGOSNE Spatial Classifications Metadata
#'
#' Data frames containing metadata for each spatial classification at which
#'  ecological context data are derived in LAGOSNE. The spatial classifications
#'  include 100m buffers (lakes4ha.buffer100m),
#'  500m buffers (lakes4ha.buffer500m), interlake watersheds (iws),
#'  hydrologic units (hu12, hu8, hu4), ecological drainage units (edu),
#'  counties (county), and states (state). Each abbreviation is the name of the
#'  data frame, with all or a subset of the following variables. For more
#'  information about derivation of each spatial classification, see Details
#'  below or [insert supp docs] from Soranno et al. 2015.
#'
#' The nine LAGOSNE spatial classifications were used to summarize the ecological
#' context of each lake. Ecological context themes include
#' land use/land cover (LULC), connectivity (CONN), and climate, hydrology,
#' atmospheric deposition, and groundwater (CHAG). Not all themes were derived
#' at all classifications due to data availability. Briefly:
#' \itemize{
#'     \item iws: a dataframe with 51065 observations of 12 variables. The area
#'     of land that drains directly into a lake, and into all
#'     upstream-connected, permanent streams to that lake exclusive of any
#'     upstream lake watersheds for lakes greater than  10 ha that are
#'     connected via permanent streams.  For details on how the watersheds were
#'     delineated, see additional file 8 in Soranno et al. (2015). Themes
#'     derived at the iws classification include LULC and CONN.
#'     \item lakes4ha.buffer100m: a dataframe with 51065 of 3 variables.
#'     Buffers are a 100 m equidistant buffer of the land that is 100 m from
#'     the lake shoreline, calculated using the ArcGIS Buffer tool. Themes
#'     derived at the 100m buffer classification include LULC.
#'     \item lakes4ha.buffer500m: a dataframe with 51065 of 3 variables.
#'     Buffers are a 500 m equidistant buffer of the land that is 500 m from
#'     the lake shoreline, calculated using the ArcGIS Buffer tool. Themes
#'     derived at the 500m buffer classification include LULC and CONN.
#'     \item hu12: a dataframe with 20257 observations of 11 variables. The
#'     Watershed Boundary Dataset defines boundaries based on surface water
#'     drainage and creates nested Hydrologic Units (sometimes abbreviated and
#'     referred to as HUCs, which are hydrologic unit codes) that are
#'     georeferenced to the USGS 1:24,000 topographic base map. HUC12s are the
#'     sixth level of classificiation. HUC12s are defined along natural
#'     hydrologic breaks based on land surface and surface-water flow and they
#'     have a single flow outlet except in frontal, lake, braided-stream, or
#'     closed-basin hydrologic units. Themes derived at the HUC12
#'     classification include LULC, CONN and CHAG.
#'     \item hu8: a data frame with 511 observations of 9 variables. HUC8s are
#'     the fourth level of classificiation. Sometimes called 'watersheds', a
#'     HUC8 is a geographic area representing part or all of a surface
#'     drainage basin, a combination of drainage basins, or a distinct
#'     hydrologic feature. Themes derived at the HUC8 classification include
#'     LULC, CONN, and CHAG.
#'     \item hu4: a data frame with 65 observations of 9 variables. HUC4s are
#'     the second level of classification, called a 'subregion'. A subregion
#'     includes the area drained by a river system, a reach of a river and its
#'     tributaries in that reach, a closed basin(s), or a group of streams
#'     forming a coastal drainage area. Themes derived at the HUC4
#'     classification include LULC, CONN, and CHAG.
#'     \item edu: a data frame with 91 observations of 10 variables.
#'     Ecological drainage units (EDUs) follow the WBD boundaries, and are of
#'     roughly similar size to HUC6s. EDUs were delineated by grouping the
#'     HUC8 watersheds based on common zoogeographic history, and
#'     physiographic and climatic characteristics. Themes derived at the EDU
#'     classification include LULC, CONN, and CHAG.
#'     \item county: a data frame with 955 observations of 8 variables.
#'     Counties (political boundary) within the 17-state region of LAGOSNE.
#'     Themes derived at the county classification include LULC, CONN, and
#'     CHAG.
#'     \item state: a dataframe with 17 observations of 7 variables. Themes
#'     derived at the state classification include LULC, CONN, and CHAG.
#' }
#'
#' @format Data frames with all or a subset of the following variables. Number
#' of observations is equal to the number of zones in each spatial
#' classification (see Details below).
#' \itemize{
#'     \item *_nhdid: permanent lake-specific identifier from the National
#'     Hydrography Dataset (* = lakes4ha_buffer100m, lakes4ha_buffer500m, iws)
#'     \item *_name: text name of the zone (* = iws, hu12, hu8, hu4,
#'     county, state)
#'     \item hu*: unique zone identifier (* = 12, 8, 4)
#'     \item *_ha: area of spatial classification in hectares
#'     (* = lakes4ha_buffer100m, lakes4ha_buffer500m, hu12, hu8, hu4, edu,
#'     county)
#'     \item *_areaha: area of spatial classification in hectares (* = iws, )
#'     \item *_perimkm: perimeter of spatial classification in kilometers
#'     (* = iws, )
#'     \item *_lat: latitude of centroid of polygon in decimal degrees (NAD83)
#'     (* = iws, hu12, hu8, hu4, edu, county, state)
#'     \item *_long: longitude of centroid of polygon in decimal degrees
#'     (NAD83) (* = iws, hu12, hu8, hu4, edu, county, state)
#'     \item *_lakeareaha: lake area (ha) of focal lake within polygon
#'     (* = iws, )
#'     \item *_country: whether the polygon lies within the US ("US") or the
#'     US and Canada (US_CA) (* = hu12, edu)
#'     \item *_pct_in_usa: percent of polygon within the US boundary (* = iws,
#'     hu12, edu)
#'     \item *_ha_in_usa: area (ha) of polygon within the US boundary (* = iws,
#'     hu12, edu)
#'     \item *_pct_in_nwi: percent of polygon within the USFWS National Wetland
#'     Inventory (NWI) boundary (* = hu12, hu8, hu4, edu, county, state)
#'     \item *_ha_in_nwi: area (ha) of polygon within the USFWS National
#'     Wetland Inventory (NWI) boundary (* = hu12, hu8, hu4, edu, county,
#'     state)
#'     \item *_zoneid: a unique identifier for each IWS in LAGOSNE, numbered 1:n
#'     with classification prefix (e.g., HU12_1) (* = iws, hu12, hu8, hu4, edu,
#'     county, state)
#'     \item *_lagoslakeid: LAGOSNE unique identifier for focal lake
#'     (* = lakes4ha_buffer100m, lakes_buffer500m, iws, )
#'     \item hu4_states: states that intersect hu4 zone polygon
#'     \item state: 2-letter state abbreviation
#'     \item county_state: state where county is located
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name classifications
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
#' @aliases lakes4ha.buffer100m lakes4ha.buffer500m buffer100m buffer500m iws hu12 hu8 hu4 edu county state classification scales
NULL

#' Land Use Land Cover (LULC) Data Frames
#'
#' Datasets containing information on the land use and land cover (LULC)
#' characteristics calculated at all LAGOSNE spatial classifications
#' (see ?scales) from the National Land Cover Dataset (NLCD).
#'
#' Original data sources and layers from which each metric was derived can be
#' found in additional file 5 of Soranno et al. (2015).
#'
#' @format Data frames with all or a subset of the following variables. Number
#' of observations is equal to the number of zones in each spatial scale
#' (see Details below). Wildcard options include the 9 LAGOSNE spatial scales
#' (* = lakes4ha.buff100m, lakes4ha.buffer500m, iws, hu12, hu8, hu4, edu,
#' county, state), year of measurement (** = 1992, 2001, 2006, 2011), and unit
#' of measurement in hectares or percent of zone area (*** = ha, pct unless
#' noted otherwise). Each variable is available at each scale, year, and unit
#' unless otherwise noted.
#' \itemize{
#'    \item *_nhdid (* = lakes4ha_buffer100m, lakes4ha_buffer500m, iws)
#'    \item *_canopy2001_***: per pixel tree canopy percent measured 2001.
#'     Summary statistics include minimum, maximum, mean and standard deviation
#'     (*** = min, max, mean, std).
#'    \item *_damdensity_***: dams in zone. Summary statistics include a point
#'    count, points per hectare, and points per square kilometer
#'    (*** = pointcount, poinsperha, pointspersqkm)
#'    \item *_nlcd**_***_0: No data
#'    \item *_nlcd**_***_11: Open water
#'    \item *_nlcd1992_***_21: Residential, low intensity
#'    \item *_nlcd**_***_21: Developed, open space. Note, this variable was
#'    not measured in 1992 (** = 2001, 2006, 2011)
#'    \item *_nlcd1992_***_22: Residential, high intensity
#'    \item *_nlcd**_***_22: Developed, low intensity. Note, this variable was
#'    not measured in 1992 (** = 2001, 2006, 2011)
#'    \item *_nlcd1992_***_23: Commercial/industrial/transportation
#'    \item *_nlcd**_***_23: Developed, medium intensity. Note, this variable was
#'    not measured in 1992 (** = 2001, 2006, 2011)
#'    \item *_nlcd**_***_24: Developed, high Intensity. Note, this variable was
#'    not measured in 1992 (** = 2001, 2006, 2011)
#'    \item *_nlcd**_***_31: Bare rock/sand/clay
#'    \item *_nlcd1992_***_32: Quarries/strip mines/gravel pits measured in
#'    1992
#'    \item *_nlcd1992_***_33: Transitional (barren) measured in 1992
#'    \item *_nlcd**_***_41: Deciduous forest
#'    \item *_nlcd**_***_42: Evergreen forest
#'    \item *_nlcd**_***_43: Mixed forest
#'    \item *_nlcd1992_***_51: Shrubland measured in 1992.
#'    \item *_nlcd1992_***_52: Scrub/shrub. Note, this variable not measured in
#'    1992
#'    (** = 2001, 2006, 2011)
#'    \item *_nlcd1992_***_61: Orchards/vineyards/other measured in 1992.
#'    \item *_nlcd**_***_71: Grasslands/herbaceous
#'    \item *_nlcd**_***_81: Pasture/hay
#'    \item *_nlcd**_***_82: Row crops
#'    \item *_nlcd1992_***_83: Small grains measured in 1992.
#'    \item *_nlcd1992_***_85: Urban/recreational grasses measured in 1992.
#'    \item *_nlcd**_***_90: Woody wetlands. Note, this variable not calculated
#'     in 1992
#'    (** = 2001, 2006, 2011). Equivalent code for 1992 = 91.
#'    \item *_nlcd1992_***_91: Woody wetlands measured in 1992. Equivalent code
#'    for 2001, 2006 and 2011 = 90.
#'    \item *_nlcd1992_***_92: Emergent herbaceous wetlands measured in 1992.
#'    Equivalent code for 2001, 2006, and 2011 = 95.
#'    \item *_nlcd**_***_95: Emergent herbaceous wetlands. Note, this variable
#'    not calculated in 1992 (** = 2001, 2006, 2011). Equivalent code for
#'    1992 = 92.
#'    \item *_roaddensity_***: Roads within the zone, calculated as sum of the
#'    length in meters, or sum of the length in meters divided by area of zone
#'    in hectares (*** = sum_lengthm, density_mperha)
#'    \item *_slope_***: The slope at each cell is the slope with respect to
#'    its immediate neighbors (10m scale). Cells in zone summarized as either
#'    the minimum, maximum, mean, or standard deviation (*** = min, max,
#'    mean, std)
#'    \item *_tri_***: Terrain ruggedness index (TRI) at each cell is the
#'    absolute difference in meters between the elevation of the focal cell and
#'    its immediate neighbors (10m scale).
#'    Cells in zone summarized as either the minimum, maximum, mean,
#'    or standard deviation (*** = min, max, mean, std)
#'    \item *_zoneid: unique zone identifier (* = iws, hu12, hu8, hu4, edu,
#'    county, state)
#'    \item *_lagoslakeid: unique integer identifier for focal lake
#'    (* = lakes4ha_buffer100m, lakes4ha_buffer500m, iws)
#'    \item lakeconnection: connectivity class of focal lake. Only in iws.lulc
#'    table.
#'    \item borderiws: whether iws zone intersects Canadian border
#'    (1 = yes, NA = no). Only in iws.lulc table.
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name lulc
#' @aliases buffer100m.lulc buffer500m.lulc iws.lulc hu12.lulc hu8.lulc hu4.lulc edu.lulc county.lulc state.lulc topography nlcd
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}; \href{http://www.mrlc.gov/nlcd2011.php}{National Land Cover Database},
NULL

#' CHAG Datasets
#'
#' Datasets containing information on climate, hydrology, atmospheric
#' deposition, and surficial geology characteristics calculated at hu12, hu8,
#' hu4, edu, county and state spatial classifications (see ?scales).
#'
#' Original data sources and layers from which each metric was derived can be
#' found in additional file 5 of Soranno et al. (2015). Briefly, climate data
#' came from the PRISM climate group, hydrology metrics were derived from
#' United States Geologic Survey (USGS) data, atmospheric deposition was from
#' the National Atmospheric Deposition program, and surficial geology were
#' derived from layers USGS data.
#'
#' @format Data frames with all or a subset of the following variables. Number
#' of observations is equal to the number of zones in each spatial scale (see
#' Details below). Wildcard options include a subset of the LAGOSNE spatial
#' scales (* = hu12, hu8, hu4, edu, county, state), years of measurement
#' (** = 1985, 1990, 1995, 2000, 2005, 2010), and summary statistic or
#' units (*** = min, max, mean, std for atmospheric deposition and hydrology;
#'  *** = ha, pct for surficial geology)
#' \itemize{
#'    \item *_zoneid: unique zone identifier
#'    \item *_dep_no3_**_***: nitrate ion wet deposition (kg/ha) in zone during
#'    specified year
#'    \item *_dep_so4_**_***: sulfate ion wet deposition (kg/ha) in zone during
#'     specified year
#'    \item *_dep_totaln_**_***: total inorganic nitrogen ion wet deposition
#'    (kg/ha) in zone during specified year
#'    \item *_baseflowindex_***: % of streamflow that can be attributed to
#'    ground-water discharge into streams in the zone (baseflow/totalflow *100)
#'    \item *_groundwaterrecharge_***: mean annual natural groundwater recharge
#'    (mm/yr) in zone - Baseflow multiplied by mean annual runoff
#'    \item *_runoff_***: average annual runoff (in/yr) in the zone, 1951-80
#'    \item *_prism_ppt_30yr_normal_800mm2_annual_***: 30-yr long-term (normal)
#'     annual mean precipitation (mm/yr) for zone
#'    \item *_prism_tmax_30yr_normal_800mm2_annual_***: 30-yr long-term
#'    (normal) annual maximum temperature (deg C) for zone
#'    \item *_prism_tmean_30yr_normal_800mm2_annual_***: 30-yr long-term
#'    (normal) annual mean temperature (deg C) for zone
#'    \item *_prism_tmin_30yr_normal_800mm2_annual_***: 30-yr long-term
#'    (normal) annual minimum temperature  (deg C) for zone
#'    \item *_surficialgeology_alluv_***: alluvial of all ages
#'    \item *_surficialgeology_beach_***: beach deposits of Holocene age
#'    \item *_surficialgeology_colluv_***: colluvium of all ages
#'    \item *_surficialgeology_dec_resid_***: decomposition residuum of all
#'    ages
#'    \item *_surficialgeology_eolian_***: silt (loess), sand of all ages
#'    \item *_surficialgeology_gf_out_***: glaciofluvial (outwash) deposits of
#'    all ages
#'    \item *_surficialgeology_grus_***: glaciated, granitic grus of Quaternary
#'    and Tertiary age
#'    \item *_surficialgeology_ice_***: ice-contact depositives of lake
#'    Wisconsin and Holocene age
#'    \item *_surficialgeology_lac_***: combination of: Glacial-lake clay and
#'    silt lake deposits of pre-Illinoian and Illinoin age; Glacial and
#'    postglacial lake deposits (delta, clay, silt and sand,  sand and gravel,
#'    density-current underflow-fan) of Holocene and late Wisconsin age; Beach
#'    sand and dune sand deposits of Holocene age; and Lake slack-water and
#'    alluvium deposits of pre-Illinoian, Illinoian, and late Wisconsin ages
#'    \item *_surficialgeology_lac_clay_***: glacial and postglacial lake
#'    deposits (clay and silt) of Holocene and late Wisconsin age
#'    \item *_surficialgeology_marine_***: coastal-plain marine deposits of
#'    Pleistocene and Pliocene ages, and glaciomarine deposits of late
#'    Wisconsin age
#'    \item *_surficialgeology_open_water_***: open water
#'    \item *_surficialgeology_other_***: surficial deposits, surficial
#'    materials, and bedrock masses that were deformed and (or) transported
#'    intact by glacial ice
#'    \item *_surficialgeology_peat_mrsh_***: coastal or inland deposits of
#'    freshwater, brackish-water, peat and muck or freshwater swamps of
#'    Holocene and late Wisconsin age
#'    \item *_surficialgeology_saprol_***: saprolite of quaternary and tertiary
#'    age on crystalline igneous and metamorphic rocks mostly
#'    \item *_surficialgeology_solif_***: solifluction deposits of Holocene and
#'     late to middle Pleistocene age, and lake Wisconsin age
#'    \item *_surficialgeology_solut_***: solution residuum of Quaternary and
#'    tertiary age
#'    \item *_surficialgeology_till_clay_***: till, clay of pre-Illinoian age,
#'    late Wisconsin and Holocene(?) age
#'    \item *_surficialgeology_till_loam_***: till, loam of pre-Illinoian,
#'    Illinoian, and late Wisconsin and Holocene(?) age
#'    \item *_surficialgeology_till_oth_***: till, complex depositions of lake
#'    Wisconsin and Illinoian age
#'    \item *_surficialgeology_till_sand_***: till, sand of pre-Illinoian age,
#'    late Wisconsin and Holocene(?) age
#'}
#'
#' @docType data
#' @keywords datasets
#' @name chag
#' @aliases hu12.chag hu8.chag hu4.chag edu.chag county.chag state.chag deposition climate hydrology geology baseflow
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Epilimnion Water Quality Data
#'
#' A dataset containing physical and chemical observations in the epilimnion
#' (surface waters).
#' Each row is a sampling event, and lakes can have multiple sampling events.
#'
#' @format A data frame with 289482 observations of 93 variables:
#' \itemize{
#'             \item eventida1087: unique combination of programid, lakeid, and
#'             date for each sampling event in LAGOSNE
#'             \item lagoslakeid: unique integer identifier for each lake in
#'             LAGOSNE
#'             \item programname: name of the sampling/monitoring program that
#'             collected the data
#'             \item programtype: categorical description of the type of
#'             sampling/monitoring effort (Federal Agency, LTER = Long Term
#'             Ecological Research program, National Survey Program, Non-Profit
#'             Agency, State Agency, State Agency/Citizen Monitoring Program,
#'             State Agency/University/Citizen Monitoring Program,
#'             State Agency/Citizen Monitoring Program, Tribal Agency,
#'             University)
#'             \item lagosversion: current version of LAGOSNE that the data
#'             record belongs to
#'             \item sampledate: date at which the sample was collected, stored
#'             in date format (YYYY-MM-DD)
#'             \item chla: chlorophyll a (µg/l)
#'             \item colora: color, apparent (PCU)
#'             \item colort: color, true (PCU)
#'             \item dkn: nitrogen, dissolved Kjeldahl  (µg/l as N)
#'             \item doc: carbon, dissolved organic (µg/l as C)
#'             \item nh4: nitrogen, ammonium NH4 (µg/l as N)
#'             \item no2: nitrogen, nitrite NO2 (µg/l as N)
#'             \item no2no3: nitrogen, nitrite NO2 + nitrate NO3 nitrogen
#'             (µg/l as N)
#'             \item srp: phosphorus, soluble reactive  (µg/l as P)
#'             \item tdn: nitrogen, total dissolved (µg/l as N)
#'             \item tdp: phosphorus, total dissolved (µg/l as P)
#'             \item tkn: nitrogen, total Kjeldahl (µg/l as N)
#'             \item tn: nitrogen, total (µg/l as N)
#'             \item toc: carbon, total organic (µg/l as C)
#'             \item ton: nitrogen, total organic (µg/l as N)
#'             \item tp: phosphorus, total (µg/l as P)
#'             \item secchi: Secchi disk transparency (m). More secchi data
#'             from additional lakes is available from the \link[LAGOSNE]{secchi}
#'             table.
#'             \item *_qual: data flags (qualifiers) from the source program
#'             for each water quality parameter (* = all water quality
#'             parameters listed above). For example, "chla_qual" is the
#'             variable name for the data flag for chlorophyll a observations.
#'             \item *_censorcode: identifies whether a data value is censored
#'             and the censor type for each water quality parameter (* = all
#'             water quality parameters listed above). For example,
#'             "chla_censorcode" is the variable name for censor information
#'             regarding chlorophyll a observations.
#'             \itemize{
#'                 \item NC1: has detection limit and data value is above
#'                 detection limit and has no qualifier or comments
#'                 \item NC2: has detection limit and data value is above
#'                 detection limit, and has qualifier or comments
#'                 \item NC3: has no detection limit and has qualifier or
#'                 comments
#'                 \item NC4: has no detection limit and has no qualifiers or
#'                 comments
#'                 \item LE1: has detection limit, data value is less than or
#'                 equal to detection limit, has qualifier or comments
#'                 \item LE2: has detection limit, data value is less than or
#'                 equal to detection limit, has no qualifier or comments
#'                 \item LE3: has no detection limit, < than comes from source
#'                 program, has qualifier or comments
#'                 \item LE4: has no detection limit, < than comes from source
#'                 program, has no qualifier or comments
#'             }
#'             \item *_detectionlimit: the detection limit used by the source
#'             program for each water quality parameter (* = all water quality
#'             parameters listed above). For example, "chla_detectionlimit" is
#'             the name of the variable that reports detection limits for
#'             chlorophyll a observations.
#'             \item *_labmethodname: analytical procedure, from a standards
#'             body if available for each water quality parameter (* = all
#'             water quality parameters listed above). For example,
#'             "chla_labmethodname" is the variable name for lab methods
#'             associated with each chlorophyll a observation.
#'             \item chla_methodinfo: flag to indicate variable was sampled
#'             using different methods. "CHLA_UNFILTERED" means that a sample
#'             was
#'             \item secchi_methodinfo: flag to indicate variable was sampled
#'             using different methods. "SECCHI_VIEW" means that Secchi depth
#'             was measured using a viewer box, whereas "SECCHI_VIEW_UNKNOWN"
#'             reports observations where it is unclear if a Secchi viewer box
#'             was used. A secchi observation without a methodinfo code means
#'             the Secchi depth was made without the viewer box.
#'             \item sampleyear: year (4-digit) in which sample was collected
#'             \item samplemonth: month in which sample was collected
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name epi_nutr
#' @aliases nutrients chla colora doc phosphorus nitrogen chlorophyll waterquality censorcode qualifiers detectionlimit
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Metadata for Lakes with Water Quality
#'
#' A dataset containing depth and names for lakes included in the limno
#' module.
#'
#' @format A data frame with 141265 observations of 8 variables:
#' \itemize{
#'             \item lagoslakeid:	    unique lake identifier developed for
#'             LAGOS-NE
#'             \item nhdid:	          the 'Permanent_identifier' from the NHD,
#'             but is called the NHDID in LAGOS-NE
#'             \item lagosname1:	    name of lake from source dataset used as
#'             the authoritative lake name for LAGOSNE
#'             \item meandepth:	      mean lake depth (meters)
#'             \item meandepthsource:	source of mean depth data, see
#'             "lagos.source.program" for definitions
#'             \item maxdepth:	      maximum lake depth (meters)
#'             \item maxdepthsource:	source of maximum depth data, see
#'             "lagos.source.program" for definitions
#'             \item legacyid:	      unique lake identifier from the original
#'             water quality source dataset, this is not standardized and each
#'             source dataset has its own system
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name lakes_limno
#' @aliases meandepth maxdepth legacyid depth
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Metadata for all lakes > 1ha
#'
#' A dataset containing identifying information for all lakes > 1ha. This includes
#' lake name, lake size (area and perimeter), location (lat/long), elevation,
#' and codes identifying zones in which the lake is located.
#'
#' @format A data frame with 141265 observations of 17 variables:
#' \itemize{
#'             \item lagoslakeid: unique identifier for each lake in LAGOS-NE.
#'             For each row of data in this table, the lagoslakeid identifies the focal lake
#'             for which other measures are calculated
#'             \item nhdid: the 'Permanent_identifier' from the NHD,
#'             but is called the NHDID in LAGOS-NE
#'             \item gnis_name: lake name from the GNIS database
#'             \item nhd_lat: latitude of centroid of the NHD lake polygon in decimal
#'             degrees (NAD83)
#'             \item nhd_long: longitude of centroid of the NHD lake polygon in decimal
#'             degrees (NAD83)
#'             \item lake_area_ha: surface area (in hectares) of lake waterbody polygon from NHD
#'             \item lake_perim_meters: perimeter (in meters) of lake waterbody polygon from the NHD
#'             \item nhd_fcode: NHD five-digit integer code with feature code plus additional
#'             characteristics/values
#'             \item nhd_ftype: NHD three-digit integer code providing a unique identifier of feature
#'             type for the waterbody
#'             \item iws_zoneid: the  unique ID of the IWS that is estimated for the focal lake
#'             in the row of data that is identified by the lagoslakeid.
#'             \item hu4_zoneid: the unique ID of the HU4 zone that the focal lake is located within
#'             \item hu6_zoneid: the unique ID of the HU6 zone that the focal lake is located within
#'             \item hu8_zoneid: the unique ID of the HU8 zone that the focal lake is located within
#'             \item hu12_zoneid: the unique ID of the HU12 zone that the focal lake is located within
#'             \item edu_zoneid: the unique ID of the EDU zone that the focal lake is located within
#'             \item county_zoneid: the unique ID of the county that the focal lake is located within
#'             \item state_zoneid: the unique ID of the state that the focal lake is located within
#'             \item elevation_m: the elevation of the lake centroid, in meters (referenced to the
#'             North American Vertical Datum of 1988 (NAVD88)) and obtained from the National Elevation Dataset
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name locus
#' @aliases location
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Connectivity Datasets
#'
#' Datasets containing lake, stream, and wetland abundance and connectivity
#'  metrics calculated at the 500m buffer (lakes4ha.buffer500m.conn), HUC12
#'   (hu12.conn), HUC8 (hu8.conn), HUC4 (hu4.conn), EDU (edu.conn), county
#'    (county.conn) and state (state.conn) classifications.
#'
#' @format Data frames with all or a subset of the following variables. Number
#' of observations is equal to the number of zones in each spatial
#' classification (see ?classifications). Wildcard options include a subset of
#' the LAGOSNE spatial classifications (* = lakes4ha_buffer500m, iws,
#' hu12, hu8, hu4, edu, county, state) and additional wildcards described
#' below.
#' \itemize{
#'      \item Identifiers and Zone Metadata
#'      \itemize{
#'          \item *_zoneid: unique zone identifier
#'          \item *_nwiexclusions: zones that are not completely covered by
#'          the National Wetlands Inventory
#'          }
#'      \item Lake Connectivity Metrics. Lake abundance metrics are derived for
#'      all lakes, isolated lakes ("isolated" - no inflow or outflow streams),
#'      headwater lakes ("headwater" - no inflowing streams), stream
#'      drainage lakes ("drstream" - lakes with inflowing stream(s), with or
#'      without outflows, and no upstream lakes greater than 10 ha), and lake
#'      drainage lakes ("drlakeStream" lakes with inflowing stream(s) and at
#'      least one upstream lake greater than 10 ha).
#'      \itemize{
#'          \item *_lakes_**_***: all lakes that are within or intersect the
#'          zone boundary and are in a particular size class (** = lakes4ha,
#'          lakes4to10ha, lakes10ha), expressed as average lake area
#'          (*** = agsize_ha) or count (** = count)
#'          \item *_lakes_**_overlapping_***: all lakes that are clipped to the
#'          zone boundary and are in a particular size class (** = lakes4ha,
#'          lakes4to10ha, lakes10ha), expressed as sum of lake area
#'          (*** = area_ha) or percent of zone area (*** = area_pct)
#'          \item *_lakes_**_contributing_area_ha: all lakes that are within or
#'          intersect the zone boundary, and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum of lake
#'           area
#'          \item *_lakes_**_isolated_***: all isolated lakes that are within
#'          or intersect the zone boundary, and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as average size
#'           in hectares (*** = avgsize_ha) or count (*** = count
#'          \item *_lakes_**_isolated_overlapping_***: all isolated lakes that
#'          are clipped to the zone boundary and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum of lake
#'          area (*** = area_ha) or percent of zone area (*** = area_pct)
#'          \item *_lakes_**_isolated_contributing_area_ha: all isolated lakes
#'          that are within or intersect the zone boundary, and are in a
#'          particular size class (** = lakes4ha, lakes4to10ha, lakes10ha),
#'          expressed as sum of lake area
#'          \item *_lakes_**_headwater_***: all headwater lakes that are within
#'          or intersect the zone boundary, and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as average
#'          size in hectares (*** = avgsize_ha) or count (*** = count
#'          \item *_lakes_**_headwater_overlapping_***: all headwater lakes
#'          that are clipped to the zone boundary and are in a particular size
#'          class (** = lakes4ha, lakes4to10ha, lakes10ha), expressed
#'          as sum of lake area (*** = area_ha) or percent of zone area
#'          (*** = area_pct)
#'          \item *_lakes_**_headwater_contributing_area_ha: all headwater
#'          lakes that are within or intersect the zone boundary, and are in a
#'          particular size class (** = lakes4ha, lakes4to10ha, lakes10ha),
#'          expressed as sum of lake area
#'          \item *_lakes_**_drstream_***: all drstream lakes that are within
#'          or intersect the zone boundary, and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as average
#'          size in hectares (*** = avgsize_ha) or count (*** = count
#'          \item *_lakes_**_drstream_overlapping_***: all drstream lakes that
#'          are clipped to the zone boundary and are in a particular size class
#'          (** = lakes4ha, lakes4to10ha, lakes10ha), expressed as sum of lake
#'          area (*** = area_ha) or percent of zone area (*** = area_pct)
#'          \item *_lakes_**_drstream_contributing_area_ha: all drstream lakes
#'          that are within or intersect the zone boundary,
#'          and are in a particular size class (** = lakes4ha, lakes4to10ha,
#'           lakes10ha), expressed as sum of lake area
#'          \item *_lakes_**_drlakestream_***: all drlakestream lakes that are
#'          within or intersect the zone boundary, and are in a particular size
#'          class (** = lakes4ha, lakes4to10ha, lakes10ha), expressed
#'          as average size in hectares (*** = avgsize_ha) or
#'          count (*** = count
#'          \item *_lakes_**_drlakestream_overlapping_***: all drlakestream
#'          lakes that are clipped to the zone boundary and are in a particular
#'          size class (** = lakes4ha, lakes4to10ha,
#'          lakes10ha), expressed as sum of lake area (*** = area_ha) or
#'          percent of zone area (*** = area_pct)
#'          \item *_lakes_**_drlakestream_contributing_area_ha: all
#'          drlakestream lakes that are within or intersect the zone boundary,
#'          and are in a particular size class (** = lakes4ha, lakes4to10ha,
#'          lakes10ha), expressed as sum of lake area
#'          \item *_latewisconsinglaciation_glaciation: zone glaciation status
#'          during  the late Wisconsin glaciation (Glaciated, Not_Glaciated,
#'           Partially)
#'      }
#'      \item Stream Connectivity Metrics
#'      \itemize{
#'          \item *_streamdensity_streams_**: all streams (NHDFlowline minus
#'          artificial lines through lakes)
#'          within the zone expressed as sum of length in meters
#'          (** = sum_lengthm) or density in meters per hectare (** = mperha)
#'          \item *_streamdensity_headwaters_*: headwater streams
#'          (1st-3rd Strahler order) within the zone
#'          expressed as sum of length in meters (** = sum_lengthm) or density
#'          in meters per hectare (** = mperha)
#'          \item *_streamdensity_midreaches_*: Midreach streams
#'          (4th-6th Strahler order) within the zone
#'          expressed as sum of length in meters (** = sum_lengthm) or density
#'          in meters per hectare (** = mperha)
#'          \item *_streamdensity_rivers_*: large river-streams (>6th Strahler
#'          order) within the zone
#'          expressed as sum of length in meters (** = sum_lengthm) or density
#'          in meters per hectare (** = mperha)
#'          \item *_canalditchdensity_**: canals within the zone,
#'          expressed as sum of length in meters (** = sum_lengthm) or density
#'          in meters per hectare (** = mperha)
#'          }
#'      \item Wetland Connectivity Metrics
#'      \itemize{
#'          \item *_wl_allwetlandsdissolved_**: all wetlands (regardless of
#'          vegetation,
#'          connection, or regime), expressed as average size in hectares
#'          (** = avgsize_ha), total area of wetlands that is contained within
#'          or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by all wetlands
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by all
#'          wetlands (** = overlapping_area_pct).
#'          Before calculating this value, contiguous patches of different
#'          types of wetlands were first dissolved to represent a single patch.
#'          \item *_wl_allwetlandsundissolved_**: all wetlands (regardless of
#'          vegetation, connection, or regime), expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that is contained within or partially intersect
#'          the border of this zone (** = overlapping_area_ha), total land area
#'          of this zone that is covered by all wetlands
#'          (** = contributing_area_ha), or percent of land area of this zone
#'          that is covered by all wetlands (** = overlapping_area_pct).
#'          Before calculating this value, contiguous patches of different
#'          types of wetlands were first dissolved to represent a single patch.
#'          \item *_wl_isolatedwetlandsundissolved_**: isolated wetland patches
#'          (no intersecting streams within a 30 m buffer of the wetland patch)
#'          in this zone.all wetlands (regardless of vegetation, connection,
#'          or regime), expressed as count (** = count), average size in
#'          hectares (** = avgsize_ha), total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha), total land area of this zone that is
#'          covered by this wetland type (** = contributing_area_ha), or
#'          percent of land area of this zone that is covered by this wetland
#'          type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_singlewetlandsundissolved_**:  single wetland patches
#'          (intersected within a 30 m buffer
#'          by a single first order stream) in this zone, expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_connectedwetlandsundissolved_**: connected wetland
#'          patches (intersected within a 30 m buffer by a higher
#'          order stream or by multiple streams) in this zone, expressed as
#'          count (** = count), average size in hectares (** = avgsize_ha),
#'          total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_forestedwetlandsundissolved_**:  forested wetland
#'          patches (dominated by woody vegetation 6m or taller)  in this zone,
#'          expressed as count (** = count), average size in hectares
#'          (** = avgsize_ha), total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_scrubshrubwetlandsundissolved_**: scrub-shrub wetland
#'          patches (dominated by woody vegetation < 6m tall) in this zone,
#'          expressed as count (** = count), average size in hectares
#'          (** = avgsize_ha), total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_openwaterwetlandsundissolved_**:  open water wetland
#'          patches (dominated by woody vegetation < 6m tall)  in this zone,
#'          expressed as count (** = count), average size in hectares
#'          (** = avgsize_ha), total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_regimefwetlandsundissolved_**: regime f
#'          (semipermanently flooded) wetland patches where surface water
#'          persists throughout the growing season in most years, expressed as
#'          count (** = count), average size in hectares (** = avgsize_ha),
#'          total area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_regimegwetlandsundissolved_**: regime g (intermittently
#'          exposed) wetland patches where surface water persists
#'          throughout the growing season in most years, expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          percent of land area of this zone that is covered by this wetland
#'          type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_regimeawetlandsundissolved_**: regime a (temporarily
#'          flooded) wetland patches where surface water persists
#'          throughout the growing season in most years, expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that is contained within or partially intersect
#'          the border of this zone (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_regimecwetlandsundissolved_**: regime c (seasonally
#'          flooded) wetland patches where surface water persists
#'          throughout the growing season in most years, expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'          \item *_wl_regimehwetlandsundissolved_**: regime h (permanently
#'          flooded) wetland patches where surface water persists
#'          throughout the growing season in most years, expressed as count
#'          (** = count), average size in hectares (** = avgsize_ha), total
#'          area of wetlands that
#'          is contained within or partially intersect the border of this zone
#'          (** = overlapping_area_ha),
#'          total land area of this zone that is covered by this wetland type
#'          (** = contributing_area_ha),
#'          or percent of land area of this zone that is covered by this
#'          wetland type (** = overlapping_area_pct).
#'          The patches were left as delineated by the National Wetlands
#'          Inventory ("undissolved") for calculating this variable.
#'
#'     }
#'}
#' @docType data
#' @keywords datasets
#' @name conn
#' @aliases connectivity buffer500m.conn lakes4ha.buffer500m.conn iws.conn hu12.conn hu8.conn hu4.conn edu.conn county.conn state.conn
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Lake Geospatial Metadata
#'
#' A dataset containing geospatial identifiers, upstream lake connectivity, and
#' wetland connectivity of all lakes in LAGOSNE >1 hectare.
#'
#' @format A data frame with 141271 observations and 31 variables:
#' \itemize{
#'              \item lagoslakeid: unique lake identifier in LAGOSNE
#'              \item lakes_nhdid: unique lake identifier from the National
#'              Hydrography Dataset (NHD)
#'              \item iws_zoneid: zone ID of interlake watershed (IWS) in which
#'              focal lake is located
#'              \item hu4_zoneid: zone ID of HUC4 in which focal lake is
#'              located
#'              \item hu6_zoneid: zone ID of HUC6 in which focal lake is
#'              located
#'              \item hu8_zoneid: zone ID of HUC8 in which focal lake is
#'              located
#'              \item hu12_zoneid: zone ID of HU12 in which focal lake is
#'              located
#'              \item edu_zoneid: zone ID of ecological drainage unit (EDU) in
#'              which focal lake is located
#'              \item county_zoneid: zone ID of county in which focal lake is
#'              located
#'              \item state_zoneid: two-letter abbreviation of state in which
#'              focal lake is located
#'              \item upstream_lakes_4ha_count: count of lakes >= 4 ha upstream of the focal lake,
#'              connected via the NHD network of all surface flow connections
#'              (defined as ephemeral, intermittent, or permanent streams, or any other connections)
#'              \item upstream_lakes_4ha_area_ha: total area of lakes >= 4 ha upstream of the focal lake,
#'              connected via the NHD network of all surface flow connections
#'              (defined as ephemeral, intermittent, or permanent streams, or any other connections)
#'              \item upstream_lakes_10ha_count: count of lakes >= 10 ha upstream of the focal lake,
#'              connected via the NHD network of all surface flow connections
#'              (defined as ephemeral, intermittent, or permanent streams, or any other connections)
#'              \item upstream_lakes_10ha_area_ha: total area of lakes >= 10ha upstream of the focal lake,
#'              connected via the NHD network of all surface flow connections
#'              (defined as ephemeral, intermittent, or permanent streams, or any other connections)
#'              \item latewisconsinglaciation_glacial: glaciation status during the Late Wisconsin glaciation,
#'              where 'Glaciated' where the whole zone was glaciated, 'Not_Glaciated' where the whole zone
#'              was not glaciated, and 'Partially_Glaciated' where a part of the zone was glaciated
#'              \item wlconnections_allwetlands_*: the wetland polygons that intersect or are
#'              within 30 m buffer around a lake shoreline, measured as count, area (ha), or sum of
#'              shoreline length (km) that intersects or touches wetland polygons
#'              (* = count, contributing_area_ha, shoreline_km).
#'              \item wlconnections_forestedwetlands_count: the forested wetland polygons that intersect or are
#'              within 30 m buffer around a lake shoreline, measured as count, area (ha), or sum of
#'              shoreline length (km) that intersects or touches wetland polygons
#'              (* = count, contributing_area_ha, shoreline_km).
#'              \item wlconnections_scrubshrubwetlands_count: the scrub-shrub wetland polygons that intersect or are
#'              within 30 m buffer around a lake shoreline, measured as count, area (ha), or sum of
#'              shoreline length (km) that intersects or touches wetland polygons
#'              (* = count, contributing_area_ha, shoreline_km).
#'              \item wlconnections_openwaterwetlands_count: the open water wetland polygons that intersect or are
#'              within 30 m buffer around a lake shoreline, measured as count, area (ha), or sum of
#'              shoreline length (km) that intersects or touches wetland polygons
#'              (* = count, contributing_area_ha, shoreline_km).
#'              \item wlconnections_otherwetlands_count: the other-wetland polygons that intersect or are
#'              within 30 m buffer around a lake shoreline, measured as count, area (ha), or sum of
#'              shoreline length (km) that intersects or touches wetland polygons
#'              (* = count, contributing_area_ha, shoreline_km).
#'              \item lakeconnection: connectivity of focal lake to upstream
#'              features (DR_LakeStream = drainage lake with an upstream lake,
#'              DR_Stream = drainage lake with upstream stream,
#'              Headwater = lake with outlet but no inlet,
#'              Isolated = lake with no inlets or outlets)

#'     }
#'
#' @docType data
#' @keywords datasets
#' @name lagoslakes
#' @aliases lakes.geo
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' Secchi (Water Clarity) Data
#'
#' A dataset containing Secchi disk measurements from lakes.
#'
#' There is some overlap between the Secchi values reported in table 'secchi'
#' and table 'epi_nutr'. The 'epi_nutr' table only contains Secchi observations
#' when there were additional nutrient data collected at the same time.
#'
#' @format A data frame with 913319 observations of 12 variables:
#' \itemize{
#'      \item eventida1087: unique combination of programid, lakeid, and date
#'      for each sampling event
#'      \item lagoslakeid: unique LAGOSNE lake identifier
#'      \item programname: name of the sampling/monitoring program that
#'      collected the data
#'      \item programtype: categorical description of the type of sampling
#'      /monitoring effort
#'      \item lagosversion: current version of LAGOSNE that the data record
#'      belongs to
#'      \item sampledate: date at which the sample was collected, stored in date format (YYYY-MM-DD)
#'      \item secchi: Secchi depth in meters
#'      \item secchi_censorcode: identifies whether a Secchi value is censored
#'      and the censor type
#'      \item secchi_qual: data flags from the source program
#'      \item secchi_methodinfo: flag to indicate variables that were sampled
#'      using different methods. "SECCHI_VIEW" =
#'      viewing box used to measure Secchi depth, "SECCHI_VIEW_UNKNOWN" =
#'      unknown whether viewing box was used, "NA" = no viewing
#'      box used to measure Secchi depth.
#'      \item sampleyear: year (4-digit) of sampling event
#'      \item samplemonth: month (1 through 12) of sampling event
#'      }
#' @docType data
#' @keywords datasets
#' @name secchi
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' LAGOSNE sources
#'
#' A dataset identifying the sources of limnological data in LAGOSNE.
#'
#' @format A data frame with 87 observations of 19 variables:
#' \itemize{
#'      \item programid: unique LAGOSNE program identifier
#'      \item programname: name of the sampling/monitoring program that
#'      collected the data
#'      \item metadataid: unique metadata identifier associated with
#'      \item sourceid
#'      \item sourcename
#'      \item composite
#'      \item programtype: categorical description of the type of sampling
#'      /monitoring effort
#'      \item fundingsource
#'      \item labtype
#'      \item programlink
#'      \item programstatus
#'      \item dataprovider
#'      \item organization
#'      \item sourcedescription
#'      \item beg_yr
#'      \item end_yr
#'      \item state_name
#'      \item lakecount
#'      \item variable_list
#'      }
#' @docType data
#' @keywords datasets
#' @name source
#' @aliases programs lagos.source.programs source.programs lagos.source lagos_source_program
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
NULL

#' LAGOSNE subset
#'
#' A dataset with the first two rows of many LAGOSNE tables
#'
#' @docType data
#' @keywords datasets
#' @name lg_subset
#' @references Soranno et al. (2015) \href{https://gigascience.biomedcentral.com/articles/10.1186/s13742-015-0067-4}{Gigascience 4:28}
"lg_subset"
