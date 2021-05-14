##' @title Get portfolio trial - binary
##'
##' @param distribution Distribution
##' @param preamble Preamble
##'
##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_trial_portfolio_binary <- function(preamble = "", distribution = "absent") {
  trial_portfolio_binary_html <- htmltools::p(
    htmltools::strong("Consider all the projects you saw. If you had to choose between investing in all of them, or investing in none of them, which would you choose?")
  ) %>%
    as.character()

  trial_portfolio_binary <- jaysire::trial_html_button_response(
    stimulus = stringr::str_c(preamble, trial_portfolio_binary_html),
    choices = c("Invest in all of the projects",
                "Invest in none of the projects"),
    data = jaysire::insert_property(stage = "portfolio_binary")
  ) %>%
    jaysire::build_timeline() %>%
    jaysire::display_if(
      jaysire::fn_data_condition(distribution == !!distribution)
    )

  return(trial_portfolio_binary)
}
