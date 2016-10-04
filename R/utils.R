#' load_lagos_txt
#' @description A wrapper for \code{\link[utils]{read.table}} with a default set of parameters.
#' @param file_name character
#' @param sep character seperator (tab or comma seperated values)
#' @param ... Options passed on to \code{\link[utils]{read.table}}
#'
#' @return data.frame
#' @export
load_lagos_txt <- function(file_name, sep = "\t", ...){

  read.table(file_name, header = TRUE, sep = sep, quote = "", dec = ".", strip.white = TRUE, comment.char = "")

}
