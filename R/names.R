
#' Convert table names for display
#'
#' @param nms_raw character vector of column names
#'
#' @importFrom tidyr unnest
#' @importFrom tibble enframe
#' @export
#' @examples \dontrun{
#' lg <- lagosne_load("1.087.1")
#' cbind(names(lg$iws), display_names(names(lg$iws)))
#' cbind(names(lg$hu4), display_names(names(lg$hu4)))
#' cbind(names(lg$locus), display_names(names(lg$locus)))
#' cbind(names(lg$epi_nutr), display_names(names(lg$epi_nutr)))
#' }
display_names <- function(nms_raw){

  # nms_raw <- names(lg$locus)
  if(class(nms_raw) != "character"){
    stop("This function on works on character vectors.")
  }

  nms <- data.frame(raw = nms_raw,
                    formatted = NA,
                    stringsAsFactors = FALSE)

  # tidy prefixes
  prefixes_key <- data.frame(prefix      = c("hu4_", "iws_", "state_",
                                             "nhd_", "hu8_", "hu12_",
                                             "edu_", "county_", "hu6_",
                                             "tp_", "toc_", "tn_", "tkn_",
                                             "tdp_", "tdn_", "srp_",
                                             "secchi_", "no2no3_", "no2_",
                                             "nh4_", "doc_", "dkn_", "colort_",
                                             "colora_", "chla_", "ton_"),
                             stringsAsFactors = FALSE)
  prefixes_key$replacement <- rep("", nrow(prefixes_key))

  prefix_matches <- list()
  for(i in seq_along(prefixes_key$prefix)){
    prefix_matches[[i]] <- stringr::str_which(
      nms$raw, prefixes_key$prefix[i])
  }

  prefix_matches <- tidyr::unnest(tibble::enframe(prefix_matches))
  prefix_matches <- apply(prefix_matches, 1, function(x)
    c(nms$raw[x[2]], prefixes_key$prefix[x[1]]))
  prefix_matches <- data.frame(t(prefix_matches), stringsAsFactors = FALSE)

  if(nrow(prefix_matches) != 0){
    names(prefix_matches) <- c("raw", "prefix")
    nms <- merge(nms, prefix_matches, all.x = TRUE)
  }

  for(i in seq_along(nms$formatted[!is.na(nms$prefix)])){
    nms$formatted[!is.na(nms$prefix)][i] <-
          gsub(
              nms$prefix[!is.na(nms$prefix)][i], "",
              nms$raw[!is.na(nms$prefix)][i])
  }
  nms$formatted[is.na(nms$formatted)] <- nms$raw[is.na(nms$formatted)]

  # match cleaned names to a key
  name_key <- data.frame(formatted  = c("ha", "perimkm",
                                        "maxdepth", "lake_perim_meters",
                                        "lakeareaha",
                                        "meandepth", "zoneid"),
                         cleaned = c("Area (ha)", "Perimeter (km)",
                                     "Max Depth", "Perimeter (m)",
                                     "Lake Area (ha)",
                                     "Mean Depth", "ID"),
                    stringsAsFactors = FALSE)
  nms <- merge(nms, name_key, all.x = TRUE)

  nms$formatted[is.na(nms$formatted)] <-
              nms$raw[is.na(nms$formatted)]
  nms$cleaned[is.na(nms$cleaned)] <- nms$formatted[is.na(nms$cleaned)]

  # match suffixes to a key
  suffixes_key <- data.frame(raw       = c("_count$", "_ha$", "_km$",
                                           "_m$"),
                             formatted = c(" (n)", " (ha)", " (km)",
                                           " (m)"),
                             stringsAsFactors = FALSE)

  for(i in seq_along(suffixes_key$raw)){
    nms$cleaned <- gsub(suffixes_key$raw[i],
               suffixes_key$formatted[i],
               nms$cleaned, fixed = FALSE)
  }

  # detect name collisions
  # if collision add formatted prefixes back to collisions
  nms_collisions <- as.character(sapply(seq_len(nrow(nms)), function(x){
    if(length(which(nms$cleaned[x] == nms$cleaned)) > 1){
      paste0(nms$cleaned[x], " (", gsub("_", "", nms$prefix[x]), ")")
    }}))

  nms$cleaned[which(nms_collisions != "NULL")] <- nms_collisions[
    which(nms_collisions != "NULL")]

  # sort back to original order
  nms <- nms[match(nms_raw, nms$raw),]

  # formatting
  nms$cleaned[!(nms$cleaned %in% nms_raw)] <-
    capitalize(nms$cleaned[!(nms$cleaned %in% nms_raw)])
  nms$cleaned[!(nms$cleaned %in% nms_raw)] <- gsub("_", " ",
                              nms$cleaned[!(nms$cleaned %in% nms_raw)])

  # convert usa and nwi to all caps
  nms$cleaned <- gsub("usa", "USA", nms$cleaned)
  nms$cleaned <- gsub("nwi", "NWI", nms$cleaned)

  nms$cleaned
}
