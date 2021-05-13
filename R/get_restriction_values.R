##' @title Get restriction values (EV and gain/loss)
##'
##' For aggregation experiment generation
##' @param prob_positive_sample Positive probability
##' @param outcome_positive_sample Positive outcome
##' @return A list of numeric values
##' @author Shir Dekel
##' @export
get_restriction_values <- function(prob_positive_sample,
                                   outcome_positive_sample) {
  outcome_dif <- 240

  expected_value_positive <- prob_positive_sample * outcome_positive_sample
  prob_negative_sample <- 1 - prob_positive_sample
  outcome_negative_sample <- outcome_dif - outcome_positive_sample
  expected_value_negative <- prob_negative_sample * outcome_negative_sample

  expected_value <- expected_value_positive - expected_value_negative
  gain_loss_ratio <- expected_value_positive / expected_value_negative

  restriction_values <- list(
    expected_value = expected_value,
    gain_loss_ratio = gain_loss_ratio,
    outcome_dif = outcome_dif
  )

  return(restriction_values)
}
