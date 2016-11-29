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
#'     \item iws_nhdid: a unique indentifier for each lake from the National Hydrography Dataset
#'     \item iws_areaha: area of IWS in hectares
#'     \item iws_perimkm: perimeter of IWS in kilometers
#'     \item iws_lat: latitude of the IWS
#'     \item iws_long: longitude of the IWS
#'     \item iws_lakeareaha
#'     \item iws_pct_in_usa
#'     \item iws_ha_in_usa
#'     \item iws_pct_in_nwi
#'     \item iws_ha_in_nwi
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
#'     \item hu12:
#'     \item hu12_name:
#'     \item hu12_country:
#'     \item hu12_pct_in_us:
#'     \item hu12_zoneid:
#'     \item hu12_pct_in_nwi:
#'     \item hu12_ha:
#'     \item hu12_ha_in_nwi:
#'     \item hu12_pct_in_usa:
#'     \item hu12_ha_in_usa:
#'     \item hu12_lat:
#'     \item hu12_long:
#'     }
#'
#' @docType data
#' @keywords datasets
#' @name hu12
#' @references \href{http://water.usgs.gov/GIS/huc.html}{USGS Hydrologic Unit Maps}
NULL

#' Epilimnion Data
#'
#' A dataset containing physical and chemical attributes of the lakes' epilimnion (surface waters).
#'
#' @format A data frame with 276488 observations and 94 variables:
#' \itemize{
#'             \item eventida10541
#'             \item lagoslakeid
#'             \item programname
#'             \item programtype
#'             \item lagosversion
#'             \item sampledate
#'             \item chla
#'             \item colora
#'             \item colort
#'             \item dkn
#'             \item doc
#'             \item nh4
#'             \item no2
#'             \item no2no3
#'             \item srp
#'             \item tdn
#'             \item tdp
#'             \item tkn
#'             \item tn
#'             \item toc
#'             \item ton
#'             \item tp
#'             \item secchi
#'             \item chla_qual
#'             \item colora_qual
#'             \item colort_qual
#'             \item dkn_qual
#'             \item doc_qual
#'             \item nh4_qual
#'             \item no2_qual
#'             \item no2no3_qual
#'             \item srp_qual
#'             \item tdn_qual
#'             \item tdp_qual
#'             \item tkn_qual
#'             \item tn_qual
#'             \item toc_qual
#'             \item ton_qual
#'             \item tp_qual
#'             \item secchi_qual
#'             \item chla_censorcode
#'             \item colora_censorcode
#'             \item colort_censorcode
#'             \item dkn_censorcode
#'             \item doc_censorcode
#'             \item nh4_censorcode
#'             \item no2_censorcode
#'             \item no2no3_censorcode
#'             \item secchi_censorcode
#'             \item srp_censorcode
#'             \item tdn_censorcode
#'             \item tdp_censorcode
#'             \item tkn_censorcode
#'             \item tn_censorcode
#'             \item toc_censorcode
#'             \item ton_censorcode
#'             \item tp_censorcode
#'             \item chla_detectionlimit
#'             \item colora_detectionlimit
#'             \item colort_detectionlimit
#'             \item dkn_detectionlimit
#'             \item doc_detectionlimit
#'             \item nh4_detectionlimit
#'             \item no2_detectionlimit
#'             \item no2no3_detectionlimit
#'             \item secchi_detectionlimit
#'             \item srp_detectionlimit
#'             \item tdn_detectionlimit
#'             \item tdp_detectionlimit
#'             \item tkn_detectionlimit
#'             \item tn_detectionlimit
#'             \item toc_detectionlimit
#'             \item ton_detectionlimit
#'             \item tp_detectionlimit
#'             \item chla_labmethodname
#'             \item colora_labmethodname
#'             \item colort_labmethodname
#'             \item dkn_labmethodname
#'             \item doc_labemthodname
#'             \item nh4_labmethodname
#'             \item no2_labmethodname
#'             \item no2no3_labmethodname
#'             \item srp_labmethodname
#'             \item tdn_labmethodname
#'             \item tdp_labmethodname
#'             \item tkn_labmethodname
#'             \item tn_labmethodname
#'             \item toc_labmethodname
#'             \item tp_labmethodname
#'             \item chla_methodinfo
#'             \item nh4_methodinfo
#'             \item secchi_methodinfo
#'             \item sampleyear
#'             \item samplemonth
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
