#' @title
#' Read text file where columns are separated by whitespace (Cached)
#'
#' @description
#' Wrapper function to implement caching for \code{\link{read_table}} function from the \code{readr} package using RDS-files.
#'
#' @param rds The name of the file in which the cache is to be stored.
#' @param file The name of the file which the data are to be read from.
#' @param ... Additional arguments to be passed to the base function.
#'
#' @details
#' If the \code{rds} file exists, the object will be loaded from the \code{rds}.
#' Otherwise the \code{file} will be read and an \code{rds} of the resulting
#' object will be saved.
#'
#' @seealso
#' \code{\link{do.call.cached}} which is the wrapper function that performs the caching.
#'
#' \code{\link{read_table}} which is called to read the delimited data file.
#'
#' @examples
#' read_table.cached("testdata.rds", "data/testdata.txt")
#'
#' @export
read_table.cached <- function(rds, file, ...) {
obj <- do.call.cached(rds, read_table, c(file, list(...)));
return(obj);
}
