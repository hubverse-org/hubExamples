library(dplyr)

# These tests are designed to help devs check their work when updating the logic that generates hubExample's
# data files. Because these scripts (i.e., the contents of data-raw/) are not included in the hubExample
# package itself, the tests will not run during R checks.
skip_if(is_checking())

# Source the script that generates the example forecast data so we can test the functions
source(file.path(forecast_data_path, "generate_example_forecast_data.R"))


test_that("forecast_outputs dataset is generated correctly", {
  cols <- c(
    "output_type", "reference_date", "horizon", "target_end_date",
    "location", "model_id", "target", "output_type_id", "value"
  )

  load(test_path("testdata", "forecast_outputs.rda"))
  expected_forecast_outputs <- forecast_outputs %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  actual_forecast_outputs <- create_forecast_outputs() %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  expect_equal(
    as.data.frame(expected_forecast_outputs),
    as.data.frame(actual_forecast_outputs)
  )
})


test_that("forecast_target_observations dataset is generated correctly", {
  cols <- c("location", "target_end_date", "target", "output_type", "output_type_id", "observation")

  load(test_path("testdata", "forecast_target_observations.rda"))
  expected_forecast_target_observations <- forecast_target_observations %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  actual_forecast_target_observations <- create_forecast_target_observations() %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  expect_equal(
    as.data.frame(expected_forecast_target_observations),
    as.data.frame(actual_forecast_target_observations)
  )
})


test_that("forecast_target_ts dataset is generated correctly", {
  cols <- c("date", "location", "observation")

  load(test_path("testdata", "forecast_target_ts.rda"))
  expected_forecast_target_ts <- forecast_target_ts %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  actual_forecast_target_ts <- create_forecast_target_ts() %>%
    arrange_at(cols) %>%
    select(all_of(cols))

  expect_equal(
    as.data.frame(expected_forecast_target_ts),
    as.data.frame(actual_forecast_target_ts)
  )
})
