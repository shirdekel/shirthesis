#' Generate relevant indefinite given string
#'
#' @param str A string
#'
#' @return A string
#' @export
#'
get_indefinite <- function(str) {
  if (str %>% stringr::str_detect("^[aeiou]")) {
    out <- "an"
  } else {
    out <- "a"
  }
  return(out)
}
