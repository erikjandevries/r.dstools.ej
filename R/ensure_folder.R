#' @export
ensure_folder <- function (folder) {
  if (!dir.exists(folder)) {
    logging::loginfo(paste("Creating folder:", folder));
    return(dir.create(folder, recursive = TRUE));
  } else {
    logging::logdebug(paste("Folder exists:", folder));
    return(TRUE);
  }
}
