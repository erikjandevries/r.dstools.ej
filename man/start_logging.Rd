\name{start_logging}
\alias{start_logging}
\title{Start Logging}
\usage{
start_logging(level = 'WARN', file = NULL, logger = '', reset = TRUE)
}
\description{
Starts logging by loading the package, resetting the logging (reset = TRUE, the
default). Then it sets up a handler to log to the console, and if a file has
been specified it sets up a handler to log to the file. Finally a message is
logged at the INFO level to indicate that the logging has been started.
}
\examples{
start_logging()
start_logging(file = 'log.txt')
start_logging(  level = 'CRITICAL'
              , logger = 'my_logger'
              , reset = FALSE)
}
