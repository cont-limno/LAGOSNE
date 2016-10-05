
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
  geo    <- ingest$geo
  limno  <- ingest$limno

  #data1 <- merge(lake.specific[,c(1, 15, 17, 19, 21, 23)], epi.nutr,
  # by.x = "lagoslakeid", by.y = "lagoslakeid" )

  ## Creating information table ####
  info <- info_table(geo, limno)

  # Saving the Data frame ####
  # rm(i, identifier, j, name, type, variables, observations, group)

  saveRDS(list("geo" = geo, "limno" = limno, "info" = info),
          paste0("data_", version, ".rds"))
  #save.image(file = paste0("data_", version, ".RData"))
}
