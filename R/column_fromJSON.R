##' Need to convert columns such as stage from JSON. Making sure it comes out
##' normal from jaysire proved to be difficult because it unboxes also other
##' elements.
##'
##' @title Convert string to JSON by column

##' @return A dataframe
##' @author Shir Dekel
##' @export
##' @param data Data
##' @param columns Columns
column_fromJSON <- function(data, columns) {
  data %>%
    dplyr::rowwise() %>%
    dplyr::mutate(
      dplyr::across({{ columns }}, ~ .x %>%
        purrr::map_if(jsonlite::validate, jsonlite::fromJSON) %>%
        unlist())
    )
}
