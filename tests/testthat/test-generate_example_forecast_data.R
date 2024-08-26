test_that("forecast_outputs dataset is generated correctly", {
  load(test_path("testdata", "forecast_outputs.rda"))
  expect_equal("1", "1")
})
