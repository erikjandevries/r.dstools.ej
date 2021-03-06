% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_table.cached.R
\name{read_table.cached}
\alias{read_table.cached}
\title{Read text file where columns are separated by whitespace (Cached)}
\usage{
read_table.cached(rds, file, ...)
}
\arguments{
\item{rds}{The name of the file in which the cache is to be stored.}

\item{file}{The name of the file which the data are to be read from.}

\item{...}{Additional arguments to be passed to the base function.}
}
\description{
Wrapper function to implement caching for \code{\link{read_table}} function from the \code{readr} package using RDS-files.
}
\details{
If the \code{rds} file exists, the object will be loaded from the \code{rds}.
Otherwise the \code{file} will be read and an \code{rds} of the resulting
object will be saved.
}
\examples{
read_table.cached("testdata.rds", "data/testdata.txt")

}
\seealso{
\code{\link{do.call.cached}} which is the wrapper function that performs the caching.

\code{\link{read_table}} which is called to read the delimited data file.
}

