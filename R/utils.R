#' Load LAGOSNE data from disk
#'
#' A wrapper for \code{\link[utils]{read.table}} with a default set of parameters.
#'
#' @param file_name character
#' @param sep character separator (tab or comma separated values)
#' @param ... Options passed on to \code{\link[utils]{read.table}}
#'
#' @return data.frame
load_lagos_txt <- function(file_name, sep = "\t", ...){

  suppressWarnings(
    read.table(file_name, header = TRUE, sep = sep, quote = "\"",
             dec = ".", strip.white = TRUE, comment.char = "",
             stringsAsFactors = FALSE))
}

#' Summarize all LAGOSNE flat files
#'
#' Generate table summary statistics for all LAGOSNE data frames.
#'
#' @author Masrour Farzan
#' @param lg list output of lagosne_load
#' @examples \dontrun{
#' lg <- lagosne_load("1.087.3")
#' LAGOSNE:::info_table(lg)
#' }
info_table <- function(lg){

  limno_names <- c("epi_nutr", "lakes_limno")
  geo_names   <- !(names(lg) %in% c(limno_names, "locus", "lagos_source_program"))

  limno <- lg[limno_names]
  geo   <- lg[geo_names]

  name <- c(names(geo), names(limno), "lagos_source_program")
  type <- c(rep("geo", length(geo)), rep("limno", length(limno)), "source")
  identifier <- c("county_zoneid","county_zoneid","county_zoneid",
                  "county_zoneid", "edu_zoneid", "edu_zoneid", "edu_zoneid",
                  "edu_zoneid", "hu4_zoneid", "hu4_zoneid", "hu4_zoneid",
                  "hu4_zoneid", "hu8_zoneid", "hu8_zoneid", "hu8_zoneid",
                  "hu8_zoneid", "hu12_zoneid", "hu12_zoneid", "hu12_zoneid",
                  "hu12_zoneid", "iws_zoneid","iws_zoneid", "iws_zoneid",
                  "state_zoneid", "state_zoneid", "state_zoneid",
                  "state_zoneid", "lagoslakeid", "lagoslakeid",
                  "lagoslakeid", "lagoslakeid", "lagoslakeid",
                  "lagoslakeid", "lagoslakeid, eventida10873, programname",
                  "lagoslakeid", "programname, sourceid")

  # number of variables of each data.frame in the list
  variables <- rep(0, length(name))

  for(i in seq_along(name)){
    if(type[i] == "geo"){
      j            <- which(names(geo) == name[i])
      variables[i] <- ncol(geo[[j]])
    }else{
      j <- which(names(limno) == name[i])
      if(length(j) != 0){
        variables[i] <- ncol(limno[[j]])
      }else{
        variables[i] <- ncol(lg[[
          names(lg)[which(names(lg) == name[i])]]])
      }
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

      if(length(j) != 0){
        observations[i] <- nrow(limno[[j]])
      }else{
        observations[i] <- nrow(lg[[
          names(lg)[which(names(lg) == name[i])]]])
      }

    }
  }

  group <- c(1, 1, 1, 1,
             2, 2, 2, 2,
             3, 3, 3, 3,
             4, 4, 4, 4,
             5, 5, 5, 5,
             6, 6, 6,
             7, 7, 7, 7,
             10, 10, 10, 10, 10,
             11, 11, 11,
             13)

  data.frame(name= I(name),
    type= I(type),
    variables=I(variables),
    observations=I(observations),
    identifier= I(identifier),
    group = I(group))

}

#' @importFrom curl curl_download
get_if_not_exists <- function(url, destfile, overwrite){
  if(!file.exists(destfile) | overwrite){
    curl::curl_download(url, destfile)
  }else{
    message(paste0("A local copy of ", url, " already exists on disk"))
  }
}

stop_if_not_exists <- function(src_path) {
  if(!file.exists(src_path)){
    stop(paste0("Dataset not found at: ", src_path, "\n Try running the `lagosne_get` command."))
  }
}

#' Return the cross-platform data path designated for LAGOSNE.
#'
#' @export
lagos_path <- function() paste0(rappdirs::user_data_dir(appname = "LAGOSNE",
                appauthor = "LAGOSNE"), .Platform$file.sep)

lagos_names <- function(dt) purrr::map(dt, names)
# unlist(lapply(dt, function(x) length(grep("connect", names(x))))) # search tables for column

