start_logging <- function(  level  = 'INFO'
                          , file   = NULL
                          , logger = ''
                          , reset  = TRUE
                         ) {
  library(logging);
  if (reset) logReset();

  # Start logging to the console
  addHandler(  writeToConsole
             , level = level
             , logger = logger
            );

  # Start logging to the file (if a file has been specified)
  if (!is.null(file)) {
    addHandler(  writeToFile
               , file = file
               , level = level
               , logger = logger
              );
  }

  # Log that logging has started
  loginfo(paste("Logging started at level:", level), logger = logger);
  if (!is.null(file)) {
    loginfo(paste("Log saved to file:", file), logger = logger);
  }
}
