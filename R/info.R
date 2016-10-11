
#' lake_info
#'
#' @param dt data.frame output of \code{\link[LAGOS]{lagos_load}}
#' @param name character lake name not caps sensitive
#' @param state character state name not caps sensitive
#' @importFrom dplyr filter
#' @importFrom lazyeval interp
#'
#' @export
#'
#' @examples \dontrun{
#' dt <- lagos_load("1.054.1")
#'
# focal_lakes <- data.frame(
#'   name = c("Oneida Lake", "Sunapee Lake", "Lake Mendota"),
#'   state = c("New York", "New Hampshire", "Wisconsin"))
#'
#'   apply(focal_lakes, 1, function(x) lake_info(
#'     dt = dt$limno$lake.specific, name = x[1], state = x[2]))
#' }
lake_info <- function(dt, name, state){

  filter_criteria <- lazyeval::interp(~ grepl(name, lagosname1,
                      ignore.case = TRUE))
  dt_filter       <- dplyr::filter_(dt, filter_criteria)

  filter_criteria <- lazyeval::interp(~ grepl(state, state_name,
                      ignore.case = TRUE))
  dplyr::filter_(dt_filter, filter_criteria)

}
