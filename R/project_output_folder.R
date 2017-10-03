#' @title
#' Project Output Folder
#'
#' @description
#' Get or set the current output folder.
#'
#' @export
project_output_folder <- function(folder = NULL) {
  # If a new folder isn't specified, return the current folder
  if (is.null(folder)) {
    return(project_config$current_output_folder)
  }

  # Otherwise, set the current output folder
  logging::loginfo(paste("Setting output folder:", folder))
  project_config$current_output_folder <- folder
  ensure_folder(project_output_folder_path())
}

#' @rdname project_output_folder
#'
#' @export
project_output_folder_path <- function() {
  if (is.null(project_config$current_output_folder)) {
    return(project_config$folders$output)
  }
  if (is.na(project_config$current_output_folder) |
      project_config$current_output_folder == "") {
    return(project_config$folders$output)
  }

  return(paste(project_config$folders$output,
               project_config$current_output_folder,
               sep="/"))
}
