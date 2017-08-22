#' Load LAGOS data from disk
#'
#' A wrapper for \code{\link[utils]{read.table}} with a default set of parameters.
#'
#' @param file_name character
#' @param sep character separator (tab or comma separated values)
#' @param ... Options passed on to \code{\link[utils]{read.table}}
#'
#' @return data.frame
load_lagos_txt <- function(file_name, sep = "\t", ...){

  read.table(file_name, header = TRUE, sep = sep, quote = "", dec = ".",
    strip.white = TRUE, comment.char = "")

}

#' Summarize all LAGOS flat files
#'
#' Generate table summary statistics for all LAGOS data frames.
#'
#' @author Masrour Farzan
#' @param lg list output of lagos_load
#' @examples \dontrun{
#' lg <- lagos_load("1.087.1")
#' LAGOS:::info_table(lg)
#' }
info_table <- function(lg){

  limno_names <- c("epi_nutr", "lakes_limno", "secchi")
  geo_names   <- !(names(lg) %in% c(limno_names, "locus"))

  limno <- lg[limno_names]
  geo   <- lg[geo_names]

  name <- c(names(geo), names(limno))
  type <- c(rep("geo", length(geo)), rep("limno", length(limno)))
  identifier <- c("county_zoneid","county_zoneid","county_zoneid",
                  "county_zoneid", "edu_zoneid", "edu_zoneid", "edu_zoneid",
                  "edu_zoneid", "hu4_zoneid", "hu4_zoneid", "hu4_zoneid",
                  "hu4_zoneid", "hu8_zoneid", "hu8_zoneid", "hu8_zoneid",
                  "hu8_zoneid", "hu12_zoneid", "hu12_zoneid", "hu12_zoneid",
                  "hu12_zoneid", "iws_zoneid","iws_zoneid", "iws_zoneid",
                  "state_zoneid", "state_zoneid", "state_zoneid",
                  "state_zoneid", "lagoslakeid", "lagoslakeid",
                  "lagoslakeid", "lagoslakeid", "lagoslakeid",
                  "hub", "lagoslakeid, eventida10400, programname", "hub",
                  "lagoslakeid, eventidc10400, programname")

  if("lagos.source.program" %in% name){
    identifier <- c(identifier, "programname, sourceid")
  }else{
    identifier <- c(identifier, "sourceid","programname, sourceid")
  }

  # number of variables of each data.frame in the list
  variables <- rep(0, length(name))

  for(i in seq_along(name)){
    if(type[i] == "geo"){
      j <- which(names(geo) == name[i])
      variables[i] <- ncol(geo[[j]])
    }else{
      j <- which(names(limno) == name[i])
      variables[i] <- ncol(limno[[j]])
    }
  }


  # Number of observation of each dataframe in the table
  observations <- rep(0, length(name))
  for(i in seq_along(name)){
    if(type[i] == "geo"){
      j <- which(names(geo) == name[i])
      observations[i] <- nrow(geo[[j]])
    }else{
      j <- which(names(limno) == name[i])
      observations[i] <- nrow(limno[[j]])
    }
  }
  group <- c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,
             4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6,
             7, 7, 7, 7, 10, 10, 10, 10, 10, 0, 11,
             0, 11)
  if("lagos.source.program" %in% name){
    group <- c(group, 13)
  }else{
    group <- c(group, 13, 12)
  }

  data.frame(name= I(name),
    type= I(type),
    variables=I(variables),
    observations=I(observations),
    identifier= I(identifier),
    group = I(group))

}

get_if_not_exists <- function(url, destfile){
  if(!file.exists(destfile)){
    download.file(url, destfile)
  }else{
    message(paste0("A local copy of ", url, " already exists on disk"))
  }
}

stop_if_not_exists <- function(src_path) {
  if(!file.exists(src_path)){
    stop(paste0("Dataset not found at: ", src_path, "\n Try running the appropriate `lagos_get*` and/or `lagos_compile` commands."))
  }
}

