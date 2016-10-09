#'@name identDector
#'@title Detect "identifiers"...
#'@param list vector of data.frame names
#'@return vector
#'@description given a vector contains dataframes names return a vector of dataframes identifiers
identDetector <- function(list){
  x <- rep("", length(list))

  for(i in 1:length(list)){
    j <- which(informationTable[,"name"] == list[i])
    y <- informationTable[j, "identifier"]
    y <-  strsplit(y, ",")
    x[i] <- y[[1]][1]
  }

  x <- x[x != "hub"]

  if ("sourceid" %in% x){
    x <- c(x, "programname")
  }

  if("programname" %in% x){
    x <- c(x, "lagoslakeid")
  }
  return(unique(x))
}

#'@name readCol
#'@title Return the position of a column name?
#'@description Return the position of a column name?
#'@param name character?
#'@param geo data.frame output of \code{\link[LAGOS]{lagos_compile}}
#'@param limno data.frame output of \code{\link[LAGOS]{lagos_compile}}
#'@param info data.frame output of \code{\link[LAGOS]{lagos_compile}}
readCol <- function(name, geo, limno, info){

  info_table_row <- which(info[,"name"] == name)
  print(lapply(get(info[info_table_row, "type"])[name], names))

  con <- TRUE
  while(con){
    con <- FALSE
    cat('Which columns from', name, "?" ,'\n')
    x <- readLines(n = 1)
    x <- strsplit(x, ",")
    x <- as.integer(x[[1]])

    if(sum(is.na(x)) != 0){
      cat('The input must be integers separated by "," \n ')
      con <- TRUE
    }else{

      if(min(x) < 1 | max(x) > info[info_table_row, "variables"]){
        cat(' The given column numbers are out of range \n')
        con <- TRUE
      }

    }
  }
  return(sort(x))
}

#'@name sortList
#'@title Sort a list
#'@param list vector of data.frame names
#'@description Sort the given list in a way that merging computation cost less
#'@return list
sortList <- function(list, info){
  x <- rep(0, length(list))
  for(i in 1:length(list)){
    x[i] <- which(info[,"name"] == list[i])
  }
  groups <- info[x, "group"]
  d <- data.frame(list, groups)
  i1 <- groups >= 10
  order1 <- order(groups[i1], decreasing = T)
  order2 <- order(groups[!i1])
  out <- c(list[i1][order1], list[!i1][order2])
  return(out)
}

#'@name stepsfunc
#'@title stepsfunc
#'@description Loops through a list and does something...?
#'@param list list?
#'@param columns numeric?
#'@param identifiers character?
stepsfunc <- function(list, columns, identifiers){
  # Adding necessary information ####
  group <- rep(0, length(list))
  id <- rep("", length(list))
  for(i in 1:length(list)){
    j <- which(informationTable[,"name"] == list[i])
    group[i] <- informationTable[j, "group"]
    y <- informationTable[j, "identifier"]
    y <-  strsplit(y, ",")
    id[i] <- y[[1]][1]

    # Adding necessary columns ####
    type <- informationTable[j, 'type']

    if(type == "limno"){
      j <- which(names(limno) == list[i])
      col <- vector()
      for(k in 1:length(identifiers)){
        x <- which(names(limno[[j]]) == identifiers[k])
        col <- c(col, x)
      }
      columns[[i]] <- unique(sort(c(columns[[i]], col)))
    }
    if(type == "geo"){
      j <- which(names(geo) == list[i])
      col <- vector()
      for(k in 1:length(identifiers)){
        x <- which(names(geo[[j]]) == identifiers[k])
        col <- c(col, x)
      }
      columns[[i]] <- unique(sort(c(columns[[i]], col)))
    }

  }

  # Adding necessary dataframe ####
  newList <- list
  newColumns <- columns

  if(group[1] == 13 | group[1] == 12){
    i <- 1
    if(group[1] == 13 & group[2] != 12){
      group <- append(group, 12, 1)
      newList <- append(newList, "lagos.program", 1)
      id <- append(id, "programname",1)
      col <- list(c(which(names(lagos.program) == "sourceid"),
                    which(names(lagos.program) == "programname")))
      newColumns <- append(newColumns, col, 1)
      i <-2
    }
    if(group[i] == 12 & group[i + 1] != 11){
      group <- append(group, 11, i)
      newList <- append(newList, "epi.nutr", i)
      id <- append(id, "lagoslakeid", i)
      col <- list(c(which(names(epi.nutr) == "programname"),
                    which(names(epi.nutr) == "lagoslakeid")))
      newColumns <- append(newColumns, col, i)
    }

  }
  if(length(identifiers) >= 2 & sum(group == 0) == 0) {
    l <- group < 10
    i <-1
    while(!l[i]){
      i <- i+1
    }
    group <- append(group, 0, i - 1)
    newList <- append(newList, "lagoslakes", i - 1)
    id <- append(id, "hub" ,i - 1)
    col <- vector()
    for(j in 1:length(identifiers)){
      k <- which(names(lagoslakes) == identifiers[j])
      col <- c(col, k)
    }
    newColumns <- append(newColumns, list(col), i - 1)
  }
  out <- list(list = newList, columns = newColumns, ident = id)
  return(out)
}

