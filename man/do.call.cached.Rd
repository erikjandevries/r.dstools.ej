\name{do.call.cached}
\alias{do.call.cached}
\title{Cached do.call}
\usage{
do.call.cached(rdsFileName, name, ...)
}
\description{
Calls a function and caches the resulting object as an RDS-file.
}
\examples{
do.call.cached("testdata.rds", "read.csv", "testdata.csv");
}
