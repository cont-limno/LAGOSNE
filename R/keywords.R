keyword_full_key <- function(){
  res <- data.frame(rbind(
    c("waterquality", "chla"),
    c("waterquality", "colora"),
    c("waterquality", "colort"),
    c("waterquality", "dkn"),
    c("waterquality", "doc"),
    c("waterquality", "nh4"),
    c("waterquality", "no2"),
    c("waterquality", "no2no3"),
    c("waterquality", "srp"),
    c("waterquality", "tdn"),
    c("waterquality", "tdp"),
    c("waterquality", "tkn"),
    c("waterquality", "tn"),
    c("waterquality", "toc"),
    c("waterquality", "ton"),
    c("waterquality", "tp")
    # ,c("waterquality", "secchi")
  ), stringsAsFactors = FALSE)

  names(res) <- c("keyword", "definition")
  res
}

keyword_partial_key <- function(){
  res <- data.frame(rbind(
    c("deposition", "_dep_"),
    c("climate", "prism"),
    c("waterquality", "chla"),
    c("waterquality", "colora"),
    c("waterquality", "colort"),
    c("waterquality", "dkn"),
    c("waterquality", "doc"),
    c("waterquality", "nh4"),
    c("waterquality", "no2"),
    c("waterquality", "no2no3"),
    c("waterquality", "srp"),
    c("waterquality", "tdn"),
    c("waterquality", "tdp"),
    c("waterquality", "tkn"),
    c("waterquality", "tn"),
    c("waterquality", "toc"),
    c("waterquality", "ton"),
    c("waterquality", "tp")
    # ,c("waterquality", "secchi")
  ), stringsAsFactors = FALSE)

  names(res) <- c("keyword", "definition")
  res
}

keyword_partial_match <- function(table_column, all_table_names){
  match <- keyword_partial_key()[
              keyword_partial_key()[,1] %in% table_column, 2]

  if(!any(lapply(match, length) > 0 & !is.na(match))){
    match <- table_column
  }else{
    match <- unlist(all_table_names)[grep(match, unlist(all_table_names))]
  }
  match
}

keyword_full_match <- function(table_column){

  match <- keyword_full_key()[
            table_column %in% keyword_full_key()[,1], 2]

  if(!any(lapply(match, length) > 0 & !is.na(match))){
     match <- table_column
  }

  match
}

expand_keywords <- function(table_column, all_table_names){
  partial_matches <- unlist(lapply(table_column,
                      function(x) keyword_partial_match(x, all_table_names)))

  full_matches    <- unlist(lapply(partial_matches, keyword_full_match))

  full_matches
}
