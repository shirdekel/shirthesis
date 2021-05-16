##' @title clean portfolio binary data

##' @param data_raw_prep Raw data
##'
##' @return A dataframe
##' @author Shir Dekel
##' @export
clean_data_portfolio_binary <- function(data_raw_prep) {
  data_portfolio_binary <-
    data_raw_prep %>%
    dplyr::filter(.data$stage == "portfolio_binary") %>%
    dplyr::mutate(portfolio_binary = .data$button_pressed %>%
      # In the experiment, 0 corresponds to investing in all, so this reverses
      # the coding to be more intuitive
      dplyr::recode(
        "0" = 1,
        "1" = 0
      )) %>%
    dplyr::select(.data$subject, .data$portfolio_binary)

  return(data_portfolio_binary)
}
