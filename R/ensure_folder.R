ensure_folder <- function (folder) {
  if (!dir.exists(folder)) {
    loginfo(paste("Creating folder:", folder));
    return(dir.create(folder, recursive = TRUE));
  } else {
    logdebug(paste("Folder exists:", folder));
    return(TRUE);
  }
}
