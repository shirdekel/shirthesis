##' @title Get PIS

##' @param sample Sample type
##'
##' @return A "trial" object
##' @author Shir Dekel
##' @export
get_pis <- function(sample) {
  img_html <-
    stringr::str_c("pis", 1:3, "_", sample, ".png") %>%
    purrr::map_chr(
      ~ htmltools::img(
        src = jaysire::insert_resource(.x),
        width = "750"
      ) %>%
        as.character()
    )

  pis <-
    jaysire::trial_instructions(
      pages = c(
        img_html
      ),
      show_clickable_nav = TRUE,
      data = jaysire::insert_property(stage = "pis")
    )

  return(pis)
}
