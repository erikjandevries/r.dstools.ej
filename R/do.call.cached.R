#' Execute a Function Call (Cached)
#'
#' Wrapper function to implement caching for \code{do.call} using RDS-files.
#'
#' @details
#' If the \code{rds} file exists, the object will be loaded from the \code{rds}.
#' Otherwise the function \code{what} will be called via \code{do.call} and
#' an \code{rds} of the resulting object will be saved.
#'
#' @param rds The name of the file in which the cache is to be stored.
#' @param what Either a function or a non-empty character string naming the function to be called.
#' @param args A \emph{list} of arguments to the function call. The \code{names} attribute of \code{args} gives the argument names.
#' @param quote A logical value indicating whether to quote the arguments.
#' @param envir An environment within which to evaluate the call. This will be most useful if \code{what} is a character string and the arguments are symbols or quoted expressions.
#'
#' @seealso
#' \code{\link{do.call}} which constructs and executes the function call.
#'
#' @examples
#' do.call.cached("testdata.rds", "read.csv", "testdata.csv")
#' do.call.cached("testdata.rds", read.csv, "testdata.csv")
#'
#' @export
do.call.cached <- function(rds, what, args, quote = FALSE, envir = parent.frame()) {
  # If a cached object exists,
  if (!is.null(rds)) {
    if (file.exists(rds)) {
      # load the RDS
      logging::logwarn(paste("Loading previously cached RDS:", rds));
      obj <- readRDS(rds);
      # and return the object
      return(obj);
    }
  }

  # Otherwise call the function

  # Determine the function name
  if (is.character(what)) fname <- what
  else fname <- as.character(substitute(what));

  # Call the function
  logging::logdebug(paste("Calling function:", what));
  obj <- do.call(what, args = args, quote = quote, envir = envir);

  # Save the object as an RDS file
  if (!is.null(rds)) {
    logging::loginfo(paste("Saving RDS:", rds));
    saveRDS(obj, rds);
  }

  # Return the object
  return(obj);
}
