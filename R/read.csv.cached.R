read.csv.cached <- function(rdsFileName, csvFileName, ...) {
  obj <- do.call.cached(rdsFileName, "read.csv", csvFileName, ...);
  return(obj);
}
