##' @title Remove duplicates
##'
##' Group by Prolific ID, rank each ID's completion time, and only take the
##' first one.
##'
##' @return A data frame
##' @author Shir Dekel
##' @export
##' @param data Data
remove_duplicates <- function(data) {
  duplicates_removed <-
    data %>%
    dplyr::group_by(.data$prolific) %>%
    dplyr::mutate(date_rank = dplyr::dense_rank(.data$datetime)) %>%
    dplyr::filter(.data$date_rank == 1) %>%
    dplyr::ungroup()

  return(duplicates_removed)
}
