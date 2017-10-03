#' @title
#' Reload Project Config
#'
#' @description
#' (Re)loads the project configuration file.
#'
#' @details
#' Loads or reloads the project configuration file into an R variable \code{project_config}.
#'
#' The previous DateTime Stamp will be preserved is so indicated.
#'
#' @param config_file A string specifying the path to the configuration file. If not specified, the \code{config.yml} file in the working directory will be loaded if it exists, otherwise a default configuration file will be loaded from the package.
#' @param keepDTS A boolean flag indicating whether the previously set DateTime Stamp should be reused (if \code{project_reload_config} has been used before to set \code{project_config$DTS}).
#'
#' @seealso
#' \code{\link{project_restart}}.
#'
#' @examples
#' project_config_reload()
#' project_config_reload("my_config.yml")
#'
#' @export
project_config_reload <- function(config_file = NULL,
                                  keepDTS = FALSE
                                  ) {
  if (is.null(config_file)) {
    if (file.exists("config.yml")) {
      config_file <- "config.yml"
    } else {
      config_file <- system.file("config", "config.yml", package="dstools.ej", mustWork = TRUE)
    }
  }

  ######## Parameters ########
  # Sys.setenv(R_CONFIG_ACTIVE = "")
  # Sys.setenv(R_CONFIG_ACTIVE = "acceptance")
  # Sys.setenv(R_CONFIG_ACTIVE = "production")

  # Determine the DateTime Stamp
  if (keepDTS & exists("project_config")) {
    assign("DTS",
           as.POSIXlt(project_config$DTS, "UTC"),
           envir=globalenv())
  } else {
    assign("DTS",
           as.POSIXlt(Sys.time(), "UTC"),
           envir=globalenv())
  }

  # Load the configuration
  project_config <- config::get(file = config_file, use_parent = FALSE)
  assign("project_config",
         list2env(project_config),
         envir=globalenv())

  # Remove the temporary DTS object
  rm(DTS, envir = globalenv())
}
