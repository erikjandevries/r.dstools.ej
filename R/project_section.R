#' @export
project_section <- function(name, folder = NULL) {
  logging::loginfo(paste("Starting section:", name))

  if (!is.null(folder)) {
    assign("outputFolder",
           paste(project_config$folders$output, folder, sep="/"),
           envir = globalenv())
    ensure_folder(outputFolder)
  }
}
