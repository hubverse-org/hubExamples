
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hubExamples <a href="https://hubverse-org.github.io/hubExamples/"><img src="man/figures/logo.png" align="right" height="131" alt="hubExamples website" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/hubExamples)](https://CRAN.R-project.org/package=hubExamples)
[![R-CMD-check](https://github.com/hubverse-org/hubExamples/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hubverse-org/hubExamples/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of hubExamples is to provide example data for forecasting and
scenario modeling hubs in the hubverse format.

This package is part of the
[hubverse](https://hubverse.io/en/latest/) ecosystem, which
aims to provide a set of tools for infectious disease modeling hubs to
share and collaborate on their work.

## Installation

You can install the development version of hubExamples from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("hubverse-org/hubExamples")
```

## Example forecast hub data

The package provides three data sets that contain example model output
and target data for an example forecast hub: `forecast_outputs`,
`forecast_target_ts`, and `forecast_target_observations`. Please see the
package documentation for further information about these data objects.

``` r
library(hubExamples)
head(forecast_outputs)
#>            model_id location reference_date horizon target_end_date
#> 1 Flusight-baseline       48     2022-12-17       0      2022-12-17
#> 2 Flusight-baseline       48     2022-12-17       0      2022-12-17
#> 3 Flusight-baseline       48     2022-12-17       0      2022-12-17
#> 4 Flusight-baseline       48     2022-12-17       0      2022-12-17
#> 5 Flusight-baseline       48     2022-12-17       0      2022-12-17
#> 6 Flusight-baseline       48     2022-12-17       0      2022-12-17
#>             target output_type output_type_id        value
#> 1 wk flu hosp rate         cdf           0.25 7.592233e-13
#> 2 wk flu hosp rate         cdf            0.5 4.736251e-12
#> 3 wk flu hosp rate         cdf           0.75 2.767176e-11
#> 4 wk flu hosp rate         cdf              1 1.514312e-10
#> 5 wk flu hosp rate         cdf           1.25 7.762725e-10
#> 6 wk flu hosp rate         cdf            1.5 3.728055e-09
head(forecast_target_ts)
#>         date location observation
#> 1 2020-01-11       01           0
#> 2 2020-01-11       15           0
#> 3 2020-01-11       18           0
#> 4 2020-01-11       27           0
#> 5 2020-01-11       30           0
#> 6 2020-01-11       37           0
head(forecast_target_observations)
#>   location target_end_date          target output_type output_type_id
#> 1       US      2022-10-22 wk inc flu hosp    quantile           <NA>
#> 2       01      2022-10-22 wk inc flu hosp    quantile           <NA>
#> 3       02      2022-10-22 wk inc flu hosp    quantile           <NA>
#> 4       04      2022-10-22 wk inc flu hosp    quantile           <NA>
#> 5       05      2022-10-22 wk inc flu hosp    quantile           <NA>
#> 6       06      2022-10-22 wk inc flu hosp    quantile           <NA>
#>   observation
#> 1        2380
#> 2         141
#> 3           3
#> 4          22
#> 5          50
#> 6         124
```

## Example scenario hub data

The package provides two data sets that contain example model output and
target data for an example scenario hub: `scenario_outputs` and
`scenario_target_ts`. Please see the package documentation for further
information about these data objects.

``` r
head(scenario_outputs)
#>          model_id origin_date  scenario_id location   target horizon
#> 1 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#> 2 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#> 3 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#> 4 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#> 5 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#> 6 HUBuni-simexamp  2021-03-07 A-2021-03-05       US inc case       1
#>   output_type output_type_id    value
#> 1    quantile          0.010 292495.9
#> 2    quantile          0.025 308584.4
#> 3    quantile          0.050 312990.6
#> 4    quantile          0.100 327375.0
#> 5    quantile          0.150 337199.4
#> 6    quantile          0.200 345255.6
head(scenario_target_ts)
#>   location       date observation   target
#> 1       US 2020-10-03      300678 inc case
#> 2       US 2020-10-10      334493 inc case
#> 3       US 2020-10-17      388282 inc case
#> 4       US 2020-10-24      484422 inc case
#> 5       US 2020-10-31      571389 inc case
#> 6       US 2020-11-07      776479 inc case
```

------------------------------------------------------------------------

## Code of Conduct

Please note that the hubExamples package is released with a [Contributor
Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this
project, you agree to abide by its terms.

## Contributing

Interested in contributing back to the open-source Hubverse project?
Learn more about how to [get involved in the Hubverse
Community](https://hubverse.io/en/latest/overview/contribute.html)
or [how to contribute to the hubExamples
package](.github/CONTRIBUTING.md).
