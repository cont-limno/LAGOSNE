#' lagos_select
#'
#' @description Select and merge columns based on a nested list of LAGOS tables and column names.
#' @param dt data.frame
#' @param scale character filter results by one of:
#' \itemize{
#'     \item county
#'     \item edu
#'     \item hu4
#'     \item hu8
#'     \item hu12
#'     \item state
#' }
#' @param category character
#' @param table_column_nested nested list of tables and table-columns to select from LAGOS
#' @export
#' @import dplyr
#' @importFrom reshape2 dcast
#'
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#'
#' # select only from limno
#' dt_reduced <- lagos_select(dt, table_column_nested =
#'                 list("epi.nutr" = c("tp", "tn")))
#'
#' # select only from geo
#' dt_reduced <- lagos_select(dt, table_column_nested =
#'                 list("iws.lulc" = c("iws_nlcd2011_pct_95")))
#'
#' # select individual table-columns from limno and geo
#' table_columns <- list("epi.nutr" = c("tp", "tn"),
#'                    "iws.lulc" = c("iws_nlcd2011_pct_95"))
#' dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
#'
#' # select from specific tables using keywords
#' dt_reduced <- lagos_select(dt, table_column_nested = list("epi.nutr" = "waterquality"))
#'
#' # select from multiple specific tables using keywords
#' table_columns <- list("epi.nutr" = c("waterquality"),
#'                    "hu4.chag" = c("deposition"))
#' dt_reduced    <- lagos_select(dt, table_column_nested = table_columns)
#'
#' # select based non-specific tables using keywords
#' dt_reduced <- lagos_select(dt, scale = "HU4",
#'                category = c("waterquality", "deposition"))
#'
#' # select based on inexact keywords and exact table specification
#' table_columns <- list("epi.nutr" = c("doc", "lagoslakeid"))
#' dt_reduced    <- lagos_select(dt, scale = "HU4", category = c("deposition"),
#'                   table_column_nested = table_columns)
#' }
lagos_select <- function(dt, scale = NULL, category = NULL, table_column_nested = NULL){

  nested_full <- table_column_nested
  nested_partial <- NULL

  construct_nested_from_partial <- function(){

    category_match <- keyword_partial_key()[
                        keyword_partial_key()[,1] %in% category, 2]
    table_names    <- unlist(lapply(category_match,
                        function(x) query_lagos_names(dt, x, tolower(scale))))

    res <- data.frame(cbind(table_names, category_match))
    res <- suppressMessages(reshape2::dcast(res, category_match ~ table_names))
    res <- as.list(data.frame(res[,-1, drop = FALSE]))
    res <- lapply(res, function(x) x[!is.na(x)])

    # Expand the entries not listed in keyword_full_key()[,2]?
    expand_partial_keywords <- function(res){
      partial_keyword_elements <- unlist(lapply(res, function(x)
                                    any(!(x %in% keyword_full_key()[,2]))))

      res[partial_keyword_elements] <- list(query_column_names(dt,
                                        names(res[partial_keyword_elements]),
                                        res[partial_keyword_elements]))
      res
    }

    expand_partial_keywords(res)
  }

  if(!is.null(category)){
    nested_partial <- construct_nested_from_partial()
  }

  check_for_partial_full <- function(nested_full){
    partial_full_elements <- unlist(lapply(nested_full, function(x)
                              any(x %in% keyword_full_key()[,1])))

    nested_full[partial_full_elements] <- lapply(seq_along(
                                           nested_full[partial_full_elements]),
                                           function(x)
                                           query_column_keywords(dt,
                                           names(nested_full)[x],
                                           nested_full[[x]]))
  nested_full
  }

  nested_full <- check_for_partial_full(nested_full)

  nested_combined <- c(nested_full, nested_partial)

  ##### combine below into a seperate function
  query_tables <- nested_combined[names(nested_combined) %in%
                                    names(dt)]

  query_data_frames <- lapply(names(query_tables),
                              function(x) dt[which(names(dt) %in% x)])

  all_query_table_names <- lapply(seq_along(query_data_frames),
                              function(x) names(query_data_frames[[x]][[1]]))

  query_tables <- lapply(query_tables, function(x) expand_keywords(x,
                    all_query_table_names))


  # select from all tables based on (expanded) query
  res <- lapply(seq_along(query_data_frames),
                function(x) dplyr::select_(query_data_frames[[x]][[1]],
                                           .dots = query_tables[[x]]))

  names(res) <- names(query_tables)
  res
  # purrr::flatten(res)
}
