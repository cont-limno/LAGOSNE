#' Retrieve LAGOSNE flat files
#'
#' Retrieve LAGOSNE flat files from EDI.
#'
#' @export
#' @importFrom utils download.file
#' @param dest_folder file.path to save data. Default to a temporary folder.
#' Recommended to set to LAGOSNE:::lagos_path() so that data persists between
#' R sessions.
#' @param version character LAGOSNE database version string
#' @param overwrite logical overwrite existing data for the specified version
#' @examples \dontrun{
#' # default to latest version
#' lagosne_get(dest_folder = LAGOSNE:::lagos_path())
#'
#' # get previous version(s)
#' # - recommended to install corresponding package version
#' # - See 'Legacy Versions' section of the README for instructions
#' }
lagosne_get <- function(version = lagosne_version(), overwrite = FALSE,
                        dest_folder = tempdir()){

  if(dest_folder != lagos_path()){
    warning("Set dest_folder to LAGOSNE:::lagos_path() so that data persists
between R sessions. \n")
  }

  outpath <- file.path(lagos_path(), paste0("data_", version, ".qs"))
  if(file.exists(outpath) & !overwrite){
    warning("LAGOSNE data for this version already exists on the local machine.
  Re-download if neccessary using the 'overwrite` argument.'")
    return(invisible("LAGOS is the best"))
  }

  if(version != lagosne_version()){
    warning(
      paste0("Specified version '", version, "' does not match the most recent LAGOSNE version '", lagosne_version(), "' - If an older LAGOSNE version is desired, see the 'Legacy Versions' section of the README for instructions."))
  }

    edi_baseurl   <- "https://portal.edirepository.org/nis/dataviewer?packageid="
    pasta_baseurl <- "http://pasta.lternet.edu/package/data/eml/edi/"

    message("Downloading the 'locus' module ...")
    locus_base_edi   <- paste0(edi_baseurl, c("edi.100.4"))
    locus_base_pasta <- paste0(pasta_baseurl, "100/4")
    locus_dir        <- get_lagos_module(locus_base_edi, locus_base_pasta,
                                         "locus", overwrite)

    message("Downloading the 'limno' module ...")
    limno_base_edi   <- paste0(edi_baseurl, c("edi.101.3"))
    limno_base_pasta <- paste0(pasta_baseurl, "101/3")
    limno_dir        <- get_lagos_module(limno_base_edi, limno_base_pasta,
                                         "limno", overwrite)

    message("Downloading the 'geo' module ...")
    geo_base_edi   <- paste0(edi_baseurl, c("edi.99.5"))
    geo_base_pasta <- paste0(pasta_baseurl, "99/5")
    geo_dir        <- get_lagos_module(geo_base_edi, geo_base_pasta,
                                       "geo", overwrite)

  dir.create(dest_folder, showWarnings = FALSE)

  message("LAGOSNE downloaded. Now compressing to native R object ...")

  lagosne_compile(version = version,
                locus_folder = locus_dir,
                limno_folder = limno_dir,
                geo_folder   = geo_dir,
                dest_folder  = dest_folder
                )

  return(invisible(list(locus_folder = locus_dir,
                        limno_folder = limno_dir,
                        geo_folder   = geo_dir)))
}

#' Get depth data from Oliver et al. 2015
#'
#' @export
#' @param dest_folder file.path not implemented yet
#' @param overwrite logical overwrite existing data?
#' @references Oliver SK, Soranno PA, Fergus EC, Wagner T, Webster KE, Scott C,
#'  Winslow LA, Downing JA, Stanley EH. 2015. LAGOS - Predicted and observed
#'  maximum depth values for lakes in a 17-state region of the U.S. Long Term
#'  Ecological Research Network.
#'  doi:10.6073/pasta/f00a245fd9461529b8cd9d992d7e3a2f
#'
#' @examples \dontrun{
#' lagos_get_oliver_2015()
#' }
lagos_get_oliver_2015 <- function(dest_folder, overwrite = FALSE){
  dir.create(lagos_path(), showWarnings = FALSE)

  baseurl <- paste0("http://pasta.lternet.edu/package/data/eml/",
                    "knb-lter-ntl/320/4/4a283c25f3548c0f78d8a01658e4a353")

  get_if_not_exists(baseurl, paste0(lagos_path(), "oliver_2015_depth.csv"), overwrite = overwrite)
}

#' Get LAGOSNE snapshot from Collins et al. 2017
#'
#' @export
#' @param dest_folder file.path not implemented yet
#' @param overwrite logical overwrite existing data?
#' @references Collins S., S. Oliver, J. Lapierre, E. Stanley, J. Jones,
#'  T. Wagner, P. Soranno. 2016. LAGOS - Lake nitrogen, phosphorus,
#'  stoichiometry, and geospatial data for a 17-state region of the U.S..
#'  Environmental Data Initiative.
#'  doi:10.6073/pasta/3abb4a56e76a52a12a366a338fc07dd8.
#'
#' @examples \dontrun{
#' lagos_get_collins_2017()
#' }
lagos_get_collins_2017 <- function(dest_folder, overwrite = FALSE){
  dir.create(lagos_path(), showWarnings = FALSE)

  baseurl <- paste0("http://pasta.lternet.edu/package/data/eml/",
                    "knb-lter-ntl/332/5/d9e3a388e566a2428a93b982a000e2c4")

  get_if_not_exists(baseurl, paste0(lagos_path(), "collins_2017.csv"),
                    overwrite = overwrite)
}
