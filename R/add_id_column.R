##' @title Add id column

##' @param data Data
##'
##' @param sample Sample type
##'
##' @return A dataframe
##' @author Shir Dekel
##' @export
add_id_column <- function(data, sample) {
  data %>%
    dplyr::nest_by({{ sample }}) %>%
    tibble::rowid_to_column("id") %>%
    dplyr::mutate(dplyr::across(.data$id, as.factor)) %>%
    tidyr::unnest(data) %>%
    dplyr::ungroup()
}
