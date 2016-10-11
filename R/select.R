#' lagos_select
#'
#' @description Select and merge columns based on a nested list of LAGOS tables and column names.
#' @param dt data.frame
#' @param table_column_nested nested list of tables and table-columns to select from LAGOS
#' @export
#' @import dplyr
#'
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#'
#' table_columns <- list("epi.nutr" = c("tp", "tn"), "iws.lulc" = c("iws_nlcd2011_pct_95"))
#'
#' dt_reduced <- LAGOS::lagos_select(dt, table_columns)
#' }
lagos_select <- function(dt, table_column_nested){

  limno_tables <- table_column_nested[names(table_column_nested) %in%
                    names(dt$limno)]
  geo_tables   <- table_column_nested[names(table_column_nested) %in%
                    names(dt$geo)]

  # create a list of data.frame objects from geo_tables headers
  geo_data_frames   <- lapply(names(geo_tables),
                        function(x) dt$geo[which(names(dt$geo) %in% x)])
  limno_data_frames <- lapply(names(limno_tables),
                        function(x) dt$limno[which(names(dt$limno) %in% x)])

  geo_data <- lapply(seq_along(geo_data_frames),
                     function(x) dplyr::select_(geo_data_frames[[x]][[1]],
                                                .dots = geo_tables[[x]]))

  limno_data <- lapply(seq_along(limno_data_frames),
                       function(x) dplyr::select_(limno_data_frames[[x]][[1]],
                                                  .dots = limno_tables[[x]]))

  unlist(list(geo_data = geo_data, limno_data = limno_data),
         recursive = FALSE)
}
