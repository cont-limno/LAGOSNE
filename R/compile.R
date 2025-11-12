
#'@name lagosne_compile
#'@title Compile LAGOSNE data
#'
#'@description Compile LAGOSNE data from component flat files. This function should rarely be called directly outside of manual updating of source data.
#'
#'@param version character LAGOSNE database version string
#'@param limno_folder file.path to limno export folder
#'@param geo_folder file.path to geo export folder
#'@param locus_folder file.path to locus export folder
#'@param dest_folder file.path optional will default to the location returned
#'by \code{\link[rappdirs]{user_data_dir}}
#'
#'@importFrom utils read.table
#'@importFrom rappdirs user_data_dir
#'@importFrom qs2 qsave
#'@export
#'
#'@examples \dontrun{
#' lagosne_compile("1.087.3",
#'  limno_folder = "~/Downloads/LAGOS-NE-LIMNO-EXPORT",
#'  geo_folder   = "~/Downloads/LAGOS-NE-GEO-EXPORT",
#'  locus_folder = "~/Downloads/LAGOS-NE-LOCUS-EXPORT",
#'  dest_folder = lagos_path())
#' }
#'
lagosne_compile <- function(version,
                          limno_folder = NA, geo_folder = NA,
                          locus_folder = NA, dest_folder = NA){

  if(is.na(dest_folder)){
    stop("Set the dest_folder argument to a folder on your local machine. Recommended setting is lagos_path().")
  }

  ingest <- lagos_ingest(version = version, limno_folder = limno_folder,
                         geo_folder = geo_folder, locus_folder = locus_folder)

  geo    <- ingest$geo
  limno  <- ingest$limno
  locus  <- ingest$locus

  dir.create(lagos_path(), recursive = TRUE, showWarnings = FALSE)

  res <- list("geo" = geo,
              "limno" = limno,
              "locus" = list(locus))
  res <- purrr::flatten(res)

  outpath <- file.path(dest_folder, paste0("data_", version, ".qs"))

  qs::qsave(res, outpath)
  message(paste0("LAGOSNE compiled to ", outpath))
}
