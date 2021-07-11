##' @title Plot choice data
##'
##' @param data_effects Data
##' @param dv_label DV label
##' @param dv DV
##'
##' @return A combined ggplot object
##' @author Shir Dekel
##' @export
plot_choice <- function(data_effects, dv, dv_label) {
  if (deparse(substitute(dv)) == "choice") {
    data_presentation <- data_effects$presentation
    data_awareness <- data_effects$awareness
    data_distribution <- data_effects$distribution
  } else {
    data_presentation <- data_effects$presentation %>%
      dplyr::nest_by(.data$subject, .data$presentation, {{ dv }}) %>%
      dplyr::ungroup()
    data_awareness <- data_effects$awareness %>%
      dplyr::nest_by(.data$subject, .data$awareness, {{ dv }}) %>%
      dplyr::ungroup()
    data_distribution <- data_effects$distribution %>%
      dplyr::nest_by(.data$subject, .data$distribution, {{ dv }}) %>%
      dplyr::ungroup()
  }

  plot_presentation <-
    data_presentation %>%
    dplyr::mutate(dplyr::across(.data$presentation, ~ .x %>%
      forcats::fct_relevel("separate"))) %>%
    shiR::apa_plot(
      iv1 = "presentation",
      iv1.lab = "Presentation condition",
      dv = ggplot2::quo({{ dv }}),
      dv.lab = dv_label
    )

  plot_awareness <-
    data_awareness %>%
    dplyr::mutate(dplyr::across(.data$awareness, ~ .x %>%
      forcats::fct_relevel("naive"))) %>%
    shiR::apa_plot(
      iv1 = "awareness",
      iv1.lab = "Awareness condition",
      dv = ggplot2::quo({{ dv }}),
      dv.lab = dv_label
    ) +
    ggplot2::theme(axis.title.y = ggplot2::element_blank())

  plot_distribution <-
    data_distribution %>%
    dplyr::mutate(dplyr::across(.data$distribution, ~ .x %>%
      forcats::fct_relevel("absent"))) %>%
    shiR::apa_plot(
      iv1 = "distribution",
      iv1.lab = "Distribution condition",
      dv = ggplot2::quo({{ dv }}),
      dv.lab = dv_label
    ) +
    ggplot2::theme(axis.title.y = ggplot2::element_blank())

  choice_plot <-
    cowplot::plot_grid(
      plot_presentation,
      plot_awareness + ggplot2::ylab(NULL),
      plot_distribution + ggplot2::ylab(NULL),
      nrow = 1
    )

  return(choice_plot)
}
