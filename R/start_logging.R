#' @title
#' Start Logging
#'
#' @description
#'
#' @details
#' Starts logging by loading the \code{logging} package, resetting the logging
#' (reset = TRUE, the default). Then it sets up a handler to log to the console,
#' and if a file has been specified it sets up a handler to log to the file.
#' Finally a message is logged at the INFO level to indicate that the logging has been started.
#'
#' @seealso
#' \code{\link{logging}} a tentative logging package
#'
#' @examples
#' start_logging()
#' start_logging(file = 'log.txt')
#' start_logging(  level = 'CRITICAL'
#'               , logger = 'my_logger'
#'               , reset = FALSE)
#'
#' @export
start_logging <- function(  level  = 'INFO'
                          , file   = NULL
                          , logger = ''
                          , reset  = TRUE
                         ) {

  if (!requireNamespace("logging", quietly = TRUE)) {
    stop("Logging package needed for this function to work. Please install it.", call. = FALSE)
  }

  if (reset) logging::logReset();

  # Start logging to the console
  logging::addHandler(  logging::writeToConsole
             , level = level
             , logger = logger
            );

  # Start logging to the file (if a file has been specified)
  if (!is.null(file)) {
    logging::addHandler(  logging::writeToFile
               , file = file
               , level = level
               , logger = logger
              );
  }

  # Log that logging has started
  logging::loginfo(paste("Logging started at level:", level), logger = logger);
  if (!is.null(file)) {
    logging::loginfo(paste("Log saved to file:", file), logger = logger);
  }
}
