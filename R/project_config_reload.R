#' @export
project_reload_config <- function(config_file = NULL,
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
  assign("project_config",
         config::get(file = config_file, use_parent = FALSE),
         envir=globalenv())

  # Remove the temporary DTS object
  rm(DTS, envir = globalenv())
}
