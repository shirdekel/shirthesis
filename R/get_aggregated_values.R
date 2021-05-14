##' @title Get aggregated values

##' @return A list of numeric values
##' @author Shir Dekel
##' @export
##' @param outcome_positive Positive outcome
##' @param prob_positive Positive probability
##' @param outcome_dif Outcome difference
##' @param sort Whether to sort outcomes
get_aggregated_values <- function(outcome_positive, prob_positive, outcome_dif,
                                  sort = TRUE) {

  # Get a list of trial outcomes (positive and negative possibilities)
  outcome_combined <-
    list(
      outcome_positive,
      outcome_positive - outcome_dif
    ) %>%
    purrr::transpose() %>%
    purrr::map(unlist)

  # Get aggregated outcomes
  outcome_aggregated <-
    # Get a data frame of all possible combinations of the trial outcomes
    expand.grid(outcome_combined) %>%
    # Sum the rows (to get the final state of what the outcome combinations
    # would be)
    rowSums() %>%
    unique()

  if (sort) {
    ## Important so that the probabilities do not flip when plotted
    ## Aggregation 1 did not do this so need to have this option
    outcome_aggregated <-
      outcome_aggregated %>%
      sort()
  }

  # Get Poisson binomial distribution of the sample of probabilities
  prob_aggregated <-
    poibin::dpoibin(
      kk = 0:length(prob_positive),
      pp = prob_positive
    )

  tibble::lst(
    outcome_aggregated,
    prob_aggregated
  )
}
