## code to prepare `forecast_outputs` dataset

library(distfromq)
library(dplyr)
library(ggplot2)
library(hubData)
library(readr)

hub_path <- "../example-complex-forecast-hub"

q_lvls_keep <- c("0.05", "0.1", "0.25", "0.5", "0.75", "0.9", "0.95")
d_keep <- c("2022-11-19", "2022-12-17")
forecast_outputs <- hubData::connect_hub(hub_path) |>
  dplyr::filter(
    location %in% c("25", "48"),
    output_type != "quantile" |
      (output_type == "quantile" & output_type_id %in% q_lvls_keep),
    reference_date %in% d_keep
  ) |>
  hubData::collect_hub()

target_ts_data_path <- file.path(hub_path, "target-data", "time-series.csv")
forecast_target_ts <- read_csv(target_ts_data_path) |>
  as.data.frame()

target_observations_data_path <- file.path(hub_path, "target-data", "target-observations.csv")
forecast_target_observations <- read_csv(target_observations_data_path) |>
  as.data.frame()

usethis::use_data(forecast_outputs, overwrite = TRUE)
usethis::use_data(forecast_target_ts, overwrite = TRUE)
usethis::use_data(forecast_target_observations, overwrite = TRUE)
