##' @title Get contact trial

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_contact <- function() {
  contact_html <- htmltools::withTags(
    htmltools::tags$div(
      htmltools::tags$div(
        htmltools::tags$p("I would like to receive feedback about the overall results of this study."),
        htmltools::tags$input(
          type = "radio",
          id = "contact_yes",
          name = "contact",
          value = "yes"
        ),
        htmltools::tags$label(
          `for` = "contact_yes",
          "YES"
        ),
        htmltools::tags$input(
          type = "radio",
          id = "contact_no",
          name = "contact",
          value = "no",
          checked = NA
        ),
        htmltools::tags$label(
          `for` = "contact_no",
          "NO"
        )
      ),
      htmltools::tags$div(
        htmltools::tags$p("If you answered YES, please indicate your preferred form of feedback and address:"),
        htmltools::tags$p(
          "Email:",
          htmltools::tags$input(
            type = "text",
            id = "address",
            name = "address"
          )
        )
      )
    )
  ) %>%
    as.character()

  contact <- jaysire::trial_generic(
    "survey-html-form",
    html = contact_html,
    data = jaysire::insert_property(stage = "contact")
  )

  return(contact)
}
