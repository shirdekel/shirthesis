##' @title Plot gambles
##'
##' And save distribution figure
##'
##' @param gambles Gamble values
##' @param experiment_resources Experiment resources file path
##'
##' @param experiment_number Experiment number
##' @return ggplot object
##' @author Shir Dekel
##' @export
plot_gambles <- function(gambles, experiment_resources, experiment_number) {
  gambles_plot <-
    get_distribution(
      gambles$outcome_aggregated,
      gambles$prob_aggregated,
      unit = "$ million"
    )

  file.path(
    experiment_resources,
    paste0("gambles_plot_experiment", experiment_number, ".png")
  ) %>%
    ggplot2::ggsave(plot = gambles_plot, width = 6, height = 4, dpi = 300)

  return(gambles_plot)
}
