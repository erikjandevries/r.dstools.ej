#' @export
restart_project <- function(  log_level = "DEBUG"
                            , log_file  = "log.txt"
                           ) {
  ######## Initialisation ########
  # Close any open devices (if an error occurs while saving an image, a device may be left open)
  for (d in dev.list()) { dev.off(); }; rm(d);
  # Clear the Global Environment
  rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv);
  gc();
  # Clear the console screen
  cat("\014");

  ######## Logging ########
  start_logging(level = log_level, file = log_file);
  if (requireNamespace("logging", quietly = TRUE)) {
    logging::loginfo(paste("Current working directory:", getwd()));
  }
}
