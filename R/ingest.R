#'@name lagos_ingest
#'@title Ingest LAGOS flat files
#'@description Ingest LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@importFrom utils read.table
#'@examples \dontrun{
#'lagos_ingest("1.054.1")
#'}
#'
lagos_ingest <- function(version){

  folder_version <- gsub("\\.", "", version)

  # Importing Lagos limno data ####
  limno_prefix  <- paste0("data-raw/Limno", folder_version, "/")
  limno_path    <- function(fname){paste0(limno_prefix, fname, "_",
                    folder_version, ".txt")}

  epi.nutr  <- load_lagos_txt(limno_path("lagos_epi_nutr"),
                              colClasses = c(sampledate = "POSIXct"))

  lake.specific<- load_lagos_txt(limno_path("lagos_lakes"))

  secchi       <- load_lagos_txt(limno_path('lagos_secchi'))

  lagos.source <- load_lagos_txt(limno_path('lagos_source'))

  lagos.program<- load_lagos_txt(limno_path('lagos_program'))


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
  names(lakes4ha.buffer100m)[names(lakes4ha.buffer100m) ==
    "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer100m.lulc <-
    load_lagos_txt("data-raw/Geo/lakes4ha_buffer100m_lulc.txt")

  names(lakes4ha.buffer100m.lulc)[names(lakes4ha.buffer100m.lulc) ==
    "lakes4ha_buffer100m_lagoslakeid"] <- "lagoslakeid"

  # SEP EQUALS COMMA?????????????????????????
  lakes4ha.buffer500m <- read.table("data-raw/Geo/lakes4ha_buffer500m.txt",
                                    sep = ",")

  names(lakes4ha.buffer500m)[names(lakes4ha.buffer500m) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"


  lakes4ha.buffer500m.conn <-
    load_lagos_txt("data-raw/Geo/lakes4ha_buffer500m_conn.txt")

  names(lakes4ha.buffer500m.conn)[names(lakes4ha.buffer500m.conn) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lakes4ha.buffer500m.lulc <-
    load_lagos_txt("data-raw/Geo/lakes4ha_buffer500m_lulc.txt")

  names(lakes4ha.buffer500m.lulc)[names(lakes4ha.buffer500m.lulc) ==
    "lakes4ha_buffer500m_lagoslakeid"] <- "lagoslakeid"

  lagoslakes <- load_lagos_txt("data-raw/Geo/lagoslakes_10400.txt")

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
