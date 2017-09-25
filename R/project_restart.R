#' @title
#' Restart a project
#'
#' @description
#' (Re)starts the project.
#'
#' @details
#' (Re)starts the project by performing the following steps:
#' \itemize{
#' \item Clears the environment.
#' \item Sets \code{.libPaths} if specified.
#' \item Loads the project configuration file into an R variable \code{project_config}.
#' \item Ensures all the folders specified in the configuration file exist.
#' \item Initialises logging.
#' }
#'
#' @param lib A character vector with the locations of R library trees.
#' @param config_file A string specifying the path to the configuration file. If not specified, the \code{config.yml} file in the working directory will be loaded if it exists, otherwise a default configuration file will be loaded from the package.
#'
#' @seealso
#' \code{\link{.libPaths}}
#'
#' \code{\link{project_config_reload}}
#'
#' \code{\link{ensure_folder}}
#'
#' \code{\link{logging}}
#'
#' @examples
#' project_restart()
#' project_restart("my_config.yml")
#'
#' @export
project_restart <- function(lib = NULL,
                            config_file = NULL
                            ) {

  # Default values ----------------------------------------------------------

  if (is.null(lib)) {
    lib <- .libPaths()
  }


  # Preparation -------------------------------------------------------------

  # Close any open devices (if an error occurs while saving an image, a device may be left open)
  for (d in dev.list()) { try(dev.off()) }; rm(d)
  # Clear the Global Environment
  rm(list = ls(globalenv()), envir = globalenv())
  gc()
  # Clear the console screen
  cat("\014")


  # Library path ------------------------------------------------------------

  .libPaths(lib)


  # Configuration -----------------------------------------------------------

  project_config_reload(config_file)


  # Prepare folders ---------------------------------------------------------

  if (!is.null(project_config$clean.up.output.folder)) {
    if (project_config$clean.up.output.folder) {
      if (dir.exists(project_config$folders$out)) {
        print("Removing output folder")
        unlink(project_config$folders$out, recursive = TRUE)
      }
    }
  }
  for (folder in project_config$folders) {
    ensure_folder(folder)
  }; rm(folder)


  # Logging -----------------------------------------------------------------

  logging::logReset()
  logging::basicConfig(level = project_config$logging$level)
  logging::addHandler(  logging::writeToFile
               , file   = paste(project_config$folders$out, project_config$files$log, sep="/")
               , level  = project_config$logging$level
               , logger = '')

  # Log some basic
  logging::loginfo(paste0("Configuration:               ", attr(project_config, "config")))
  logging::loginfo(paste0("Logging started at level:    ", project_config$logging$level))
  logging::loginfo(paste0("User account:                ", Sys.info()[["login"]]))
  logging::loginfo(paste0("Working directory:           ", getwd()))
  logging::loginfo(paste0("Output directory:            ", project_config$folders$out))

}
