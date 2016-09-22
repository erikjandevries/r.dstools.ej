\name{do.call.cached}

\alias{do.call.cached}

\title{Execute a Function Call (Cached)}

\description{
  Wrapper function to implement caching for \code{do.call} using RDS-files.
}

\usage{
  do.call.cached(rds, what, args, quote = FALSE, envir = parent.frame())
}

\arguments{
  \item{rds}{The name of the file in which the cache is to be stored.}
  \item{what}{Either a function or a non-empty character string naming the
    function to be called.}
  \item{args}{A \emph{list} of arguments to the function call. The \code{names}
    attribute of \code{args} gives the argument names.}
  \item{quote}{A logical value indicating whether to quote the arguments.}
  \item{envir}{An environment within which to evaluate the call. This will be
    most useful if \code{what} is a character string and the arguments are
    symbols or quoted expressions.}
}

\details{
  If the \code{rds} exists, it will be read. Otherwise the function \code{what}
  will be called via \code{do.call} and an \code{rds} of the resulting object
  will be saved.
}


\seealso{
  \code{\link{do.call}} which constructs and executes the function call.
}

\examples{
  do.call.cached("testdata.rds", "read.csv", "testdata.csv");
  do.call.cached("testdata.rds", read.csv, "testdata.csv");
}
