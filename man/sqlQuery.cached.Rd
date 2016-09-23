\name{sqlQuery.cached}

\alias{sqlQuery.cached}

\title{Query an ODBC Database (Cached)}

\description{
  Wrapper functions to implement caching for the \code{sqlQuery} function
  using RDS-files.
}

\usage{
  sqlQuery.cached(rds, channel, query, ...)
}

\arguments{
  \item{rds}{The name of the file in which the cache is to be stored.}
  \item{channel}{Connection handle as returned by \code{\link{odbcConnect}}.}
  \item{query}{Any valid SQL statement.}
  \item{...}{Additional arguments to be passed to the \code{\link{sqlQuery}}.}
}

\details{
  If the \code{rds} file exists, the object will be loaded from the \code{rds}.
  Otherwise the \code{query} will be sent to the ODBC database via the\
  \code{channel}, and an \code{rds} of the returned object will be saved.
}

\seealso{
  \code{\link{do.call.cached}} which is the wrapper function that performs the caching.

  \code{\link{sqlQuery}} which is called to submit the \code{query} to an ODBC database,
    and retrieve the results.
}

\examples{
  sqlQuery.cached(dbHandle, "SELECT COUNT(*) FROM CUSTOMERS")
}
