sqlQuery.cached <- function(rds, channel, query, ...) {
  obj <- do.call.cached(rds, sqlQuery, c(channel, query, list(...)));
  return(obj);
}
