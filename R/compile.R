
#'@name lagosne_compile
#'@title Compile LAGOSNE data
#'@export
#'@description Compile LAGOSNE data from component flat files
#'@param version character LAGOSNE database version string
#'@param format character choice of "rds" or "sqlite"
#'@param limno_folder file.path to limno export folder.
#'@param geo_folder file.path to geo export folder.
#'@param locus_folder file.path to locus export folder.
#'@param dest_folder file.path optional will default to the location returned
#'by \code{\link[rappdirs]{user_data_dir}}
#'@importFrom utils read.table
#'@importFrom rappdirs user_data_dir
#'@examples \dontrun{
#' lagosne_compile("1.087.1", format = "rds",
#'  limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
#'  geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
#'  locus_folder = "~/Downloads/LAGOS-NE-GEO-LOCUS-EXPORT")
#' }
#'
lagosne_compile <- function(version, format = "rds",
                          limno_folder = NA, geo_folder = NA,
                          locus_folder = NA, dest_folder = NA){

  ingest <- lagos_ingest(version = version, limno_folder = limno_folder,
                         geo_folder = geo_folder, locus_folder = locus_folder)

  geo    <- ingest$geo
  limno  <- ingest$limno
  locus  <- ingest$locus

  dir.create(lagos_path(), recursive = TRUE, showWarnings = FALSE)

  if(format == "sqlite"){

    my_db <- dplyr::src_sqlite(file.path(lagos_path(), "LAGOS.sqlite3"),
              create = TRUE)

    invisible(lapply(seq_along(geo),
      function(i, dt = geo) dplyr::copy_to(my_db, dt[[i]], names(dt)[[i]],
      temporary = FALSE)))

    invisible(lapply(seq_along(limno),
      function(i, dt = limno) dplyr::copy_to(my_db, dt[[i]], names(dt)[[i]],
      temporary = FALSE)))

  }else{

    res <- list("geo" = geo,
                "limno" = limno,
                "locus" = list(locus))
    res <- purrr::flatten(res)

    outpath <- file.path(lagos_path(), paste0("data_", version, ".rds"))

    saveRDS(res, outpath)
    message(paste0("LAGOSNE compiled to ", outpath))
  }
}
