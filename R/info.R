
#' Get a summary of lake attribute information
#'
#' Return lake attribute information from its name and state or its lagoslakeid.
#'
#' @param dt list of data.frames. output of \code{\link[LAGOSNE]{lagosne_load}}.
#' @param name character lake name not caps sensitive
#' @param state character state name not caps sensitive
#' @param lagoslakeid numeric lake id
#' @importFrom dplyr filter
#' @importFrom lazyeval interp
#' @importFrom utils adist
#' @importFrom rlang .data
#' @export
#' @examples \dontrun{
#' dt <- lagosne_load("1.087.1")
#' lake_info(dt, lagoslakeid = 4314)
#' lake_info(dt, lagoslakeid = 7441)
#' lake_info(dt, lagoslakeid = 244)
#' lake_info(dt, lagoslakeid = 4686)
#' lake_info(dt, lagoslakeid = 8016)
#' lake_info(dt, lagoslakeid = c(4686, 8016))
#'
#' lake_info(dt, "Sunapee Lake", "New Hampshire")
#' lake_info(dt, name = c("Sunapee Lake", "Oneida Lake"),
#'               state = c("New Hampshire", "New York"))
#' }

lake_info <- function(dt, name = NA, state = NA, lagoslakeid = NA){

  if(class(dt) != "list"){
    stop("dt must be a list (created by the lagosne_load function).")
  }

  if((all(is.na(name)) & !all(is.na(state))) |
     (!all(is.na(name)) & all(is.na(state)))){
    stop("Must provide either a name AND state OR lagoslakeid.")
  }

  if(any(is.na(lagoslakeid)) & any(!(tolower(state) %in% tolower(datasets::state.name)))){
    stop("The state variable must by an unabbreivated character string from datasets::state.name")
  }

  # create data.frame of lake and state names
  if(!all(is.na(lagoslakeid))){
    name_state <- data.frame(lagoslakeid = lagoslakeid, stringsAsFactors = FALSE)

    suppressWarnings(
    name_state <- dplyr::left_join(name_state,
                                   dplyr::select(dt$locus, .data$lagoslakeid,
                                                 .data$state_zoneid, .data$gnis_name),
                                   by = "lagoslakeid"))
    suppressWarnings(
    name_state <- dplyr::left_join(name_state,
                                   dplyr::select(dt$state,
                                                 .data$state_zoneid, .data$state_name),
                                   by = "state_zoneid"))

    name_state <- dplyr::mutate(name_state,
                                name = .data$gnis_name, state = .data$state_name)
    name_state <- dplyr::select(name_state, .data$name, .data$state, .data$lagoslakeid)
  }else{
    lagoslakeid <- rep(NA, length(state))
    name_state <- data.frame(name = name, state = state, lagoslakeid = lagoslakeid,
                             stringsAsFactors = FALSE)
  }

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

  dt <- suppressMessages(dplyr::left_join(dt$lakes_limno,
          locus_state_iws))

  # ---- filtering ----
  do.call("rbind", apply(name_state, 1, function(x){
    lake_info_(dt = dt, name = x[1], state = x[2], llid = x[3])
  }))
}

lake_info_ <- function(dt, name, state, llid){

  if(is.na(name)){
    name  <- as.character(
      dt[dt$lagoslakeid == llid, "lagosname1"])
  }

  # dt_filter       <- dt[which(dt$lagoslakeid == llid),]
  dt_filter       <- dt[dt$state_name %in% state,]

  if(is.na(llid)){
    filter_criteria <- lazyeval::interp(~ agrepl(name, lagosname1,
                                                 ignore.case = TRUE,
                                                 max.distance = 0.1))
    # dt_filter       <- dplyr::filter(dt, !is.na(state_name))
    dt_filter       <- dplyr::filter_(dt_filter, filter_criteria)
  }else{
    dt_filter <- dplyr::filter(dt, lagoslakeid == llid)
  }

  if(nrow(dt_filter) == 0){
    filter_criteria <- lazyeval::interp(~ agrepl(name, gnis_name,
                                                 ignore.case = TRUE,
                                                 max.distance = 0.1))
    dt_filter       <- dplyr::filter_(dt_filter, filter_criteria)
  }

  if(nrow(dt_filter) < 1 & !is.na(state)){
    stop(paste0("Lake '", name, "' in ", state, " not found"))
  }

  dt_filter[which.min(adist(dt_filter$lagosname1, name)),]
}
