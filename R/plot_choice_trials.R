##' @title Get plot for choice x trial with optional grouping
##'
##' @param grouping Grouping variable
##' @param data Data
##'
##' @return A ggplot object
##' @author Shir Dekel
##' @export
plot_choice_trials <- function(data, grouping = NULL) {
  choice_trials_plot <-
    data %>%
    dplyr::filter(presentation == "separate", distribution == "absent") %>%
    dplyr::mutate(
      dplyr::across(
        where(is.factor),
        stringr::str_to_sentence
      )
    ) %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = .data$project_order,
        y = .data$choice,
        color = {{ grouping }},
        linetype = {{ grouping }}
      )
    ) +
    ggplot2::geom_smooth(method = "loess") +
    ggplot2::scale_x_continuous("Trial", breaks = 1:max(data$project_order)) +
    papaja::theme_apa() +
    ggplot2::labs(y = "Proportion of project acceptance")

  return(choice_trials_plot)
}
