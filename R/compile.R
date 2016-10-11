
#'@name lagos_compile
#'@title Compile LAGOS data
#'@description Compile LAGOS data from component flat files
#'@param version character LAGOS database version string
#'@param outformat character choice of "rds" or "sqlite"
#'@importFrom utils read.table
#'@import rappdirs
#'@examples \dontrun{
#' lagos_compile("1.054.1", outformat = "sqlite")
#'}
#'
lagos_compile <- function(version, outformat = "rds"){

  ingest <- lagos_ingest(version = version)

  geo    <- ingest$geo
  limno  <- ingest$limno
  info <- info_table(geo, limno)

  destdir <- rappdirs::user_data_dir("LAGOS")  # dir.exists(destdir)
  dir.create(destdir, showWarnings = FALSE)

  if(outformat == "sqlite"){

    # unlink(paste0(destdir, "/LAGOS.sqlite3"))
    my_db <- dplyr::src_sqlite(paste0(destdir, "/LAGOS.sqlite3"),
              create = TRUE)

    invisible(lapply(seq_along(geo),
      function(i, dt = geo) dplyr::copy_to(my_db, dt[[i]], names(dt)[[i]],
      temporary = FALSE)))

    invisible(lapply(seq_along(limno),
      function(i, dt = limno) dplyr::copy_to(my_db, dt[[i]], names(dt)[[i]],
      temporary = FALSE)))

  }else{
    saveRDS(list("geo" = geo, "limno" = limno, "info" = info),
            paste0(destdir, "/data_", version, ".rds"))
  }
}
