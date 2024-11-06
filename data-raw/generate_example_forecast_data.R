## code to prepare `forecast_outputs` dataset

library(aws.s3)
library(dplyr)
library(hubData)
library(readr)

s3_bucket_name <- "example-complex-forecast-hub"
check_bucket <- bucket_exists(s3_bucket_name)
if (isFALSE(check_bucket)) {{ stop("Aborting: ", s3_bucket_name, " S3 bucket not found") }}

hub_path <- s3_bucket(s3_bucket_name)

create_forecast_outputs <- function() {
  l_keep <- c("25", "48")
  q_lvls_keep <- c("0.05", "0.1", "0.25", "0.5", "0.75", "0.9", "0.95")
  d_keep <- c("2022-11-19", "2022-12-17")
  forecast_outputs <- hubData::connect_hub(hub_path, file_format = "parquet", skip_checks = TRUE) |>
    dplyr::filter(
      .data[["location"]] %in% l_keep,
      .data[["output_type"]] != "quantile" |
        (.data[["output_type"]] == "quantile" & .data[["output_type_id"]] %in% q_lvls_keep),
      .data[["reference_date"]] %in% d_keep
    ) |>
    hubData::collect_hub()
  return(forecast_outputs)
}

create_forecast_target_ts <- function() {
  target_ts_data_path <- paste("target-data", "time-series.csv", sep = "/")
  forecast_target_ts <- readr::read_csv(
    aws.s3::get_object(target_ts_data_path, bucket = s3_bucket_name),
    show_col_types = FALSE
  )
  return(forecast_target_ts)
}

create_forecast_oracle_output <- function() {
  target_oracle_output_data_path <- paste("target-data", "oracle-output.csv", sep = "/")
  forecast_oracle_output <- readr::read_csv(
    aws.s3::get_object(target_oracle_output_data_path, bucket = s3_bucket_name),
    show_col_types = FALSE
  )
  return(forecast_oracle_output)
}

# Allow this script to be sourced without running the functions
# https://stackoverflow.com/a/47178017
if (sys.nframe() == 0) {
  forecast_outputs <- create_forecast_outputs()
  usethis::use_data(forecast_outputs, overwrite = TRUE)

  forecast_target_ts <- create_forecast_target_ts()
  usethis::use_data(forecast_target_ts, overwrite = TRUE)

  forecast_oracle_output <- create_forecast_oracle_output()
  usethis::use_data(forecast_oracle_output, overwrite = TRUE)
}
