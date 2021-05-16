##' @title Clean combined data

##' @param data_combined Combined data
##'
##' @return A dataframe
##' @author Shir Dekel
##' @export
clean_data_combined <- function(data_combined) {
  data <-
    data_combined %>%
    janitor::remove_empty("cols") %>%
    dplyr::group_by(.data$subject) %>%
    dplyr::mutate(
      choice = dplyr::recode(.data$choice, "Yes" = 1, "No" = 0),
      datetime = .data$dateCreated %>%
        lubridate::dmy_hms(tz = "Australia/Sydney"),
      total_time = max(.data$time_elapsed) / 60000, # Milliseconds to minutes
      proportion = sum(.data$choice) / length(.data$choice),
      dplyr::across(
        c(.data$distribution, .data$awareness, .data$presentation), as.factor
      ),
      dplyr::across(
        where(shirthesis::check_numeric),
        as.numeric
      ),
      gamble = stringr::str_c(
        "(",
        .data$probability_positive,
        ", ",
        .data$outcome_positive,
        "; ",
        1 - .data$probability_positive,
        ", ",
        .data$outcome_positive - .data$outcome_dif,
        ")"
      ) %>%
        as.factor(),
      get_restriction_values(
        .data$probability_positive,
        .data$outcome_positive
      ) %>%
        .[c("expected_value", "gain_loss_ratio")] %>%
        tibble::as_tibble()
    ) %>%
    dplyr::select(
      -c(
        .data$question_order,
        .data$time_elapsed,
        .data$dateCreated,
        .data$responses
      )
    ) %>%
    dplyr::ungroup() %>%
    dplyr::nest_by(
      .data$subject,
      .data$presentation,
      .data$distribution,
      .data$awareness,
      .data$proportion
    ) %>%
    tidyr::unite(
      "condition",
      .data$presentation,
      .data$distribution,
      .data$awareness,
      remove = FALSE
    ) %>%
    dplyr::mutate(dplyr::across(.data$condition, as.factor)) %>%
    tidyr::unnest(data)

  return(data)
}
