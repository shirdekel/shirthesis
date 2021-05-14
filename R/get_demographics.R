##' @title Get demographic information

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_demographics <- function() {
  sex <- htmltools::withTags(
    htmltools::tags$p(
      htmltools::tags$p("What is your sex?"),
      htmltools::tags$input(
        type = "radio",
        id = "male",
        name = "sex",
        value = "male",
        checked = NA
      ),
      htmltools::tags$label(
        `for` = "male",
        "Male"
      ),
      htmltools::tags$input(
        type = "radio",
        id = "female",
        name = "sex",
        value = "female"
      ),
      htmltools::tags$label(
        `for` = "female",
        "Female"
      )
    )
  )

  age <- get_survey_number(
    label_text = "What is your age?",
    name = "age",
    min = "10"
  )

  language_options <- c("No", "Chinese", "Japanese", "Vietnamese", "Korean", "Arabic", "Spanish", "Italian", "Greek", "Hebrew")

  language <- get_survey_select(
    name_select = "language",
    name_other = "language_other",
    option = language_options,
    label_select = "Do you speak a language other than English at home?"
  )

  education <- get_survey_number("How many years of experience do you have studying business?", "business_edu", suffix = "years")

  experience <- get_survey_number("How many years of experience do you have working in a corporate business setting?", "business_exp", suffix = "years")

  current <- htmltools::withTags(
    htmltools::tags$p(
      htmltools::tags$p("Do you currently work in an executive or managerial role?"),
      htmltools::tags$input(
        type = "radio",
        id = "current_yes",
        name = "current",
        value = "yes"
      ),
      htmltools::tags$label(
        `for` = "current_yes",
        "Yes"
      ),
      htmltools::tags$input(
        type = "radio",
        id = "current_no",
        name = "current",
        value = "no",
        checked = NA
      ),
      htmltools::tags$label(
        `for` = "current_no",
        "No"
      )
    )
  )

  demographics_combined <- list(sex, age, language, education, experience, current) %>%
    purrr::map(~ htmltools::tags$li(.x)) %>%
    htmltools::tags$ol(style = "text-align:left") %>%
    as.character()

  demographics <- jaysire::trial_generic(
    "survey-html-form",
    html = demographics_combined,
    data = jaysire::insert_property(stage = "demographics"),
    on_finish = jaysire::insert_javascript("function(data){
    data.current_response = JSON.parse(data.responses).current
  }")
  )

  return(demographics)
}
