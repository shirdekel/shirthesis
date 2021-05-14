##' @title Get ID

##' @return A "trial" object
##' @author Shir Dekel
##' @export
##' @param sample Sample type
get_sample_id <- function(sample) {
  if (sample == "sona") {
    id_html <- htmltools::withTags(
      htmltools::tags$div(
        htmltools::tags$label(
          `for` = "sona",
          "Enter your full name as it appears on SONA. We need this in order to credit you for your participation. If you have more than one name and are uncertain which one is used on SONA, please provide all possible names."
        ),
        htmltools::tags$input(
          type = "text",
          id = "sona",
          name = "sona",
          required = NA,
          size = 30
        )
      )
    ) %>%
      as.character()
  }

  if (sample == "prolific") {
    id_html <- htmltools::withTags(
      htmltools::tags$div(
        htmltools::tags$label(
          `for` = "prolific",
          "Enter your Prolific ID (24 alphanumeric characters, no spaces):"
        ),
        htmltools::tags$input(
          type = "text",
          id = "prolific",
          name = "prolific",
          required = NA,
          minlength = "24",
          maxlength = "24",
          pattern = "^[a-z0-9]+$",
          size = 30
        )
      )
    ) %>%
      as.character()
  }

  id <- jaysire::trial_generic(
    "survey-html-form",
    html = id_html,
    data = jaysire::insert_property(stage = "id"),
    on_load = jaysire::insert_javascript(
      "function() {
      if (typeof urlvar.PROLIFIC_PID !== 'undefined') {
        document.getElementById('prolific').setAttribute('value', urlvar.PROLIFIC_PID);
      }
    }"
    )
  )

  return(id)
}
