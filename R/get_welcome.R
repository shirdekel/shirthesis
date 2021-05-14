##' @title Get welcome page
##'
##' For experiment generation

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_welcome <- function() {
  welcome <- htmltools::tags$div(
    htmltools::tags$p("Welcome to the study."),
    htmltools::tags$p("Make sure to scroll down to the bottom of each page to see the navigation buttons.")
  ) %>%
    as.character()

  welcome <- jaysire::trial_instructions(
    pages = c(
      welcome
    ),
    show_clickable_nav = TRUE,
    data = jaysire::insert_property(stage = "welcome")
  )

  return(welcome)
}
