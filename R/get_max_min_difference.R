##' @title Get max/min NPV difference
##'
##' @param data Data
##' @param npv_amount NPV amount
##' @param ... Grouping variables
##' @return A dataframe
##' @author Shir Dekel
##' @export
get_max_min_difference <- function(data, npv_amount, ...) {
  max_min_difference <-
    data %>%
    dplyr::nest_by(.data$id, ...) %>%
    dplyr::mutate(
      max_npv = data %>%
        dplyr::slice_max({{ npv_amount }}) %>%
        dplyr::pull(.data$allocation) %>%
        unique(),
      min_npv = data %>%
        dplyr::slice_min({{ npv_amount }}) %>%
        dplyr::pull(.data$allocation) %>%
        unique(),
      max_min_difference = .data$max_npv - .data$min_npv
    ) %>%
    tidyr::unnest(data) %>%
    dplyr::ungroup()

  return(max_min_difference)
}
