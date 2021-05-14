##' @title Get debrief

##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_debrief <- function() {
  debrief_html <- stringr::str_c("debrief", 1:2, ".png") %>%
    purrr::map_chr(~ htmltools::img(
      src = jaysire::insert_resource(.x),
      width = "750"
    ) %>%
      as.character())

  debrief <- jaysire::trial_instructions(
    pages = c(
      debrief_html
    ),
    show_clickable_nav = TRUE,
    data = jaysire::insert_property(stage = "debrief")
  )

  return(debrief)
}
