do.call.cached <- function(rdsFileName, name, ...) {
  # If a cached object exists,
  if (!is.null(rdsFileName)) {
    if (file.exists(rdsFileName)) {
      # load the RDS
      logging::logwarn(paste("Loading previously cached RDS:", rdsFileName));
      obj <- readRDS(rdsFileName);
      # and return the object
      return(obj);
    }
  }

  # Otherwise call the function
  logging::logdebug(paste(  "Calling function:", name
                          , "with arguments:", paste(list(...), collapse = ", ")
                         ));
  obj <- do.call(name, list(...));

  # Save the object as an RDS file
  if (!is.null(rdsFileName)) {
    logging::loginfo(paste("Saving RDS:", rdsFileName));
    saveRDS(obj, rdsFileName);
  }

  # Return the object
  return(obj);
}
