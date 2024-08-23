## code to prepare `forecast_outputs` dataset

library(aws.s3)
library(dplyr)
library(hubData)
library(readr)

s3_bucket_name <- "example-complex-forecast-hub"
check_bucket <- bucket_exists(s3_bucket_name)
if (isFALSE(check_bucket)) {{ stop("Aborting: ", s3_bucket_name, " S3 bucket not found") }}

hub_path <- s3_bucket(s3_bucket_name)

l_keep <- c("25", "48")
q_lvls_keep <- c("0.05", "0.1", "0.25", "0.5", "0.75", "0.9", "0.95")
d_keep <- c("2022-11-19", "2022-12-17")
forecast_outputs <- hubData::connect_hub(hub_path, file_format = "parquet", skip_checks = TRUE) |>
  dplyr::filter(
    location %in% l_keep,
    output_type != "quantile" |
      (output_type == "quantile" & output_type_id %in% q_lvls_keep),
    reference_date %in% d_keep
  ) |>
  hubData::collect_hub()

target_ts_data_path <- paste("target-data", "time-series.csv", sep = "/")
forecast_target_ts <- read_csv(
  get_object(target_ts_data_path, bucket = s3_bucket_name),
  show_col_types = FALSE
)

target_observations_data_path <- paste("target-data", "target-observations.csv", sep = "/")
forecast_target_observations <- read_csv(
  get_object(target_observations_data_path, bucket = s3_bucket_name),
  show_col_types = FALSE
)

usethis::use_data(forecast_outputs, overwrite = TRUE)
usethis::use_data(forecast_target_ts, overwrite = TRUE)
usethis::use_data(forecast_target_observations, overwrite = TRUE)
