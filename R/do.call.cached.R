do.call.cached <- function(rds, what, args, quote = FALSE, envir = parent.frame()) {
  # If a cached object exists,
  if (!is.null(rds)) {
    if (file.exists(rds)) {
      # load the RDS
      logging::logwarn(paste("Loading previously cached RDS:", rds));
      obj <- readRDS(rds);
      # and return the object
      return(obj);
    }
  }

  # Otherwise call the function

  # Determine the function name
  if (is.character(what)) fname <- what
  else fname <- as.character(substitute(what));

  # Call the function
  logging::logdebug(paste("Calling function:", what));
  obj <- do.call(what, args = args, quote = quote, envir = envir);

  # Save the object as an RDS file
  if (!is.null(rds)) {
    logging::loginfo(paste("Saving RDS:", rds));
    saveRDS(obj, rds);
  }

  # Return the object
  return(obj);
}
