#' @title
#' Project Section
#'
#' @description
#' Starts a project section.
#'
#' @export
project_section <- function(name = NULL, folder = NULL) {
  if (is.null(name)) {
    return(project_config$current_section)
  }

  logging::loginfo(paste("Starting section:", name))
  project_config$current_section <- name
  invisible(project_output_folder(folder))
}

#' @rdname project_section
#'
#' @export
project_subsection <- function(name, folder = NULL) {
  if (is.null(name)) {
    return(project_config$current_subsection)
  }

  logging::loginfo(paste("Starting subsection:", name))
  project_config$current_subsection <- name
  invisible(project_output_folder(folder))
}
