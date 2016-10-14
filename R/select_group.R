#' lagos_select_group
#'
#' @description Select and merge columns based on a nested list of LAGOS tables and groups of variables.
#' @param dt data.frame
#' @param table_group_nested nested list of tables and groups of columns to select from LAGOS. See details for
#' a list of possible table and group combinations
#' @export
#' @import dplyr
#' @details This function takes advantage of predefined groups of variables within each LAGOS table.
#' The possible table and group combinations include:
#' \n \enumerate{
#' Groups for the "limno" tables include water.quality (all chemistry + chlorophyll + water clarity measures).
#' \item Groups for "geo" .chag tables include deposition (all atmospheric deposition related variables),
#' hydrology (basefloe, groundwater, runoff and overland flow variables), climate (30-year normal precipitation and temperature variables),
#' and geology (all surficial geology variables)
#' \item Groups for the "geo" .lulc tables include topography (Terrain Roughness Index and slope variables),
#' lulc1992 (all LULC variables from 1992), lulc2001, lulc2006, lulc2011.
#' \item Groups for the "geo" .conn tables include lakes (all lake connectivity metrics),
#' wetlands (all wetland connectivity metrics) and streams (all stream/river connectivity metrics)
#'
#'
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#'
#' table_columns <- list("epi.nutr" = c("tp", "tn"), "iws.lulc" = c("iws_nlcd2011_pct_95"))
#'
#' dt_reduced <- LAGOS::lagos_select(dt, table_columns)
#' }
lagos_select_group <- function(dt, table_column_nested){

  water.quality = c("chla", "colora", "colort", "dkn", "doc", "nh4", "no2",
                    "no2no3", "srp", "tdn", "tdp", "tkn", "tn", "toc", "ton", "tp",
                    "secchi")
  deposition = grep("_dep_", x = )
  hydrology = grep("baseflowindex"|"groundwaterrecharge"|"runoff"|"saturationoverlandflow", )
  climate =
  topography =
  lulc1992 =
  lulc2001 =
  lulc2006 =
  lulc2011 =

    limno_tables <- table_column_nested[names(table_column_nested) %in%
                                          names(dt$limno)]
  geo_tables   <- table_column_nested[names(table_column_nested) %in%
                                        names(dt$geo)]



  # create a list of data.frame objects from geo_tables headers
  geo_data_frames   <- lapply(names(geo_tables),
                              function(x) dt$geo[which(names(dt$geo) %in% x)])
  limno_data_frames <- lapply(names(limno_tables),
                              function(x) dt$limno[which(names(dt$limno) %in% x)])

  # pull out variable names from the group select feature


  geo_data <- lapply(seq_along(geo_data_frames),
                     function(x) dplyr::select_(geo_data_frames[[x]][[1]],
                                                .dots = geo_tables[[x]]))

  limno_data <- lapply(seq_along(limno_data_frames),
                       function(x) dplyr::select_(limno_data_frames[[x]][[1]],
                                                  .dots = limno_tables[[x]]))

  unlist(list(geo_data = geo_data, limno_data = limno_data),
         recursive = FALSE)
}
