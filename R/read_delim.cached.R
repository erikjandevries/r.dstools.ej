#' @title
#' Read a delimited file into a data frame (Cached)
#'
#' @description
#' Wrapper functions to implement caching for \code{\link{read_delim}}-based functions from the \code{readr} package using RDS-files.
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
#' \code{\link{read_delim}} which is called to read the delimited data file.
#'
#' @examples
#' read_csv.cached("testdata.rds", "data/testdata.csv")
#'
#' @export
read_delim.cached <- function(rds, file, ...) {
obj <- do.call.cached(rds, read_delim, c(file, list(...)));
return(obj);
}

#' @rdname read_delim.cached
#'
#' @export
read_csv.cached <- function(rds, file, ...) {
obj <- do.call.cached(rds, read_csv, c(file, list(...)));
return(obj);
}

#' @rdname read_delim.cached
#'
#' @export
read_csv2.cached <- function(rds, file, ...) {
obj <- do.call.cached(rds, read_csv2, c(file, list(...)));
return(obj);
}

#' @rdname read_delim.cached
#'
#' @export
read_tsv.cached <- function(rds, file, ...) {
obj <- do.call.cached(rds, read_tsv, c(file, list(...)));
return(obj);
}
