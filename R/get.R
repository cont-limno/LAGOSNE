
#' lagos_get
#'
#' @export
#' @description Retrieves LAGOS flat files from GigaDB.
#' @importFrom utils download.file
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @examples \dontrun{
#' lagos_get()
#' }
lagos_get <- function(dest_folder = NA){

  # replace with LAGOS path
  baseurl <- "ftp://climb.genomics.cn/pub/10.5524/100001_101000/100244/"

  # replace with LAGOS file names
  files <- c("Cirflux_ScalingAndModeling_canopyLevelData_GigaScience.csv",
                 "Cirflux_ScalingAndModeling_leafLevelData_GigaScience.csv")

  # dir.exists(lagos_path())
  dir.create(lagos_path(), showWarnings = FALSE)

  invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
    paste0(lagos_path(), x))))

}


#' lagos_get_oliver_2015
#'
#' @export
#' @param dest_folder file.path
#' @references Oliver SK, Soranno PA, Fergus EC, Wagner T, Webster KE, Scott C,
#'  Winslow LA, Downing JA, Stanley EH. 2015. LAGOS - Predicted and observed
#'  maximum depth values for lakes in a 17-state region of the U.S. Long Term
#'  Ecological Research Network.
#'  doi:10.6073/pasta/f00a245fd9461529b8cd9d992d7e3a2f
#'
#' @examples \dontrun{
#' lagos_get_oliver_2015()
#' }
lagos_get_oliver_2015 <- function(dest_folder){
  dir.create(lagos_path(), showWarnings = FALSE)

  baseurl <- "http://pasta.lternet.edu/package/data/eml/knb-lter-ntl/320/4/4a283c25f3548c0f78d8a01658e4a353"

  get_if_not_exists(baseurl, paste0(lagos_path(), "oliver_2015_depth.csv"))
}
