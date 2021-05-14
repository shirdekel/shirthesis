##' @title Get restriction logicals
##'
##' For aggregation experiment generation
##'
##' @param gain_loss_ratio_restriction Gain/loss ratio restriction
##' @param restriction_values Restriction values
##'
##' @return A boolean
##' @author Shir Dekel
##' @export
get_restriction <- function(restriction_values, gain_loss_ratio_restriction) {
  restriction <-
    (restriction_values$expected_value > 0) &
      (restriction_values$gain_loss_ratio < gain_loss_ratio_restriction)

  return(restriction)
}
