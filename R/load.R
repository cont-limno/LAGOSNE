#' lagos_load
#'
#' @param version character LAGOS database version string
#' @export
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#' }
lagos_load <- function(version){
  readRDS(paste0("data_", version, ".rds"))
}
