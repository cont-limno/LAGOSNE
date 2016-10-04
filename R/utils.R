#' load_lagos_txt
#'
#' @param file_name character
#'
#' @return data.frame
#' @export
load_lagos_txt <- function(file_name){
  read.table(file_name, header = TRUE, sep = "\t", quote = "", dec = ".", strip.white = TRUE, comment.char = "")
}
