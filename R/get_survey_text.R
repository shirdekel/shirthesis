##' @title Get survey text
##' @param label_text Label text
##' @param name Name
##' @param minlength Minimum length
##' @param maxlength Maximum length
##' @param required Whether it is required to answer
##' @param size Size
##' @param prefix Prefix
##' @param suffix Suffix

##' @return A string marked as HTML

##' @author Shir Dekel
##' @export
get_survey_text <- function(label_text, name, minlength = NULL,
                            maxlength = NULL, required = NULL, size = NULL,
                            prefix = NULL, suffix = NULL) {
  survey_text <-
    htmltools::withTags(
      htmltools::tags$p(
        htmltools::tags$label(
          `for` = name,
          label_text
        ),
        prefix,
        htmltools::tags$input(
          type = "text",
          id = name,
          name = name,
          minlength = minlength,
          maxlength = maxlength,
          required = required,
          size = size,
        ),
        suffix
      )
    )

  return(survey_text)
}
