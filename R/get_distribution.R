##' @title Get distribution
##'
##' For aggregation gambles
##' @param outcome Outcome values
##' @param probability Probability values
##' @param unit Unit for y-axis label
##' @return ggplot object
##' @author Shir Dekel
##' @export
get_distribution <- function(outcome, probability, unit = "$") {
  gambles_table <-
    tibble::tibble(
      outcomes = outcome,
      probs = probability,
      colour_group = dplyr::case_when(
        outcomes > 0 ~ "Gain",
        outcomes < 0 ~ "Loss",
        outcomes == 0 ~ "Zero"
      ) %>%
        forcats::fct_relevel("Gain", after = 2)
    )

  # Have to do this, as opposed to just varying the order vector because of a
  # weird error when running through capsule rmake
  if ("Zero" %in% gambles_table$colour_group) {
    scale_choice <- colorspace::scale_fill_discrete_qualitative("Dark 3",
      order = c(1, 3, 2)
    )
  } else {
    scale_choice <- colorspace::scale_fill_discrete_qualitative("Dark 3",
      order = c(1, 2)
    )
  }

  gambles_table %>%
    ggplot2::ggplot(ggplot2::aes(
      x = .data$outcomes,
      y = .data$probs,
      fill = .data$colour_group
    )) +
    ggplot2::geom_col() +
    scale_choice +
    ggplot2::labs(
      x = paste0("Outcome (", unit, ")"),
      y = "Probability",
      fill = "Outcome type"
    ) +
    ggplot2::scale_x_continuous(breaks = outcome)
}
