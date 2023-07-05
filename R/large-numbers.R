#' Increment a large number
#'
#' Increment a large number in a raw vector (encoded in little endian) by 1. Done in constant time
#'
#' @useDynLib sodium R_sodium_increment
#' @export
#' @param x raw vector
#' @examples # Increment large number encoded as a raw vector (number is encoded in little endian)
#' r = as.raw(c(0x00, 0x02))
#' sodium::increment(r)
increment <- function(x) {
  stopifnot(is.raw(x))
  .Call(R_sodium_increment, x)
}

#' Test if a large number is zero
#'
#' Test if a large number encoded in little endian is zero. Returns TRUE if all bytes are zero, or FALSE if at least one
#' is not. Done in constant time.
#'
#' @useDynLib sodium R_sodium_is_zero
#' @export
#' @param x raw vector
#' @return logical
#' @examples # Test if
#' r = as.raw(c(0x00, 0x02))
#' sodium::is_zero(r)
#' sodium::is_zero(as.raw(c(0x00, 0x00)))
is_zero <- function(x) {
  stopifnot(is.raw(x))
  .Call(R_sodium_is_zero, x)
}
