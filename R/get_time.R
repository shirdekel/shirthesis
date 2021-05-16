#' Get time elapsed
#'
#' @param df Data
#'
#' @return A numeric value
#' @export
#'
get_time <- function(df) {
    df %>%
        dplyr::pull(.data$time_elapsed) %>%
        max()
}
