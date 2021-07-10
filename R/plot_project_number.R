##' @title Plot project number data
##'
##' @param condition Condition name
##' @param data Data
##'
##' @return A plot
##' @author Shir Dekel
##' @export
plot_project_number <- function(data, condition = NULL) {
  project_number_plot <- data %>%
    dplyr::nest_by(.data$subject, {{ condition }}, .data$project_number) %>%
    ggplot2::ggplot(ggplot2::aes(.data$project_number, color = {{ condition }})) +
    ggplot2::geom_freqpoly(bins = 20) +
    papaja::theme_apa()

  return(project_number_plot)
}
