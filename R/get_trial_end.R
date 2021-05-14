##' @title End trial

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_trial_end <- function() {
  trial_end_html <- htmltools::div(
    htmltools::p("Press below to complete the experiment."),
    htmltools::p("The next page will be a blank white screen. It will take approximately 10 seconds to save your data, after which you will be automatically redirected back to Prolific. Please do not exit until you have been redirected back to Prolific."),
    htmltools::p("Thank you!")
  ) %>%
    as.character()

  trial_end <- jaysire::trial_html_button_response(
    trial_end_html,
    choices = "End experiment",
    data = jaysire::insert_property(stage = "end")
  )

  return(trial_end)
}
