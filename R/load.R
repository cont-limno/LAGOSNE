#' lagos_load
#'
#' @param version character LAGOS database version string
#' @export
#' @examples \dontrun{
#' lagos_load("1.054.1")
#' }
lagos_load <- function(version){
  load(paste0("data_", version, ".RData"))
}
