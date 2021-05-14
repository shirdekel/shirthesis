##' @title Get separate condition timeline
##'
##' For aggregation experiment generation

##' @param preamble Preamble
##'
##' @param project_description Project description
##' @param form_options Form options
##' @param project_input Project input
##' @param distribution Distribution
##' @param randomize_order Whether to randomize order
##'
##' @return An object of class "timeline"
##' @author Shir Dekel
##' @export
get_trial_separate <- function(preamble =
                                 "<p>Indicate below whether you would invest in the following:</p>",
                               project_description,
                               form_options = c("Yes", "No"), project_input,
                               distribution, randomize_order) {
  trial_separate <- jaysire::trial_survey_multi_choice(
    preamble = preamble,
    questions = jaysire::question_multi(
      prompt = jaysire::insert_variable("prompt"),
      options = form_options,
      name = jaysire::insert_variable("name"),
      required = TRUE
    ),
    data = jaysire::insert_property(stage = "project_choice")
  ) %>%
    jaysire::build_timeline() %>%
    jaysire::set_variables(
      prompt = project_description,
      name = project_input
    ) %>%
    jaysire::set_parameters(randomize_order = randomize_order) %>%
    jaysire::build_timeline() %>%
    jaysire::display_if(
      jaysire::fn_data_condition(distribution == !!distribution)
    ) %>%
    jaysire::build_timeline() %>%
    jaysire::display_if(
      jaysire::fn_data_condition(presentation == "separate")
    )

  return(trial_separate)
}
