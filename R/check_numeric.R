##' @title Check if character vector is a number
##' Regex "looks for decimal numbers, with optional HYPHEN MINUS and optional
##' FULL STOP plus zero or more decimal numbers following."
##'
##' From https://stackoverflow.com/a/4247184/13945974
##'
##' @return A boolean
##' @author Shir Dekel
##' @export
##' @param x A character vector
check_numeric <- function(x) {
  x %>%
    stringr::str_detect("^-?\\d+\\.?\\d*$") %>%
    all(na.rm = TRUE)
}
