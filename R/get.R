
#' lagos_get
#'
#' @export
#' @description Retrieves LAGOS flat files from GigaDB.
#' @import rappdirs
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

  destdir <- rappdirs::user_data_dir("LAGOS")
  # dir.exists(destdir)
  dir.create(destdir, showWarnings = FALSE)

  invisible(lapply(files, function(x) get_if_not_exists(paste0(baseurl, x),
    paste0(destdir, .Platform$file.sep, x))))

}


#' lagos_get_oliver_2015
#'
#' @export
#'
#' @examples
#' lagos_get_oliver_2015()
lagos_get_oliver_2015 <- function(dest_folder){
  destdir <- rappdirs::user_data_dir("LAGOS")
  dir.create(destdir, showWarnings = FALSE)

  baseurl <- "http://pasta.lternet.edu/package/data/eml/knb-lter-ntl/320/4/4a283c25f3548c0f78d8a01658e4a353"

  get_if_not_exists(baseurl, paste0(destdir, .Platform$file.sep,
    "oliver_2015_depth.csv"))
}