#' Query LAGOSNE names
#'
#' Return a vector of table names whose associated tables have
#'  columns that grep to query.
#'
#' @param dt data.frame output of \code{\link[LAGOSNE]{lagosne_load}}
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
#' query_lagos_names("_dep_")
#' query_lagos_names("_dep_", "hu4")
#' query_lagos_names("chla")
#' query_lagos_names("secchi")
#' query_lagos_names("conn")
#' }
query_lagos_names <- function(grep_string, scale = NA, dt = lagosne_load()){

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

#' Query column names
#'
#' Return a vector of column names, given a table name and grep query string.
#'
#' @param dt data.frame
#' @param table_name character
#' @param grep_string character
#' @examples \dontrun{
#' dt <- lagosne_load("1.087.3")
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
#' dt <- lagosne_load("1.087.3")
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

#' @importFrom httr GET content
get_lagos_module <- function(edi_url, pasta_url, folder_name, overwrite){

  id <- httr::content(httr::GET(pasta_url), encoding = "UTF-8")
  id <- strsplit(id, "\n")[[1]]
  files <- suppressWarnings(paste0(edi_url, "&entityid=", id))

  file_names <- sapply(files, get_file_names)

  files      <- files[!is.na(file_names)]
  file_names <- file_names[!is.na(file_names)]

  local_dir   <- file.path(tempdir(), folder_name)
  dir.create(local_dir, showWarnings = FALSE)

  file_paths <- file.path(local_dir, file_names)

  invisible(lapply(seq_len(length(files)),
    function(i){
      message(paste0("Downloading ", file_names[i], " ..."))
      get_if_not_exists(files[i], file_paths[i], overwrite)
      }))

  local_dir
}

# from the Hmisc package
capitalize <- function(string) {
  capped <- grep("^[A-Z]", string, invert = TRUE)
  substr(string[capped], 1, 1) <- toupper(substr(string[capped], 1, 1))
  return(string)
}

pad_huc_ids <- function(dt, col_name, len){
  id_num <- as.numeric(dt[, col_name])
  res <- formatC(id_num, width = len, digits = 0, format = "f", flag = "0")
  dt[,col_name] <- as.character(res)
  dt
}

format_nonscientific <- function(x){
  if(is.na(as.numeric(x))){
    x
  }else{
    trimws(
      format(
        as.numeric(x), scientific = FALSE, drop0trailing = TRUE)
    )
  }
}

tidy_name_prefixes <- function(nms){

  prefixes_key <- data.frame(prefix      = c("hu4_", "iws_", "state_",
                                             "nhd_", "hu8_", "hu12_",
                                             "edu_", "county_", "hu6_",
                                             "^lakes_",
                                             "tp_", "toc_", "tn_", "tkn_",
                                             "tdp_", "tdn_", "srp_",
                                             "secchi_", "no2no3_", "no2_",
                                             "nh4_", "doc_", "dkn_", "colort_",
                                             "colora_", "chla_", "ton_"),
                             stringsAsFactors = FALSE)
  prefixes_key$replacement <- rep("", nrow(prefixes_key))

  prefix_matches <- list()
  for(i in seq_along(prefixes_key$prefix)){
    prefix_matches[[i]] <- stringr::str_which(
      nms$raw, prefixes_key$prefix[i])
  }

  prefix_matches <- tidyr::unnest(tibble::enframe(prefix_matches))
  prefix_matches <- apply(prefix_matches, 1, function(x)
    c(nms$raw[x[2]], prefixes_key$prefix[x[1]]))
  prefix_matches <- data.frame(t(prefix_matches), stringsAsFactors = FALSE)

  if(nrow(prefix_matches) != 0 & ncol(prefix_matches) != 0){
    names(prefix_matches) <- c("raw", "prefix")
    nms <- merge(nms, prefix_matches, all.x = TRUE)
  }

  for(i in seq_along(nms$formatted[!is.na(nms$prefix)])){
    nms$formatted[!is.na(nms$prefix)][i] <-
      gsub(
        nms$prefix[!is.na(nms$prefix)][i], "",
        nms$raw[!is.na(nms$prefix)][i])
  }
  nms$formatted[is.na(nms$formatted)] <- nms$raw[is.na(nms$formatted)]

  nms
}

key_names <- function(nms){
  # match cleaned names to a key
  name_key <- data.frame(formatted  = c("ha", "perimkm",
                                        "maxdepth", "lake_perim_meters",
                                        "lakeareaha", "samplemonth",
                                        "sampleyear", "sampledate",
                                        "meandepth", "zoneid"),
                         cleaned = c("Area (ha)", "Perimeter (km)",
                                     "Max Depth", "Perimeter (m)",
                                     "Lake Area (ha)", "Month",
                                     "Year", "Date",
                                     "Mean Depth", "ID"),
                         stringsAsFactors = FALSE)
  nms <- merge(nms, name_key, all.x = TRUE)

  nms$formatted[is.na(nms$formatted)] <-
    nms$raw[is.na(nms$formatted)]
  nms$cleaned[is.na(nms$cleaned)] <- nms$formatted[is.na(nms$cleaned)]

  nms
}

tidy_name_suffixes <- function(nms){
  # match suffixes to a key
  suffixes_key <- data.frame(raw       = c("_count$", "_ha$", "_km$",
                                           "_m$", "_pct$", "_mperha$",
                                           "_pointsperha$", "_pointspersqkm$",
                                           "_pointcount$"),
                             formatted = c(" (n)", " (ha)", " (km)",
                                           " (m)", " (%)", " (n/ha)",
                                           " (n/ha)", " (n/km2)", " (n)"),
                             stringsAsFactors = FALSE)

  for(i in seq_along(suffixes_key$raw)){
    nms$cleaned <- gsub(suffixes_key$raw[i],
                        suffixes_key$formatted[i],
                        nms$cleaned, fixed = FALSE)
  }

  nms
}

url_exists <- function(url){
  handle <- curl::new_handle(nobody = TRUE)

  tryCatch(
    length(curl::parse_headers(
      curl::curl_fetch_memory(url, handle)$headers)) > 0,
    error = function(e) FALSE
  )
}
