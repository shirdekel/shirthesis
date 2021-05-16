##' @title Clean other data

##' @return A daydreamer
##' @author Shir Dekel
##' @export
##' @param data_raw_prep Raw data
##' @param main_stage Main stage name
clean_data_other <- function(data_raw_prep, main_stage) {
  data_other <-
    data_raw_prep %>%
    tidyr::drop_na(.data$responses) %>%
    dplyr::filter(.data$stage != main_stage) %>%
    dplyr::nest_by(.data$subject) %>%
    dplyr::mutate(other = .data$data %>%
      dplyr::pull(.data$responses) %>%
      purrr::map_dfc(jsonlite::fromJSON) %>%
      list()) %>%
    tidyr::unnest(.data$other) %>%
    dplyr::ungroup() %>%
    dplyr::select(-.data$data)

  return(data_other)
}
