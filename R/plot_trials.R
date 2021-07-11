##' @title Plot trials

##' @param data Data
##'
##' @return A ggplot object
##' @author Shir Dekel
##' @export
plot_trials <- function(data) {
  trials_plot <-
    data %>%
    shiR::apa_plot(
      iv1 = "gamble",
      dv = "choice"
    ) +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1, vjust = 1))

  return(trials_plot)
}
