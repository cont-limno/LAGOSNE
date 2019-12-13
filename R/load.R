#' Load LAGOSNE data
#'
#' Load LAGOSNE data from local system files
#'
#' @param version character LAGOSNE database version string. Defaults to \code{\link{lagosne_version}}
#' @param fpath file.path optionally specify custom location of LAGOSNE rds file
#' @export
#' @importFrom rappdirs user_data_dir
#' @importFrom memoise memoise
#'
#' @examples \dontrun{
#' dt  <- lagosne_load("1.087.3")
#' }
lagosne_load <- function(version = NULL, fpath = NA){
  if(is.null(version)){
    version <- lagosne_version()
    if(interactive()){
      message(paste0("Loading LAGOSNE version: ", version))
    }else{
      warning(paste0("LAGOSNE version unspecified, loading version: ", version))
    }
  }

  if(!is.na(fpath)){
      readRDS(fpath)
  }else{
    rds_path <- paste0(lagos_path(), "data_", version, ".rds")
    stop_if_not_exists(rds_path)
    readRDS(rds_path)
  }
}

#' Load depth data from Oliver et al. 2015.
#'
#' @format A data frame with 50607 observations of 8 variables:
#' \itemize{
#'        \item lagoslakeid: unique identifier for each lake in LAGOS-NE.
#'             For each row of data in this table, the lagoslakeid identifies the focal lake
#'             for which other measures are calculated
#'        \item nhdid: the 'Permanent_identifier' from the NHD,
#'             but is called the NHDID in LAGOS-NE
#'        \item hu4id: the unique ID of the HU4 zone that the focal lake is located within
#'        \item lat_decimal: lattitude geographic coordinate in decimal degrees
#'        \item long_decimal: longitude geographic coordinate in decimal degrees
#'        \item area: lake area in hectares
#'        \item zmaxobs: observed maximum lake depth (meters)
#'        \item zmaxpredict: predicted maximum lake depth (meters)
#'     }
#'
#' @export
#' @param fpath file.path optionally specify custom location of csv data file
#' @importFrom utils read.csv
#' @importFrom rappdirs user_data_dir
#'
#' @references Oliver SK, Soranno PA, Fergus EC, Wagner T, Webster KE, Scott C,
#'  Winslow LA, Downing JA, Stanley EH. 2015. LAGOS - Predicted and observed
#'  maximum depth values for lakes in a 17-state region of the U.S. Long Term
#'  Ecological Research Network.
#'  doi:10.6073/pasta/f00a245fd9461529b8cd9d992d7e3a2f
#' @examples \dontrun{
#' lagos_load_oliver_2015()
#' }
lagos_load_oliver_2015 <- function(fpath = NA){
  destdir <- rappdirs::user_data_dir("LAGOSNE")
  dir.create(destdir, showWarnings = FALSE)

  if(is.na(fpath)){
    read.csv(paste0(destdir, .Platform$file.sep, "oliver_2015_depth.csv"),
             stringsAsFactors = FALSE)
  }else{
    read.csv(fpath, stringsAsFactors = FALSE)
  }
}

#' Load LAGOSNE snapshot from Collins et al. 2017.
#'
#' @export
#' @param fpath file.path optionally specify custom location of csv data file
#' @importFrom utils read.csv
#' @importFrom rappdirs user_data_dir
#'
#' @references Collins S., S. Oliver, J. Lapierre, E. Stanley, J. Jones,
#'  T. Wagner, P. Soranno. 2016. LAGOS - Lake nitrogen, phosphorus,
#'  stoichiometry, and geospatial data for a 17-state region of the U.S..
#'  Environmental Data Initiative.
#'  doi:10.6073/pasta/3abb4a56e76a52a12a366a338fc07dd8.
#' @examples \dontrun{
#' lg <- lagos_load_collins_2017()
#' }
lagos_load_collins_2017 <- function(fpath = NA){
  destdir <- rappdirs::user_data_dir("LAGOSNE")
  dir.create(destdir, showWarnings = FALSE)

  if(is.na(fpath)){
    read.csv(paste0(destdir, .Platform$file.sep, "collins_2017.csv"),
             stringsAsFactors = FALSE)
  }else{
    read.csv(fpath, stringsAsFactors = FALSE)
  }
}
