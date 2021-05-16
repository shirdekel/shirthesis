##' @title Clean separate data

##' @param data_raw_prep Raw data
##'
##' @param names_to names_to vector
##'
##' @return A dataframe
##' @author Shir Dekel
##' @export
clean_data_separate <- function(data_raw_prep, names_to) {
  data_separate <-
    data_raw_prep %>%
    dplyr::filter(
      .data$stage == "project_choice",
      .data$presentation == "separate"
    ) %>%
    dplyr::group_by(.data$subject) %>%
    dplyr::mutate(project_order = 1:length(.data$responses)) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(.data$responses %>%
      # Doesn't work as a single step without pivot_longer()
      purrr::map_dfc(jsonlite::fromJSON) %>%
      tidyr::pivot_longer(
        cols = tidyselect::everything(),
        names_to = names_to,
        names_sep = "_",
        values_to = "choice"
      ))

  return(data_separate)
}
