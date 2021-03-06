##' @title Get pre experiment trials

##' @param ethics Whether to include ethics (removed for testing).
##' @param experiment_resources Experiment resources file path
##' @return A "timeline" object
##' @author Shir Dekel
##' @export
get_pre_experiment <- function(ethics, experiment_resources) {
  pis <- NULL

  consent <- NULL

  get_consent_html(experiment_resources)

  if (ethics) {
    pis <-
      get_pis("prolific")

    consent <-
      get_consent()
  }

  sample_id <-
    get_sample_id("prolific")

  contact <-
    get_contact()

  demographics <-
    get_demographics()

  business_information <-
    get_business_information()

  pre_experiment <-
    jaysire::build_timeline(
      pis,
      consent,
      sample_id,
      contact,
      demographics,
      business_information
    ) %>%
    purrr::map(purrr::compact) # Remove PIS and consent if `NULL`

  return(pre_experiment)
}
