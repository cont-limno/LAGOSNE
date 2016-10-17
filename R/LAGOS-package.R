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
