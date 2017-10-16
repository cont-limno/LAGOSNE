#' Deprecated functions in the LAGOSNE package
#'
#' These functions are provided for compatibility with older versions of
#' the LAGOSNE package. They may eventually be completely removed.
#' @rdname LAGOSNE-deprecated
#' @name LAGOSNE-deprecated
#' @param ... Parameters to be passed to the modern version of the function
#' @docType package
#' @export  lagos_get lagos_load lagos_select lagos_compile
#' @aliases lagos_get lagos_load lagos_select lagos_compile
#' @section Details:
#' \tabular{rl}{
#'   \code{lagos_get} \tab now a synonym for \code{\link{lagosne_get}}\cr
#'   \code{lagos_load} \tab now a synonym for \code{\link{lagosne_load}}\cr
#'   \code{lagos_select} \tab now a synonym for \code{\link{lagosne_select}}\cr
#'   \code{lagos_compile} \tab now a synonym for \code{\link{lagosne_compile}}\cr
#' }
#'
lagos_get <- function(...){
  .Deprecated("lagosne_get", package = "LAGOSNE")
  lagosne_get(...)
}
lagos_load <- function(...){
  .Deprecated("lagosne_load", package = "LAGOSNE")
  lagosne_load(...)
}
lagos_select <- function(...){
  .Deprecated("lagosne_select", package = "LAGOSNE")
  lagosne_select(...)
}
lagos_compile <- function(...){
  .Deprecated("lagosne_compile", package = "LAGOSNE")
  lagosne_compile(...)
}
