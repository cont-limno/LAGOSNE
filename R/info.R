
#' lake_info
#' @description Return lake attribute information from its name and state
#' @param dt list of data.frames. output of \code{\link[LAGOS]{lagos_load}}.
#' @param name character lake name not caps sensitive
#' @param state character state name not caps sensitive
#' @importFrom dplyr filter
#' @importFrom lazyeval interp
#' @importFrom utils adist
#'
#' @export
#'
#' @examples \dontrun{
#' dt <- lagos_load("1.087.1")
#' lake_info(dt, "Benton Pond", "Massachusetts")
#' lake_info(dt, "Sunapee Lake", "New Hampshire")
#'
# focal_lakes <- data.frame(
#'   name = c("Oneida Lake", "Sunapee Lake", "Lake Mendota"),
#'   state = c("New York", "New Hampshire", "Wisconsin"))
#'
#'   apply(focal_lakes, 1, function(x) lake_info(
#'     dt = dt, name = x[1], state = x[2]))
#' }
lake_info <- function(dt, name, state){
  dt$locus$state_zoneid <- as.character(dt$locus$state_zoneid)
  dt$state$state_zoneid <- as.character(dt$state$state_zoneid)
  dt$state$state_name   <- as.character(dt$state$state_name)

  locus_state <- suppressMessages(dplyr::left_join(dt$locus, dt$state,
    by = c("state_zoneid")))

  locus_state_conn <- suppressMessages(dplyr::left_join(
    locus_state, dt$lakes.geo[,c("lagoslakeid", "lakeconnection")],
    by = c("lagoslakeid" = "lagoslakeid")
  ))

  locus_state_iws <- suppressMessages(dplyr::left_join(
    locus_state_conn, dt$iws[,c("lagoslakeid", "iws_ha")],
    by = c("lagoslakeid" = "lagoslakeid")
  ))

  dt <- suppressMessages(dplyr::left_join(dt$lakes.limno,
          locus_state_iws))

  dt <- dt[grepl(state, dt$state_name),]
  filter_criteria <- lazyeval::interp(~ agrepl(name, lagosname1,
                                               ignore.case = TRUE))
  dt_filter       <- dplyr::filter_(dt, filter_criteria)

  if(nrow(dt_filter) < 1){
    stop(paste0("Lake '", name, "' in ", state, " not found"))
  }

  dt_filter[which.min(adist(dt_filter$lagosname1, name)),]
}
