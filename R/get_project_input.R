##' @title Get long project inputs
##'
##' To name questions
##'
##' For aggregation experiment generation
##'
##' @param gambles Gamble values
##' @param type Project type
##' @param detail Project detail
##'
##' @return A string
##' @author Shir Dekel
##' @export
get_project_input <- function(type,
                              detail = NULL,
                              gambles) {
  project_input <-
    type %>%
    stringr::str_replace_all(" ", "-") %>%
    stringr::str_c(detail,
      gambles$outcome_positive,
      gambles$outcome_dif,
      gambles$prob_positive,
      sep = "_"
    )

  return(project_input)
}
