#' lagos_select
#'
#' @description Select and merge columns based on a nested list of LAGOS tables and column names.
#' @param dt data.frame
#' @param scale what spatial scale should be kept. Scale refers to the spatial extent at which the variable was calculated. For detailed descriptions of each spatial scale, see Additional File 7 of Soranno et al. (2015). Possible scales include:
#' \itemize{
#'     \item "county" - political divisions within states
#'     \item "edu" - ecological drainage units, delineated regions which generally share biotic, geographic and climatic characteristics.
#'     \item "hu4" - the second level of classification from the nested watershed boundary dataset, called a subregion, with 65 HU4s in the LAGOS study extent.
#'     \item "hu8" - the fourth level of classification from the nested watershed boundary dataset, called a watershed, with 511 HU8s in the LAGOS study extent.
#'     \item "hu12" - the sixth level of classification from the nested watershed boundary dataset, with 20257 HU12s in the LAGOS study extent.
#'     \item "state" - states of the U.S., with 17 states in the LAGOS study extent.
#'     \item "iws" - interlake watersheds, defined as the area of land that drains directly into a lake, with a watershed for each 51065 lakes in the LAGOS study extent.
#'     \item "buffer100m" - a 100 meter buffer around the lake polygon, with a buffer for each 51065 lakes in the LAGOS study extent
#'     \item "buffer500m" - a 500 meter buffer around the lake polygon, with a buffer for each 51065 lakes in the LAGOS study extent
#' }
#' @param category what type of variables should be kept. Note not all scale-category options are available. Variable categories include:
#' \itemize{
#'     \item "water.quality" - includes all in-situ chemistry, chlorophyll, and water clarity measurements.
#'     \item "deposition" - all atmospheric deposition variables from the .chag tables
#'     \item "hydrology" - baseflow, groundwater, runoff, and overland flow variables from the .chag tables
#'     \item "climate" - 30-year normal precipitation and temperature variables from the .chag tables
#'     \item "geology" - all surficial geology variables from the .chag tables
#'     \item "topography" - Terrain Roughness Index and slope variables from the .lulc tables
#'     \item "lulc1992" - all 1992 land use/land cover variables from the .lulc tables
#'     \item "lulc2001" - all 2001 land use/land cover variables from the .lulc tables
#'     \item "lulc2006" - all 2006 land use/land cover variables from the .lulc tables
#'     \item "lulc2011" - all 2011 land use/land cover variables from the .lulc tables
#'     \item "lakes" - all lake connectivity metrics from the .conn tables
#'     \item "wetlands" - all wetland connectivity metrics from the .conn tables
#'     \item "streams" - all stream/river connectivity metrics from the .conn tables
#' }
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
#' dt_reduced <- lagos_select(dt, scale = "county", category = c("hydrology"))
#'
#' # select based on inexact keywords and exact table specification
#' table_columns <- list("epi.nutr" = c("doc", "lagoslakeid"))
#' dt_reduced    <- lagos_select(dt, scale = "HU4", category = c("deposition"),
#'                   table_column_nested = table_columns)
#' }
lagos_select <- function(dt, scale = NULL, category = NULL, table_column_nested = NULL){

  nested_full <- table_column_nested
  nested_partial <- NULL

  if(!is.null(category)){
    nested_partial <- construct_nested_from_partial(
                        category = category,
                        scale = scale)
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

  validate_query_tables <- function(query_data_frames, query_tables){
    all_names <- lapply(seq_along(query_data_frames),
           function(x) names(query_data_frames[[x]][[1]]))

    select_names <- lapply(seq_along(query_data_frames),
                           function(x) query_tables[[x]])

    x_validate <- lapply(seq_along(query_data_frames),
           function(x) query_tables[[x]] %in% all_names[[x]])

    x_validate_table <- lapply(x_validate, function(x) !x[[1]])

    if(any(unlist(x_validate_table))){
      bad_table_pos <- which(unlist(x_validate_table))
      bad_tables    <- names(query_tables)[bad_table_pos]
      bad_column_pos <- which(!unlist(x_validate[bad_table_pos]))
      bad_columns    <- query_tables[bad_table_pos][[1]][bad_column_pos]
      stop("The '", bad_tables, "' table does not contain a '",
           bad_columns, "' column!")
    }

  }

  validate_query_tables(query_data_frames, query_tables)

  # select from all tables based on (expanded) query
  res <- lapply(seq_along(query_data_frames),
                function(x) dplyr::select_(query_data_frames[[x]][[1]],
                                           .dots = query_tables[[x]]))

  names(res) <- names(query_tables)
  res
}

construct_nested_from_partial <- function(category, scale){
  category_match <- keyword_partial_key()[
    keyword_partial_key()[,1] %in% category, 2]

  if(length(category_match) == 0){
    stop(paste0("The '", category, "' category does not exist!"))
  }

  table_names    <- unlist(lapply(category_match,
                        function(x) query_lagos_names(dt, x, tolower(scale))))

  res <- data.frame(cbind(table_names, category_match))
  res <- suppressMessages(reshape2::dcast(res, category_match ~ table_names))
  res <- as.list(data.frame(res[,-1, drop = FALSE]))
  res <- lapply(res, function(x) x[!is.na(x)])

  expand_partial_keywords <- function(res){
    partial_keyword_elements <- unlist(lapply(res, function(x)
      any(!(x %in% keyword_full_key()[,2]))))

    grepped_keywords <- lapply(res[partial_keyword_elements][[1]],
                               function(x) query_column_names(dt,
                               names(res[partial_keyword_elements]), x))

    res[partial_keyword_elements] <- list(unlist(grepped_keywords))

    res
  }

  expand_partial_keywords(res)
}
