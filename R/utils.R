#' load_lagos_txt
#' @description A wrapper for \code{\link[utils]{read.table}} with a default set of parameters.
#' @param file_name character
#' @param sep character seperator (tab or comma seperated values)
#' @param ... Options passed on to \code{\link[utils]{read.table}}
#'
#' @return data.frame
#' @export
load_lagos_txt <- function(file_name, sep = "\t", ...){

  read.table(file_name, header = TRUE, sep = sep, quote = "", dec = ".",
    strip.white = TRUE, comment.char = "")

}

#' info_table
#' @description generate table summary statistics
#' @export
#' @author Masrour Farzan
#' @param geo data.frame
#' @param limno data.frame
#'
info_table <- function(geo, limno){

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
                  "lagoslakeid, eventidc10400, programname",
                  "sourceid","programname, sourceid")
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
             0, 11, 13, 12)

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
    stop(paste0("Dataset not found at: ", src_path,
      ". Try running the appropriate `lagos_get*` and/or `lagos_compile`
      commands."))
  }
}

lagos_path <- function() paste0(rappdirs::user_data_dir(appname = "LAGOS",
                appauthor = "LAGOS"), .Platform$file.sep)

lagos_names <- function(dt) purrr::map(dt, names)

#' query_lagos_names
#' @description return a vector of table names whose associated tables have
#'  columns that grep to query
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
#' dt <- lagos_load("1.054.1")
#' query_lagos_names(dt, "_dep_")
#' query_lagos_names(dt, "_dep_", "hu4")
#' query_lagos_names(dt, "chla")
#' query_lagos_names(dt, "secchi")
#'
#' }
query_lagos_names <- function(dt, grep_string, scale = NA){

  dt_names <- lagos_names(dt)
  names_matches <- unlist(lapply(dt_names,
                    function(x) length(grep(grep_string, x)) > 0))
  res <- names(dt_names)[names_matches]

  res_filtered <- res[grep(scale, res)]

  if(!is.na(scale)){
    if(length(res_filtered) < 1 & length(res) > 1){
      # browser()
      stop(paste0("The '", scale, "' scale does not exist!"))
    }
    res_filtered
  }else{
    res
  }
}

#' query_column_names
#' @description return a vector of column names, given a table name and grep
#'  query string
#' @param dt data.frame
#' @param table_name character
#' @param grep_string character
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#' query_column_names(dt, "hu4.chag", "_dep_")
#' query_column_names(dt, "county.chag", "baseflowindex")
#' }
query_column_names <- function(dt, table_name, grep_string){
  dt_names <- lagos_names(dt)
  dt_names[table_name][[1]][grep(grep_string, dt_names[table_name][[1]])]
}

#' query_column_keywords
#' @description return a vector of column names, given a table name and keyword string
#' @param dt data.frame
#' @param table_name character
#' @param keyword_string character
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#' query_column_keywords(dt, "epi.nutr", "waterquality")
#' }
query_column_keywords <- function(dt, table_name, keyword_string){
  dt_names <- lagos_names(dt)

  match <- keyword_partial_key()[
    keyword_partial_key()[,1] %in% keyword_string, 2]

  dt_names[table_name][[1]][dt_names[table_name][[1]] %in% match]

}
