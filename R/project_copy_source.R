#' @export
project_copy_source <- function(always = FALSE) {
  logging::loginfo("Copying source code to output folder");

  copy <- always
  if (!is.null(project_config$copy.source.to.output)) {
    if (project_config$copy.source.to.output) {
      copy <- TRUE
    }
  }

  tmp_folder <- project_output_folder()
  project_output_folder("Source")

  file.copy(  from="Source"
              , to=project_output_folder_path()
              , recursive = TRUE
              , copy.mode = TRUE);

  flist <- c(  list.files(  getwd(), "^start.*[.]R$"
                            , full.names = TRUE
                            , ignore.case = TRUE)
               , list.files(  getwd(), "^.+[.]yml$"
                              , full.names = TRUE
                              , ignore.case = TRUE));
  file.copy(  from=flist
              , to=project_output_folder_path()
              , recursive = TRUE
              , copy.mode = TRUE);
  rm(flist);

  invisible(project_output_folder(tmp_folder))
}
