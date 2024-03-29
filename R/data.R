#' Forecast outputs
#'
#' Example forecast data that represents model outputs from a hub (in this case, forecast data
#' represents three influenza-related targets (wk inc flu hosp, wk flu hops rate category,
#' and wk flu hosp tate) for two reference dates in 2022.
#'
#' @format ## `forecast_outputs`
#' A data frame with 5,424 rows and 9 columns:
#' \describe{
#'   \item{location}{FIPS code identifying a location}
#'   \item{reference_date}{the starting point of the forecast in yyyy-mm-dd format}
#'   \item{horizon}{number of units ahead being forecasted (weeks, in this case)}
#'   \item{target_end_date}{the date of occurrence of the outcome of interest in yyyy-mm-dd format;
#'          this can be calculated directly from the `reference_date` and `horizon`
#'          as follows: `target_end_date = reference_date + 7*horizon`}
#'   \item{target}{a unique identifier for the target}
#'   \item{output_type}{the type of representation of the prediction}
#'   \item{output_type_id}{more identifying information specific to the output type;
#'        output_type_id is not relevant for every kind of output_type (for example,
#'        hubs will not expect output_type_id values when the output_type is mean or median}
#'   \item{value}{the model’s prediction}
#'   \item{model_id}{the name of the model}
#'   ...
#' }
#' @source <https://github.com/Infectious-Disease-Modeling-Hubs/example-complex-forecast-hub/>
"forecast_outputs"

#' Forecast target time series
#'
#' Example time series target data from a hub that predicts influenza-related targets.
#'
#' @format ## `forecast_target_ts`
#' A data frame with 10,255 rows and 3 columns:
#' \describe{
#'   \item{date}{the date of the target observation in yyyy-mm-dd format}
#'   \item{location}{FIPS code identifying a location}
#'   \item{value}{the value of the target's observations}
#'   ...
#' }
#' @source <https://github.com/Infectious-Disease-Modeling-Hubs/example-complex-forecast-hub/>
"forecast_target_ts"

#' Forecast target values
#'
#' Example target data that represents the source of "truth" that model output data
#' will be scored against. This example represents influenza-related targets.
#'
#' @format ## `forecast_target_values`
#' A data frame with 198,485 rows and 6 columns:
#' \describe{
#'   \item{location}{FIPS code identifying a location}
#'   \item{target_end_date}{the target's obversation date in yyyy-mm-dd format;
#'          this is used to match on the `target_end_date` field in model output data
#'          submitted to the hub}
#'   \item{target}{a unique identifier for the target}
#'   \item{output_type}{the type of representation of the prediction}
#'   \item{output_type_id}{more identifying information specific to the output type;
#'         as in the model output data, output_type_id is not relevant for output_type
#'         of mean and median; target data that represents quantile output_type will
#'         not have an output_type_id.}
#'   \item{value}{the value of the target's observations}
#'   ...
#' }
#' @source <https://github.com/Infectious-Disease-Modeling-Hubs/example-complex-forecast-hub/>
"forecast_target_values"