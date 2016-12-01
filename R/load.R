#' lagos_load
#' @description Load LAGOS files from local file system
#' @param version character LAGOS database version string
#' @param format character choice of rds or sqlite
#' @param fpath file.path optionally specify custom location of LAGOS rds file
#' @export
#' @importFrom rappdirs user_data_dir
#' @importFrom dplyr src_sqlite
#' @examples \dontrun{
#' dt  <- lagos_load("1.054.1")
#' dt2 <- lagos_load("1.054.2")
#'
#'compare_columns <- function(num){
#'  identical(dt2$epi.nutr[,num], dt$epi.nutr[,num])
#'}
#'names(dt2$epi.nutr)[sapply(13:94, compare_columns)]
#'
#' }
lagos_load <- function(version, format = "rds", fpath = NA){

  if(!is.na(fpath)){

    if(format == "sqlite"){
      dplyr::src_sqlite(fpath)
    }else{
      readRDS(fpath)
    }

  }else{

    if(format == "sqlite"){
      sqlite_path <- paste0(lagos_path(), "LAGOS.sqlite3")
      stop_if_not_exists(sqlite_path)
      dplyr::src_sqlite(sqlite_path)
    }else{
      rds_path <- paste0(lagos_path(), "data_", version, ".rds")
      stop_if_not_exists(rds_path)
      readRDS(rds_path)
    }

  }
}

#' lagos_load_oliver_2015
#'
#' @export
#' @param fpath file.path optionally specify custom location of csv data file
#' @importFrom utils read.csv
#' @importFrom rappdirs user_data_dir
#' @examples
#' lagos_load_oliver_2015()
lagos_load_oliver_2015 <- function(fpath = NA){
  destdir <- rappdirs::user_data_dir("LAGOS")
  dir.create(destdir, showWarnings = FALSE)

  if(is.na(fpath)){
    read.csv(paste0(destdir, .Platform$file.sep, "oliver_2015_depth.csv"))
  }else{
    read.csv(fpath)
  }
}
