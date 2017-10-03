#' @title
#' Project packages
#'
#' @description
#' Installs packages if missing and loads the libraries
#'
#' @details
#' Installs packages if missing and loads the libraries
#'
#' @param pkgs A character vector with the required packages.
#'
#' @seealso
#' \code{\link{install.packages.ifmissing}}
#' \code{\link{library}}
#'
#' @examples
#' project_packages("dplyr")
#' project_packages(c("dplyr", "ggplot2"))
#'
#' @export
project_packages <- function(pkgs) {
  install.packages.ifmissing(pkgs)
  for (p in pkgs) {
    library(p, character.only = TRUE);
  }
}


