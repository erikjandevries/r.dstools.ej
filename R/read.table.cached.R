read.table.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.table, c(file, list(...)));
  return(obj);
}

read.csv.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.csv, c(file, list(...)));
  return(obj);
}

read.csv2.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.csv2, c(file, list(...)));
  return(obj);
}

read.delim.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.delim, c(file, list(...)));
  return(obj);
}

read.delim2.cached <- function(rds, file, ...) {
  obj <- do.call.cached(rds, read.delim2, c(file, list(...)));
  return(obj);
}
