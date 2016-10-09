#' lagos_load
#' @description Load LAGOS files from local file system
#' @param version character LAGOS database version string
#' @param fpath file.path optionally specify custom location of LAGOS rds file
#' @export
#' @import rappdirs
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#' }
lagos_load <- function(version, fpath = NA){

  if(!is.na(fpath)){
    readRDS(fpath)
  }else{
    data_dir <- rappdirs::user_data_dir("LAGOS")
    readRDS(paste0(data_dir, "/data_", version, ".rds"))
  }
}
