#' @export
models_reset <- function() {
  models <- list()
  assign("models",
         list2env(models),
         envir=globalenv())
}
