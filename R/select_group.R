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
#' table_columns <- list("epi.nutr" = c("waterquality"), "iws.lulc" = c("iws_nlcd2011_pct_95"))
#'
#' dt_reduced <- LAGOS::lagos_select(dt, table_columns)
#' }
lagos_select_group <- function(dt, table_column_nested){

  waterquality = c("chla", "colora", "colort", "dkn", "doc", "nh4", "no2",
                    "no2no3", "srp", "tdn", "tdp", "tkn", "tn", "toc", "ton", "tp",
                    "secchi")
  deposition = grep("_dep_",)
  hydrology = grep("baseflowindex"|"groundwaterrecharge"|"runoff"|"saturationoverlandflow", )
  climate = grep("prism")
  topography = grep("tri"|"slope")
  lulc1992 = grep("nlcd1992")
  lulc2001 = grep("nlcd2001")
  lulc2006 = grep("nlcd2006")
  lulc2011 = grep("nlcd2011")


}
