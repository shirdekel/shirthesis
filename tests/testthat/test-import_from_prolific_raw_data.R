test_that("filtering works", {
  test_df <-
    data.frame(
      sectionName = c("subject", "experiment", "thesis_project") %>%
        rep(2),
      sectionValue = c(
        "subject1", "experiment1", "alignment",
        "subject2", "experiment2", "aggregation"
      ),
      time_elapsed = rep(100, 6),
      dateCreated = c("2021-01-01", "2021-01-02") %>%
        rep(3)
    )

  test_df_filtered <-
    tibble::tibble(
      time_elapsed = 100,
      dateCreated = as.Date("2021-01-01"),
      subject = "subject1",
      experiment = "experiment2",
      thesis_project = "alignment"
    )

  filepath <- file.path(tempdir(), "test_df.csv")

  write.csv(test_df, filepath)

  test_df_result <- import_from_prolific_raw_data(filepath, 2, "aggregation")

  expect_identical(test_df_result, test_df_filtered)
})