lagos_path <- function() paste0(rappdirs::user_data_dir(appname = "LAGOS",
                appauthor = "LAGOS"), .Platform$file.sep)

lagos_names <- function(dt) purrr::map(dt, names)
# unlist(lapply(dt, function(x) length(grep("connect", names(x))))) # search tables for column

#' Query LAGOS names
#'
#' Return a vector of table names whose associated tables have
#'  columns that grep to query.
#'
#' @param dt data.frame output of \code{\link[LAGOS]{lagos_load}}
#' @param grep_string character search string to grep to table column names
#' @param scale character filter results by one of:
#' \itemize{
#'     \item county
#'     \item edu
#'     \item hu4
#'     \item hu8
#'     \item hu12
#'     \item state
#' }
#' @export
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' query_lagos_names(dt, "_dep_")
#' query_lagos_names(dt, "_dep_", "hu4")
#' query_lagos_names(dt, "chla")
#' query_lagos_names(dt, "secchi")
#' query_lagos_names(dt, "conn")
#' }
query_lagos_names <- function(dt, grep_string, scale = NA){

  dt_names <- lagos_names(dt)
  names_matches <- unlist(lapply(dt_names,
                    function(x) length(grep(grep_string, x)) > 0))
  res <- names(dt_names)[names_matches]

  res_filtered <- res[grep(scale, res)]

  if(!is.na(scale)){
    if(length(res_filtered) < 1 & length(res) > 1){
      stop(paste0("The '", scale, "' scale does not exist!"))
    }
    res_filtered
  }else{
    res
  }
}

#' Query columnnames
#'
#' Return a vector of column names, given a table name and grep query string.
#'
#' @param dt data.frame
#' @param table_name character
#' @param grep_string character
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' query_column_names(dt, "hu4.chag", "_dep_")
#' query_column_names(dt, "county.chag", "baseflowindex")
#' }
query_column_names <- function(dt, table_name, grep_string){
  dt_names <- lagos_names(dt)
  dt_names[table_name][[1]][grep(grep_string, dt_names[table_name][[1]])]
}

#' Query column keywords
#'
#' Return a vector of column names, given a table name and keyword string.
#'
#' @param dt data.frame
#' @param table_name character
#' @param keyword_string character
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' query_column_keywords(dt, "hu12.chag", "hydrology")
#' }
query_column_keywords <- function(dt, table_name, keyword_string){

  if(!(keyword_string %in% keyword_partial_key()[,1])){
    stop("keyword not found in keyword_partial_key()")
  }

  if(!(table_name %in% names(dt))){
    stop("table not found in 'dt'")
  }

  dt_names <- lagos_names(dt)

  match <- keyword_partial_key()[
    keyword_partial_key()[,1] %in% keyword_string, 2]

  unlist(lapply(match,
                function(x) dt_names[table_name][[1]][
                  grep(x, dt_names[table_name][[1]])
                ]))

}

#' @importFrom curl curl_fetch_memory
#' @importFrom stringr str_extract
get_file_names <- function(url){
  handle <- curl::new_handle(nobody = TRUE)

  headers <- curl::parse_headers(
    curl::curl_fetch_memory(url, handle)$headers)
  fname <- headers[grep("filename", headers)]

  res <- stringr::str_extract(fname, "(?<=\\=)(.*?)\\.csv")
  gsub('\\"', "", res)
}

get_lagos_module <- function(url, folder_name){
  files <- suppressWarnings(paste0(url, "/",
                            readLines(url)))
  file_names <- sapply(files, get_file_names)

  local_dir   <- file.path(tempdir(), folder_name)
  dir.create(local_dir, showWarnings = FALSE)

  file_paths <- file.path(local_dir, file_names)

  invisible(lapply(seq_len(length(files)),
    function(i) get_if_not_exists(files[i], file_paths[i])))

  local_dir
}
