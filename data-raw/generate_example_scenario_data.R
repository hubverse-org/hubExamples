# code to prepare `scenario_` data-sets

# System and Library
library(hubData)
library(dplyr)
library(hubEnsembles)

# Generate Data
hub_path <- "../example-complex-scenario-hub/"

scenario_outputs <- hubData::connect_hub(hub_path) |>
  dplyr::filter(target == "inc case", location == "US",
                origin_date == "2021-03-07", output_type == "quantile") |>
  dplyr::collect() |>
  dplyr::select(-age_group, -target_date)
scenario_ens <- hubEnsembles::simple_ensemble(scenario_outputs)
scenario_outputs <- rbind(scenario_outputs, scenario_ens)
scenario_outputs <- hubData::as_model_out_tbl(scenario_outputs)

target_ts_data_path <- file.path(hub_path, "target-data", "time-series.parquet")
scenario_target_ts <- arrow::read_parquet(target_ts_data_path) |>
  dplyr::filter(target == "inc case", location == "US",
                date > "2020-10-01")

usethis::use_data(scenario_outputs, overwrite = TRUE)
usethis::use_data(scenario_target_ts, overwrite = TRUE)
