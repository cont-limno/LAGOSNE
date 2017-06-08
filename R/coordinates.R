
#' coordinatize
#' @description Turn a LAGOS flat file into a spatial object using a reasonable
#'  default projection
#' @param dt data.frame
#' @param latname character name of latitude column; default is "nhd_lat"
#' @param longname character name of longitude column; defailt is "nhd_long"
#' @param projstring character projection string; default is WGS84-lat-long
#' @importFrom sp coordinates proj4string CRS
#' @export
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' res <- coordinatize(dt$locus)
#'
#' library(maps)
#' map("state", xlim = sp::bbox(res)[c(1,3)], ylim = sp::bbox(res)[c(2,4)])
#' sp::plot(res, add = TRUE, pch = 19, cex = 0.05)
#' }
coordinatize <- function(dt, latname = "nhd_lat", longname = "nhd_long",
                         projstring = "+init=epsg:4326"){

  sp::coordinates(dt) <- c(longname, latname)
  sp::proj4string(dt) <- sp::CRS(projstring)

  dt
}
