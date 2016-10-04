#'@name identDector
#'@title Not sure what this does
#'@param list vector of data.frame names
#'@return vector
#'@description given a vector contains dataframes names return a vector of dataframes identifiers
identDetector <- function(list){
  x <- rep("", length(list))
  for(i in 1:length(list)){
    j <- which(informationTable[,"name"]==list[i])
    y <- informationTable[j,"identifier"]
    y <-  strsplit(y,",")
    x[i] <- y[[1]][1]
  }
  x <- x[x!="hub"]
  if ("sourceid" %in% x){
    x <- c(x, "programname")
  }
  if("programname" %in% x){
    x <- c(x, "lagoslakeid")
  }
  return(unique(x))
}


readCol <- function(name){
  l <- which(informationTable[,"name"]==name)
  con <- T
  while( con ){
    con <- F
    cat('Which columns from',name,"?" ,'\n')
    x <- readLines( n=1 )
    x <- strsplit(x, ",")
    x <- as.integer(x[[1]])
    if( sum(is.na(x))!= 0 ){
      cat('The input must be integers separated by "," \n ')
      con <- T
    }
    else{
      if(min(x) <1 | max(x) > informationTable[l,"variables"]){
        cat(' The given column numbers are out of range \n')
       con <- T
      }
    }
  }
  return(sort(x))
}

#'@name sortList
#'@title Sort a list
#'@param list vecotr of data.frame names
#'@description Sort the given list in a way that merging computation cost less
#'@return list
sortList <- function(list){
  x <- rep(0, length(list))
  for(i in 1:length(list)){
    x[i] <- which(informationTable[,"name"]==list[i])
  }
  groups <- informationTable[x,"group"]
  d <- data.frame(list, groups)
  i1 <- groups >=10
  order1 <- order(groups[i1], decreasing=T)
  order2 <- order(groups[!i1])
  out <- c(list[i1][order1], list[!i1][order2])
  return(out)
}
stepsfunc <- function(list,columns, identifiers){
  ###########################
  # adding necessary information
  group <- rep(0, length(list))
  id <- rep("", length(list))
  for(i in 1:length(list)){
    j <- which(informationTable[,"name"]==list[i])
    group[i] <- informationTable[j,"group"]
    y <- informationTable[j,"identifier"]
    y <-  strsplit(y,",")
    id[i] <- y[[1]][1]

    ####################################
    # Adding necessary columns
    type <- informationTable[j,'type']

    if(type=="limno"){
      j <- which(names(limno)==list[i])
      col <- vector()
      for(k in 1:length(identifiers)){
        x <- which(names(limno[[j]])==identifiers[k])
        col <- c(col, x)
      }
      columns[[i]] <-unique(sort(c(columns[[i]], col)))
    }
    if(type=="geo"){
      j <- which(names(geo)==list[i])
      col <- vector()
      for(k in 1:length(identifiers)){
        x <- which(names(geo[[j]])==identifiers[k])
        col <- c(col, x)
      }
      columns[[i]] <-unique(sort(c(columns[[i]], col)))
    }

  }
  ###########################
  # adding necessary dataframe
  newList <- list
  newColumns <- columns

  if(group[1]==13 | group[1]==12){
    i <- 1
    if(group[1]==13 & group[2]!=12){
      group <- append(group,12,1)
      newList <- append(newList, "lagos.program", 1)
      id <- append(id, "programname",1)
      col <- list(c(which(names(lagos.program)=="sourceid"),
                    which(names(lagos.program)=="programname") ))
      newColumns <- append(newColumns, col, 1 )
      i <-2
    }
    if(group[i]==12 & group[i+1]!=11){
      group <- append(group,11,i)
      newList <- append(newList, "epi.nutr", i)
      id <- append(id, "lagoslakeid",i)
      col <- list(c(which(names(epi.nutr)=="programname"),
                    which(names(epi.nutr)=="lagoslakeid") ))
      newColumns <- append(newColumns, col, i )
    }

  }
  if(length(identifiers) >= 2 & sum(group==0)==0 ) {
    l <- group < 10
    i <-1
    while(!l[i]){
      i <- i+1
    }
    group <- append(group,0,i-1)
    newList <- append(newList, "lagoslakes", i-1)
    id <- append(id, "hub" ,i-1)
    col <- vector()
    for(j in 1:length(identifiers)){
      k <- which(names(lagoslakes)==identifiers[j])
      col <- c(col, k)
    }
    newColumns <- append(newColumns, list(col), i-1 )
  }
  out <- list(list=newList,columns=newColumns, ident= id)
  return(out)
}

#'@name multiMerge
#'@title Merge multiple data.frames
#'@description Merge the given list of data frame into one dataframe
#'@param list vector of data.frame names
#'@param columns list
#'@return data.frame
multiMerge <- function( list, columns=list()){
  # Error handeling:
  if(!is.vector(list)){
    stop("The input must be a vector of the names of all
         dataframes that must be merged together")
  }
  if(!is.character(list)){
    stop("The input vector must contain only the
         names of dataframes")
  }
  if(!all(list %in% informationTable[,"name"])){
    stop("Invalid input vector")
  }
  if( length(list) <= 1){
    stop("Input vector must contain at list two data frames")
  }
  if( all(c("epi.nutr","secchi") %in% list)){
    stop("Can not merge epi.nutr and secchi in a same dataframe")
  }
  ###############################################
  #Read the column part
  list <-  sortList(list)
  if(length(columns)==0){
    for(i in 1:length(list)){
      columns[[i]] <- readCol(list[i])
    }
  }
  ###############################################
  #Adding necessary steps
  identifiers <- identDetector(list)
  steps <- stepsfunc(list,columns, identifiers)
  ###############################################
  #merging process
  n <- which(informationTable[,"name"]==steps$list[1])
  type <- informationTable[n,"type"]
  if(type=="limno"){
    n <- which(names(limno)==steps$list[1])
    out1  <- limno[[n]][,steps$columns[[1]]]
  }
  if(type=="geo"){
    n <- which(names(geo)==steps$list[1])
    out1  <- geo[[n]][,steps$columns[[1]]]
  }
  j <- 1
  for(i in 2:length(steps$list)){
    n <- which(informationTable[,"name"]==steps$list[i])
    type <- informationTable[n,"type"]
    if(type=="limno"){
      n <- which(names(limno)==steps$list[i])
      out2  <- limno[[n]][,steps$columns[[i]]]
    }
    if(type=="geo"){
      n <- which(names(geo)==steps$list[i])
      out2  <- geo[[n]][,steps$columns[[i]]]
    }
    if(steps$id[[j]]=="hub"){
      j <- j+1
    }
    out1 <- merge(out1, out2, by.x=steps$id[[j]],by.y=steps$id[[j]])
    j <- j+1
  }
  return(out1)
  }


