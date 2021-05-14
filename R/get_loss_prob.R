##' @title Get loss probability

##' @return A numeric value
##' @author Shir Dekel
##' @export
##' @param outcome_aggregated Aggregated outcome
##' @param prob_aggregated Aggregated probability
get_loss_prob <- function(outcome_aggregated, prob_aggregated) {

  # Get negative aggregated outcomes
  loss <-
    outcome_aggregated < 0

  # Sum corresponding probabilities
  prob_aggregated[loss] %>%
    sum()
}
