#' @title
#' Data Input (Cached)
#'
#' @description
#' Wrapper functions to implement caching for \code{\link{read.table}}-based functions using RDS-files.
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
#' \code{\link{read.table}} which is called to read the data file.
#'
#' @examples
#' read.csv.cached("testdata.rds", "data/testdata.csv")
#'
#' @export
read.table.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.table, c(file, list(...)));
  return(obj);
}

#' @rdname read.table.cached
#'
#' @export
read.csv.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.csv, c(file, list(...)));
  return(obj);
}

#' @rdname read.table.cached
#'
#' @export
read.csv2.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.csv2, c(file, list(...)));
  return(obj);
}

#' @rdname read.table.cached
#'
#' @export
read.delim.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.delim, c(file, list(...)));
  return(obj);
}

#' @rdname read.table.cached
#'
#' @export
read.delim2.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.delim2, c(file, list(...)));
  return(obj);
}
