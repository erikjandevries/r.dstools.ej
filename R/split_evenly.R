#' @title
#' Split a vector in equal groups
#'
#' @description
#' Splits a vector into groups of (almost) equal length.
#'
#' @param x A vector containing values to be split into groups.
#' @param n The number of groups to create.
#'
#' @examples
#' split_evenly(1:10, 4)
#'
#' @export
split_evenly <- function (x, n) {
  # Create a list to hold the resulting split
  y <- list();
  # Determine the batch size
  s <- floor(length(x) / n);
  # Determine the remainder
  r <- length(x) %% n;

  if (r>0) {
    # We create r batches with size s+1
    for (i in 1:r) {
      j <- 1 + (i-1) * (s+1);
      y[[i]] <- x[j:(j+s)];
    }
  }
  # and n-r batches with size s
  for (i in 1:(n-r)) {
    j <- 1 + (r * (s+1)) + (i-1) * s;
    y[[r+i]] <- x[j:(j+s-1)];
  }
  return(y)
}
