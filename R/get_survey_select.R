##' @title Get drop-down survey question

##' @param name_select Select name
##'
##' @param name_other Other name
##' @param option Option
##' @param label_select Select label
##'
##' @return A string marked as HTML
##' @author Shir Dekel
##' @export
get_survey_select <- function(name_select, name_other, option, label_select) {
  option_html <- c("", option, "Other") %>% # Empty initial value to make required validation work
    purrr::map(~ htmltools::tags$option(value = .x, .x))

  survey_select <- htmltools::withTags(
    htmltools::tags$p(
      htmltools::tags$p(
        htmltools::tags$p(
          htmltools::tags$label(
            `for` = name_select,
            label_select
          )
        ),
        htmltools::tags$select(
          id = name_select,
          name = name_select,
          option_html,
          onchange = stringr::str_c("checkOther(this.value, '", name_other, "');"),
          required = NA
        )
      ),
      htmltools::tags$p(
        htmltools::tags$input(
          type = "text",
          id = name_other, # So that checkOther() looks for this
          name = name_other, # The input will be encoded into a different column as the drop-down options (setting this to name_select erases the value if a non-other option is selected)
          style = "display:none;",
          placeholder = "Specify other"
        )
      )
    )
  ) %>%
    as.character() %>%
    stringr::str_replace_all(pattern = "&#39;", "'") %>% # For some reason htmltools::tags converts quotation marks into ASCII
    htmltools::HTML()

  return(survey_select)
}
