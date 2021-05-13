##' @title Import from Prolific raw data
##'
##' @param prolific_raw_data File path of Prolific raw data
##'
##' @param experiment_number Experiment number
##' @param thesis_project Thesis project
##' @return A dataframe
##' @author Shir Dekel
##' @export
##' @importFrom rlang .data
import_from_prolific_raw_data <- function(prolific_raw_data, experiment_number,
                                          thesis_project) {
  prolific_raw_data %>%
    readr::read_csv(col_types = readr::cols()) %>%
    dplyr::select(.data$sectionName, .data$sectionValue, .data$time_elapsed,
                  .data$dateCreated) %>%
    tidyr::pivot_wider(
      names_from = "sectionName",
      values_from = "sectionValue"
    ) %>%
    dplyr::filter(
      .data$experiment == paste0("experiment", experiment_number),
      .data$thesis_project == thesis_project
    )
}
