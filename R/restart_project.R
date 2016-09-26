#' @export
restart_project <- function() {
  # Close any open devices (if an error occurs while saving an image, a device may be left open)
  for (d in dev.list()) { dev.off(); }; rm(d);
  # Clear the Global Environment
  rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv);
  gc();
  # Clear the console screen
  cat("\014");
}
