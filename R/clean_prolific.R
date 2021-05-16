#' Clean Prolific data
#'
#' @param data A dataframe.
#'
#' @return A dataframe.
#' @export
clean_prolific <- function(data) {
  idLocation <- data[1, ] %>%
    stringr::str_which("Prolific") %>%
    as.numeric()
  idVector <- data[idLocation] %>%
    dplyr::pull()
  data %>%
    dplyr::filter(stringr::str_length(idVector) > 20 & .data$Finished == "True")
}
