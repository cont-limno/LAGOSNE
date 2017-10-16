
#' Convert a LAGOSNE flat file into a spatial object
#'
#' This function turns a data.frame into a spatial object using a reasonable
#'  default projection.
#'
#' @param dt data.frame
#' @param latname character name of latitude column; default is "nhd_lat"
#' @param longname character name of longitude column; defailt is "nhd_long"
#' @param crs numeric epsg code; default is 4326 WGS84-lat-long
#' @importFrom sf st_as_sf
#' @export
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' res <- coordinatize(dt$locus)
#'
#' library(maps)
#' map("state", xlim = c(-97.90363, -66.99892), ylim = c(34.61761, 49.41941))
#' plot(res$geometry, add = TRUE, pch = 19, cex = 0.05)
#' }
coordinatize <- function(dt, latname = "nhd_lat", longname = "nhd_long",
                         crs = 4326){

  dt <- sf::st_as_sf(dt, coords = c(longname, latname), crs = crs)
  dt
}
