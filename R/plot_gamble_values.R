##' @title Plot gamble values
##' @param data Data
##' @return A combined ggplot object
##' @author Shir Dekel
##' @export
plot_gamble_values <- function(data) {

  expected_value_plot <-
    data %>%
    ggplot2::ggplot(ggplot2::aes(y = .data$choice, x = .data$expected_value)) +
    ggplot2::geom_smooth(method = "loess", color = "black") +
    papaja::theme_apa()

  probability_positive_plot <-
    data %>%
    ggplot2::ggplot(ggplot2::aes(y = .data$choice, x = .data$probability_positive)) +
    ggplot2::geom_smooth(method = "loess", color = "black") +
    papaja::theme_apa() +
    ggplot2::theme(axis.title.y = ggplot2::element_blank())

  outcome_positive_plot <-
    data %>%
    ggplot2::ggplot(ggplot2::aes(y = .data$choice, x = .data$outcome_positive)) +
    ggplot2::geom_smooth(method = "loess", color = "black") +
    papaja::theme_apa()+
    ggplot2::theme(axis.title.y = ggplot2::element_blank())

  gamble_values_plot <-
    expected_value_plot + probability_positive_plot + outcome_positive_plot

  return(gamble_values_plot)

}
