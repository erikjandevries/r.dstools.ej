#' @title
#' Install Packages (If Missing)
#'
#' @description
#' Installs packages that have not already been installed.
#'
#' @details
#' Installs packages that have not already been installed.
#' 
#' Packages are not updated with the latest version if an older version has been installed.
#'
#' @param pkgs A character vector of the names of packages which should be installed if they are not installed already.
#' @param lib A character vector giving the library directories where to look for and install the packages. If missing, defaults to the first element of \code{\link{.libPaths()}}.
#' @param ... Additional arguments to be passed to \code{\link{install.packages}}.
#' 
#' @seealso
#' \code{\link{installed.packages}} which is used to determine which packages have already been installed.
#' 
#' \code{\link{install.packages}} which is used to install packages.
#'
#' @examples
#' # Installs the dplyr package:
#' install.packages.ifmissing("dplyr")
#' 
#' # Installs the ggplot2 package, but
#' # will not reinstall the dplyr package.
#' install.packages.ifmissing(c("dplyr", "ggplot2"))
#'
#' @export
install.packages.ifmissing <- function(pkgs, lib = .libPaths(), ...) {
  installedPkgs <- rownames(installed.packages(lib.loc = lib));
  missingPkgs <- c();
  alreadyInstalledPkgs <- c();
  
  for (p in pkgs) {
    if (!(p %in% installedPkgs)) {
      missingPkgs <- c(missingPkgs, p);
    } else {
      alreadyInstalledPkgs <- c(alreadyInstalledPkgs, p);
    }
  }; rm(p);

  logging::logdebug(paste("Packages already installed:", paste(alreadyInstalledPkgs, collapse = ", ")));
  if (length(missingPkgs) > 0) {
    logging::loginfo(paste("Installing new packages:", paste(missingPkgs, collapse = ", ")));
    install.packages(missingPkgs, lib = lib, ...);
  }
}
