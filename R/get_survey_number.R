#' Get number-type survey question
#'
#'
#' @param label_text Label text
#' @param name Name
#' @param min Minimum value
#' @param max Minimum value
#' @param width Width
#' @param prefix Prefix
#' @param suffix Suffix
#' @param class Class
#' @return A string marked as HTML
#' @export
#'
get_survey_number <- function(label_text, name, min = 0, max = 100, width = 70,
                              prefix = "", suffix = "", class = NULL) {
  survey_number <- htmltools::withTags(
    htmltools::tags$p(
      htmltools::tags$p(
        htmltools::tags$label(
          `for` = name,
          label_text
        )
      ),
      prefix,
      htmltools::tags$input(
        type = "number",
        class = class,
        id = name,
        name = name,
        min = min,
        max = max,
        required = NA,
        style = stringr::str_c("width:", width, "px")
      ),
      suffix
    )
  )

  return(survey_number)
}
