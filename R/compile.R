
#'@name lagos_compile
#'@title Compile LAGOS data
#'@description Compile LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@importFrom utils read.table
#'@import rappdirs
#'@examples \dontrun{
#'lagos_compile("1.054.1")
#'}
#'
lagos_compile <- function(version){

  ingest <- lagos_ingest(version = version)

  geo    <- ingest$geo
  limno  <- ingest$limno
  info <- info_table(geo, limno)

  destdir <- rappdirs::user_data_dir("LAGOS")  # dir.exists(destdir)
  dir.create(destdir, showWarnings = FALSE)

  saveRDS(list("geo" = geo, "limno" = limno, "info" = info),
          paste0(destdir, "/data_", version, ".rds"))
}
