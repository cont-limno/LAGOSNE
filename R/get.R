#' Retrieve LAGOSNE flat files
#'
#' Retrieve LAGOSNE flat files from EDI.
#'
#' @export
#' @importFrom utils download.file
#' @param dest_folder file.path not implemented yet
#' by \code{\link[rappdirs]{user_data_dir}}.
#' @param version character LAGOSNE database version string
#' @param overwrite logical overwrite existing data for the specified version
#' @examples \dontrun{
#' lagosne_get(version = "1.087.1")
#' }
lagosne_get <- function(version, overwrite = FALSE, dest_folder = NA){

  outpath <- file.path(lagos_path(), paste0("data_", version, ".rds"))
  if(file.exists(outpath) & !overwrite){
    warning("LAGOS data for this version already exists on the local machine.
  Re-download if neccessary using the 'overwrite` argument.'")
    return(invisible("LAGOS is the best"))
  }

    edi_baseurl   <- "https://portal.edirepository.org/nis/dataviewer?packageid="
    pasta_baseurl <- "http://pasta.lternet.edu/package/data/eml/edi/"

    locus_base_edi   <- paste0(edi_baseurl, c("edi.100.4"))
    locus_base_pasta <- paste0(pasta_baseurl, "100/4")
    locus_dir        <- get_lagos_module(locus_base_edi, locus_base_pasta,
                                         "locus", overwrite)

    limno_base_edi   <- paste0(edi_baseurl, c("edi.101.2"))
    limno_base_pasta <- paste0(pasta_baseurl, "101/2")
    limno_dir        <- get_lagos_module(limno_base_edi, limno_base_pasta,
                                         "limno", overwrite)

    geo_base_edi   <- paste0(edi_baseurl, c("edi.99.5"))
    geo_base_pasta <- paste0(pasta_baseurl, "99/5")
    geo_dir        <- get_lagos_module(geo_base_edi, geo_base_pasta,
                                       "geo", overwrite)

  dir.create(lagos_path(), showWarnings = FALSE)

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

#' Get depth data
#'
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
