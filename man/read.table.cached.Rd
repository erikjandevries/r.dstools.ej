\name{read.table.cached}

\alias{read.table.cached}
\alias{read.csv.cached}
\alias{read.csv2.cached}
\alias{read.delim.cached}
\alias{read.delim2.cached}

\title{Data Input (Cached)}

\description{
  Wrapper functions to implement caching for \code{read.table}-based functions
  using RDS-files.
}

\usage{
  read.table.cached(rds, file, ...)

  read.csv.cached(rds, file, ...)

  read.csv2.cached(rds, file, ...)

  read.delim.cached(rds, file, ...)

  read.delim2.cached(rds, file, ...)
}

\arguments{
  \item{rds}{The name of the file in which the cache is to be stored.}
  \item{file}{The name of the file which the data are to be read from.}
  \item{...}{Additional parameters to be passed on to the base function.}
}

\details{
  If the \code{rds} exists, it will be read. Otherwise the \code{file} will
  be read and an \code{rds} of the resulting object will be saved.
}

\seealso{
  \code{\link{do.call.cached}} which wraps around the \code{read.table}-based
    functions and performs the caching.

  \code{\link{read.table}} which is called to read the data file.
}

\examples{
  read.csv.cached("testdata.rds", "data/testdata.csv")
}