#'@name multiMerge
#'@title Merge multiple data.frames
#'@description Merge the given list of data frame into one dataframe
#'@param geo data.frame geo table from \code{\link[LAGOS]{lagos_compile}}
#'@param limno data.frame limno table from \code{\link[LAGOS]{lagos_compile}}
#'@param info data.frame info table from \code{\link[LAGOS]{lagos_compile}}
#'@param table_names vector of data.frame names
#'@param columns list
#'@return data.frame
#'@examples \dontrun{
#' dt <- lagos_load("1.054.1")
#' table_names <- c("iws.lulc", "epi.nutr", "iws.conn", "hu4.chag")
#  dt <- multiMerge(geo = dt$geo, limno = dt$limno, info = dt$info, table_names)
#  head(dt)
#'}
#'
multiMerge <- function(geo, limno, info, table_names, columns = list()){

  if(!is.vector(table_names)){
    stop("The input must be a vector of the names of all
         dataframes that must be merged together")
  }
  if(!is.character(table_names)){
    stop("The input vector must contain only the
         names of dataframes")
  }
  if(!all(table_names %in% info[,"name"])){
    stop("Invalid input vector")
  }
  if(length(table_names) <= 1){
    stop("Input vector must contain at list two data frames")
  }
  if(all(c("epi.nutr", "secchi") %in% table_names)){
    stop("Can not merge epi.nutr and secchi in a same dataframe")
  }

  # Read the column part ####
  table_names <- sortList(table_names, info)
  if(length(columns) == 0){
    for(i in seq_along(table_names)){
      columns[[i]] <- readCol(table_names[i], geo, limno, info)
    }
  }

  # Adding necessary steps ####
  identifiers <- identDetector(table_names)
  steps <- stepsfunc(list, columns, identifiers)

  # Merging process ####
  n <- which(informationTable[,"name"] == steps$list[1])
  type <- informationTable[n, "type"]
  if(type == "limno"){
    n <- which(names(limno) == steps$list[1])
    out1  <- limno[[n]][,steps$columns[[1]]]
  }
  if(type == "geo"){
    n <- which(names(geo) == steps$list[1])
    out1  <- geo[[n]][,steps$columns[[1]]]
  }
  j <- 1
  for(i in 2:length(steps$list)){
    n <- which(informationTable[,"name"] == steps$list[i])
    type <- informationTable[n, "type"]
    if(type == "limno"){
      n <- which(names(limno) == steps$list[i])
      out2 <- limno[[n]][,steps$columns[[i]]]
    }
    if(type == "geo"){
      n <- which(names(geo) == steps$list[i])
      out2 <- geo[[n]][,steps$columns[[i]]]
    }
    if(steps$id[[j]] == "hub"){
      j <- j + 1
    }
    out1 <- merge(out1, out2, by.x = steps$id[[j]], by.y = steps$id[[j]])
    j <- j + 1
  }
  return(out1)
  }

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
#' table_column_nested <- list("iws.lulc" = c("lakeconnection"),
#'  "hu4.chag" = c("hu4_baseflowindex_min"))
#'
#' lagos_select(dt, table_column_nested)
#' }
lagos_select <- function(dt, table_column_nested){

  limno_tables <- table_column_nested[names(table_column_nested) %in% names(dt$limno)]
  geo_tables   <- table_column_nested[names(table_column_nested) %in% names(dt$geo)]

  # create a list of data.frame objects from geo_tables headers
  geo_data_frames <- lapply(names(geo_tables), function(x) dt$geo[which(names(dt$geo) %in% x)])

  # select corresonding columns from geo_tables contents
  # return data.frame objects
  # lapply(seq_along(geo_data_frames), function(x) head(geo_data_frames[[x]][[1]]))

  # return column names
  # lapply(seq_along(geo_data_frames), function(x) (geo_tables[[x]]))

  geo_data <- lapply(seq_along(geo_data_frames), function(x) dplyr::select_(geo_data_frames[[x]][[1]], unlist(geo_tables[[x]])))
  head(geo_data)

  # print(lapply(get(info[info_table_row, "type"])[name], names))
}
