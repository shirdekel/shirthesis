##' @title Generate experiment files
##'
##' @param experiment_directory Experiment directory
##'
##' @param experiment_resources Experiment resources file path
##' @param main Main experiment objects
##' @param post_experiment Post experiment
##' @param columns Columns
##' @param condition_allocation Condition allocation
##' @param ethics Whether ethics pages are included (used for testing).
##' @param zip Whether to zip the experiment files
##' @param on_finish `on_finish` code
##' @return Invisibly returns NULL
##' @author Shir Dekel
##' @export
get_experiment <- function(experiment_directory, experiment_resources,
                           main, post_experiment, columns, condition_allocation,
                           ethics = TRUE, zip = TRUE,
                           on_finish = save_psychserver()) {
  welcome <-
    get_welcome()

  pre_experiment <-
    get_pre_experiment(ethics, experiment_resources)

  jaysire::build_experiment(
    timeline = jaysire::build_timeline(
      welcome,
      pre_experiment,
      main,
      post_experiment
    ),
    resources = jaysire::build_resources(experiment_resources),
    columns = columns,
    vanilla = c(
      verify_close(),
      condition_allocation,
      check_other()
    ),
    path = experiment_directory,
    experiment_title = "Business decision-making",
    experiment_width = 750,
    preload_images = experiment_resources %>%
      list.files() %>%
      stringr::str_extract("(.*.png)") %>%
      stats::na.omit() %>%
      jaysire::insert_resource(),
    on_finish = on_finish
  )

  ## if (zip) zip_experiment(experiment_directory)
}
