##' @title Generate consent HTML file
##'
##' Template from jsPsych html-external example
##' @param experiment_resources Experiment resources path

##' @author Shir Dekel
##' @export
get_consent_html <- function(experiment_resources) {
  consent_html <- htmltools::withTags(
    htmltools::tags$div(
      id = "consent",
      htmltools::tags$p(
        htmltools::tags$img(
          src = jaysire::insert_resource("consent.png"),
          width = "750"
        )
      ),
      htmltools::tags$p(
        htmltools::tags$label(
          `for` = "consent_checkbox",
          "I agree to take part in this study."
        ),
        htmltools::tags$input(
          type = "checkbox",
          id = "consent_checkbox"
        )
      ),
      htmltools::tags$button(
        type = "button",
        id = "start",
        "Start Experiment"
      ),
      htmltools::tags$p(
        style = "font-size:10px",
        "Business decision making"
      ),
      htmltools::tags$p(
        style = "font-size:10px",
        "Version 2 18/01/19"
      ),
      htmltools::tags$p(
        style = "font-size:10px",
        "Page 1 of 1"
      )
    )
  )

  consent_html %>%
    htmltools::tags$save_html(
      file.path(
        experiment_resources,
        "consent.html"
      )
    )
}
