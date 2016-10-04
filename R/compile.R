
#'@name lagos_compile
#'@title Compile LAGOS data
#'@description Compile LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@importFrom utils read.table
#'@examples
#'
#'lagos_compile("1.054.1")
#'
lagos_compile <- function(version){

  # Importing Lagos limno data ####
  epi.nutr  <- load_lagos_txt("data-raw/Limno10541/lagos_epi_nutr_10541.txt",
                             colClasses = c(sampledate = "POSIXct"))

  lake.specific<- load_lagos_txt("data-raw/Limno10541/lagos_lakes_10541.txt")

  secchi       <- load_lagos_txt('data-raw/Limno10541/lagos_secchi_10541.txt')

  lagos.source <- load_lagos_txt('data-raw/Limno10541/lagos_source_10541.txt')

  lagos.program<- load_lagos_txt('data-raw/Limno10541/lagos_program_10541.txt')


  # Importing Lagos Geo data ####

  # Importing Lagos Geo county data
  county       <- load_lagos_txt("data-raw/Geo/county.txt")

  county.chag  <- load_lagos_txt("data-raw/Geo/county_chag.txt")

  county.conn  <- load_lagos_txt("data-raw/Geo/county_conn.txt")

  county.lulc  <- load_lagos_txt("data-raw/Geo/county_lulc.txt")


  # Importing Lagos Geo edu data
  edu          <- load_lagos_txt("data-raw/Geo/edu.txt")

  edu.chag     <- load_lagos_txt("data-raw/Geo/edu_chag.txt")

  edu.conn     <- load_lagos_txt("data-raw/Geo/edu_conn.txt")

  edu.lulc     <- load_lagos_txt("data-raw/Geo/edu_lulc.txt")


  # Importing Lagos Geo huc4 data
  hu4          <- load_lagos_txt("data-raw/Geo/hu4.txt",
                        colClasses = c("hu4" = "factor"))

  hu4.chag     <- load_lagos_txt("data-raw/Geo/hu4_chag.txt")

  hu4.conn     <- load_lagos_txt("data-raw/Geo/hu4_conn.txt", as.is = TRUE)

  hu4.lulc     <- load_lagos_txt("data-raw/Geo/hu4_lulc.txt", as.is = TRUE)

  # Importing Lagos Geo huc4 data
  hu8          <- load_lagos_txt("data-raw/Geo/hu8.txt",
                        colClasses = c("hu8" = "factor"))

  hu8.chag     <- load_lagos_txt("data-raw/Geo/hu8_chag.txt", as.is = TRUE)

  hu8.conn     <- load_lagos_txt("data-raw/Geo/hu8_conn.txt", as.is = TRUE)

  hu8.lulc     <- load_lagos_txt("data-raw/Geo/hu8_lulc.txt", as.is = TRUE)


  # Importing Lagos Geo huc12 data
  hu12         <- load_lagos_txt("data-raw/Geo/hu12.txt",
                     colClasses = c("hu12" = "factor"))

  hu12.chag    <-  load_lagos_txt("data-raw/Geo/hu12_chag.txt", as.is = TRUE)

  hu12.conn    <-  load_lagos_txt("data-raw/Geo/hu12_conn.txt", as.is = TRUE)

  hu12.lulc    <-  load_lagos_txt("data-raw/Geo/hu12_lulc.txt", as.is = TRUE)


  # Importing Lagos Geo iws data
  iws          <- load_lagos_txt("data-raw/Geo/iws.txt")

  iws.conn     <- load_lagos_txt("data-raw/Geo/iws_conn.txt")

  iws.lulc     <- load_lagos_txt("data-raw/Geo/iws_lulc.txt")


  # Importing Lagos Geo state data
  state        <- load_lagos_txt("data-raw/Geo/state.txt")

  state.chag   <- load_lagos_txt("data-raw/Geo/state_chag.txt")

  state.conn   <- load_lagos_txt("data-raw/Geo/state_conn.txt")

  state.lulc   <- load_lagos_txt("data-raw/Geo/state_lulc.txt")

  # Importing lake buffer data ####

  # SEP EQUALS COMMA?????????????????????????
  lakes4ha.buffer100m <- read.table("data-raw/Geo/lakes4ha_buffer100m.txt",
                                        sep = ",")
  names(lakes4ha.buffer100m)[names(lakes4ha.buffer100m)==
                               "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer100m.lulc <- load_lagos_txt("data-raw/Geo/lakes4ha_buffer100m_lulc.txt")

  names(lakes4ha.buffer100m.lulc)[names(lakes4ha.buffer100m.lulc) ==
                                    "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  # SEP EQUALS COMMA?????????????????????????
  lakes4ha.buffer500m <- read.table("data-raw/Geo/lakes4ha_buffer500m.txt",
                                        sep = ",")

  names(lakes4ha.buffer500m)[names(lakes4ha.buffer500m)==
                               "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"


  lakes4ha.buffer500m.conn <- load_lagos_txt("data-raw/Geo/lakes4ha_buffer500m_conn.txt")

  names(lakes4ha.buffer500m.conn)[names(lakes4ha.buffer500m.conn)==
                                    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer500m.lulc <- load_lagos_txt("data-raw/Geo/lakes4ha_buffer500m_lulc.txt")

  names(lakes4ha.buffer500m.lulc)[names(lakes4ha.buffer500m.lulc)==
                                    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lagoslakes <-  load_lagos_txt("data-raw/Geo/lagoslakes_10400.txt")

  limno <- list(epi.nutr = epi.nutr, lake.specific = lake.specific,
                secchi = secchi, lagos.source = lagos.source,
                lagos.program = lagos.program)
  #rm(epi.nutr, lake.specific, secchi, lagos.source)
  geo <- list(county = county,
              county.chag = county.chag,
              county.conn = county.conn,
              county.lulc = county.lulc,
              edu = edu,
              edu.chag = edu.chag,
              edu.conn = edu.conn,
              edu.lulc = edu.lulc,
              hu4 = hu4,
              hu4.chag = hu4.chag,
              hu4.conn = hu4.conn,
              hu4.lulc = hu4.lulc,
              hu8 = hu8,
              hu8.chag = hu8.chag,
              hu8.conn = hu8.conn,
              hu8.lulc = hu8.lulc,
              hu12 = hu12,
              hu12.chag = hu12.chag,
              hu12.conn = hu12.conn,
              hu12.lulc = hu12.lulc,
              iws = iws,
              iws.conn = iws.conn,
              iws.lulc = iws.lulc,
              state = state,
              state.chag = state.chag,
              state.conn = state.conn,
              state.lulc = state.lulc,
              lakes4ha.buffer100m = lakes4ha.buffer100m,
              lakes4ha.buffer100m.lulc = lakes4ha.buffer100m.lulc,
              lakes4ha.buffer500m = lakes4ha.buffer500m,
              lakes4ha.buffer500m.conn = lakes4ha.buffer500m.conn,
              lakes4ha.buffer500m.lulc = lakes4ha.buffer500m.lulc,
              lagoslakes = lagoslakes)
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
  # number of varibales of each dataframe in the table
  variables <- rep(0, length(name))
  for(i in 1: length(name)){
    if(type[i]=="geo"){
      j <- which(names(geo)==name[i])
      variables[i] <- ncol(geo[[j]])
    }else{
      j <- which(names(limno)==name[i])
      variables[i] <- ncol(limno[[j]])
    }
  }
  # Number of observation of each dataframe in the table
  observations <- rep(0, length(name))
  for(i in 1: length(name)){
    if(type[i]=="geo"){
      j <- which(names(geo)==name[i])
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
