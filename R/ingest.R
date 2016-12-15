#'@name lagos_ingest
#'@title Ingest LAGOS flat files
#'@description Ingest LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@param limno_folder file.path to limno export folder. optional.
#'@param geo_folder file.path to geo export folder. optional.
#'@importFrom utils read.table
#'@examples \dontrun{
#'lagos_ingest("1.054.1")
#'}
#'
lagos_ingest <- function(version, limno_folder = NA, geo_folder = NA){

  folder_version <- gsub("\\.", "", version)

  # browser()

  # Set-up paths ####
  if(!is.na(limno_folder)){
    limno_prefix <- paste0(limno_folder, "/")
  }else{
    limno_prefix <- paste0("data-raw/Limno", folder_version, "/")
  }

  limno_path    <- function(fname){paste0(limno_prefix, fname, "_",
                    folder_version, ".txt")}

  if(!is.na(geo_folder)){
    geo_prefix <- paste0(geo_folder, "/")
  }else{
    geo_prefix <- paste0("data-raw/Geo", "/")
  }

  geo_path    <- function(fname){paste0(geo_prefix, fname, ".txt")}

  # Importing Lagos limno data ####
  epi.nutr  <- load_lagos_txt(limno_path("lagos_epi_nutr"),
                              colClasses = c(sampledate = "POSIXct"))

  lake.specific<- load_lagos_txt(limno_path("lagos_lakes"))

  secchi       <- load_lagos_txt(limno_path('lagos_secchi'))

  lagos.source <- load_lagos_txt(limno_path('lagos_source'))

  lagos.program<- load_lagos_txt(limno_path('lagos_program'))


  # Importing Lagos Geo data ####

  # Importing Lagos Geo county data
  county       <- load_lagos_txt(geo_path("county"))

  county.chag  <- load_lagos_txt(geo_path("county_chag"))

  county.conn  <- load_lagos_txt(geo_path("county_conn"))

  county.lulc  <- load_lagos_txt(geo_path("county_lulc"))


  # Importing Lagos Geo edu data
  edu          <- load_lagos_txt(geo_path("edu"))

  edu.chag     <- load_lagos_txt(geo_path("edu_chag"))

  edu.conn     <- load_lagos_txt(geo_path("edu_conn"))

  edu.lulc     <- load_lagos_txt(geo_path("edu_lulc"))


  # Importing Lagos Geo huc4 data
  hu4          <- load_lagos_txt(geo_path("hu4"),
                                 colClasses = c("hu4" = "factor"))

  hu4.chag     <- load_lagos_txt(geo_path("hu4_chag"))

  hu4.conn     <- load_lagos_txt(geo_path("hu4_conn"), as.is = TRUE)

  hu4.lulc     <- load_lagos_txt(geo_path("hu4_lulc"), as.is = TRUE)

  # Importing Lagos Geo huc4 data
  hu8          <- load_lagos_txt(geo_path("hu8"),
                                 colClasses = c("hu8" = "factor"))

  hu8.chag     <- load_lagos_txt(geo_path("hu8_chag"), as.is = TRUE)

  hu8.conn     <- load_lagos_txt(geo_path("hu8_conn"), as.is = TRUE)

  hu8.lulc     <- load_lagos_txt(geo_path("hu8_lulc"), as.is = TRUE)


  # Importing Lagos Geo huc12 data
  hu12         <- load_lagos_txt(geo_path("hu12"),
                                 colClasses = c("hu12" = "factor"))

  hu12.chag    <-  load_lagos_txt(geo_path("hu12_chag"), as.is = TRUE)

  hu12.conn    <-  load_lagos_txt(geo_path("hu12_conn"), as.is = TRUE)

  hu12.lulc    <-  load_lagos_txt(geo_path("hu12_lulc"), as.is = TRUE)


  # Importing Lagos Geo iws data
  iws          <- load_lagos_txt(geo_path("iws"))

  iws.conn     <- load_lagos_txt(geo_path("iws_conn"))

  iws.lulc     <- load_lagos_txt(geo_path("iws_lulc"))


  # Importing Lagos Geo state data
  state        <- load_lagos_txt(geo_path("state"))

  state.chag   <- load_lagos_txt(geo_path("state_chag"))

  state.conn   <- load_lagos_txt(geo_path("state_conn"))

  state.lulc   <- load_lagos_txt(geo_path("state_lulc"))

  # Importing lake buffer data ####

  # SEP EQUALS COMMA?????????????????????????
  lakes4ha.buffer100m <- read.table(geo_path("lakes4ha_buffer100m"),
                                    sep = ",")
  names(lakes4ha.buffer100m)[names(lakes4ha.buffer100m) ==
    "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer100m.lulc <-
    load_lagos_txt(geo_path("lakes4ha_buffer100m_lulc"))

  names(lakes4ha.buffer100m.lulc)[names(lakes4ha.buffer100m.lulc) ==
    "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  # SEP EQUALS COMMA?????????????????????????
  lakes4ha.buffer500m <- read.table(geo_path("lakes4ha_buffer500m"),
                                    sep = ",")

  names(lakes4ha.buffer500m)[names(lakes4ha.buffer500m) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"


  lakes4ha.buffer500m.conn <-
    load_lagos_txt(geo_path("lakes4ha_buffer500m_conn"))

  names(lakes4ha.buffer500m.conn)[names(lakes4ha.buffer500m.conn) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer500m.lulc <-
    load_lagos_txt(geo_path("lakes4ha_buffer500m_lulc"))

  names(lakes4ha.buffer500m.lulc)[names(lakes4ha.buffer500m.lulc) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lagoslakes <- load_lagos_txt(geo_path("lagoslakes_10400"))

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

  list("limno" = limno, "geo" = geo)
  }
