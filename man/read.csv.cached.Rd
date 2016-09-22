\name{read.csv.cached}
\alias{read.csv.cached}
\title{Read CSV cached}
\usage{
read.csv.cached(rdsFileName, csvFileName, ...)
}
\description{
Loads the RDS file if it exists, or
reads the CSV file and saves it as an RDS file.
}
\examples{
read.csv.cached("testdata.rds", "data/testdata.csv")
}
