
#' Convert table names for display
#'
#' @param nms_raw character vector of column names
#'
#' @importFrom tidyr unnest
#' @importFrom tibble enframe
#' @export
#' @examples \dontrun{
#' lg <- lagosne_load("1.087.3")
#' cbind(names(lg$iws), display_names(names(lg$iws)))
#' cbind(names(lg$county.chag), display_names(names(lg$county.chag)))
#' cbind(names(lg$county.conn), display_names(names(lg$county.conn)))
#' cbind(names(lg$county.lulc), display_names(names(lg$county.lulc)))
#' cbind(names(lg$hu4), display_names(names(lg$hu4)))
#' cbind(names(lg$locus), display_names(names(lg$locus)))
#' cbind(names(lg$epi_nutr), display_names(names(lg$epi_nutr)))
#' cbind(names(lg$lakes_limno), display_names(names(lg$lakes_limno)))
#' cbind(names(lg$lakes.geo), display_names(names(lg$lakes.geo)))
#' }
display_names <- function(nms_raw){

  # nms_raw <- names(lg$locus)
  if(!inherits(nms_raw, "character")){
    stop("This function on works on character vectors.")
  }

  nms <- data.frame(raw = nms_raw,
                    formatted = NA,
                    stringsAsFactors = FALSE)

  nms <- tidy_name_prefixes(nms)
  nms <- key_names(nms)
  nms <- tidy_name_suffixes(nms)

  # detect name collisions - if collision + formatted prefixes bk to collisions
  nms_collisions <- as.character(sapply(seq_len(nrow(nms)), function(x){
    if(length(which(nms$cleaned[x] == nms$cleaned)) > 1){
      paste0(nms$cleaned[x], " (", gsub("_", "", nms$prefix[x]), ")")
    }}))

  nms$cleaned[which(nms_collisions != "NULL")] <- nms_collisions[
    which(nms_collisions != "NULL")]

  # sort back to original order
  nms <- nms[match(nms_raw, nms$raw),]

  # caps formatting
  nms$cleaned[!(nms$cleaned %in% nms_raw)] <-
    capitalize(nms$cleaned[!(nms$cleaned %in% nms_raw)])
  nms$cleaned[!(nms$cleaned %in% nms_raw)] <- gsub("_", " ",
                              nms$cleaned[!(nms$cleaned %in% nms_raw)])

  # convert usa and nwi to all caps
  nms$cleaned <- gsub("usa", "USA", nms$cleaned)
  nms$cleaned <- gsub("nwi", "NWI", nms$cleaned)

  nms$cleaned
}
