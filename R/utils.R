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
