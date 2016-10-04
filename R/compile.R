
#'@name lagos_compile
#'@title Compile LAGOS data
#'@description Compile LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@importFrom utils read.table
#'@examples \dontrun{
#'lagos_compile("1.054.1")
#'}
#'
lagos_compile <- function(version){

  ingest <- lagos_ingest(version = version)

  geo <- ingest$geo
  limno <- ingest$limno
  #data1 <- merge( lake.specific[,c(1,15,17,19,21,23)],epi.nutr,
  #               by.x="lagoslakeid", by.y="lagoslakeid" )

  ## Creating information table ####

  name <- c(names(geo), names(limno))
  type <- c(rep("geo",length(geo)), rep("limno", length(limno)))
  identifier <- c("county_zoneid","county_zoneid","county_zoneid","county_zoneid",
                  "edu_zoneid", "edu_zoneid", "edu_zoneid", "edu_zoneid",
                  "hu4_zoneid", "hu4_zoneid", "hu4_zoneid", "hu4_zoneid",
                  "hu8_zoneid", "hu8_zoneid", "hu8_zoneid", "hu8_zoneid",
                  "hu12_zoneid", "hu12_zoneid", "hu12_zoneid", "hu12_zoneid",
                  "iws_zoneid","iws_zoneid", "iws_zoneid",
                  "state_zoneid", "state_zoneid", "state_zoneid", "state_zoneid",
                  "lagoslakeid", "lagoslakeid",
                  "lagoslakeid", "lagoslakeid", "lagoslakeid",
                  "hub", "lagoslakeid, eventida10400, programname", "hub",
                  "lagoslakeid, eventidc10400, programname", "sourceid","programname, sourceid")
  # number of variables of each data.frame in the list
  variables <- rep(0, length(name))
  for(i in 1: length(name)){
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
  for(i in 1: length(name)){
    if(type[i] == "geo"){
      j <- which(names(geo) == name[i])
      observations[i] <- nrow(geo[[j]])
    }else{
      j <- which(names(limno)==name[i])
      observations[i] <- nrow(limno[[j]])
    }
  }
  group <- c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3,
             4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6,
             7, 7, 7, 7, 10, 10, 10, 10, 10, 0, 11,
             0, 11, 13, 12)
  informationTable <- data.frame(name= I(name),
                                 type= I(type),
                                 variables=I(variables),
                                 observations=I(observations),
                                 identifier= I(identifier),
                                 group = I(group))

  # Saving the Data frame ####
  rm(i, identifier, j, name, type, variables, observations, group)
  save.image(file = paste0("data_", version, ".RData"))
}
