
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thesesfr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The goal of thesesfr is to …

## Installation

You can install the development version of thesesfr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pds023/thesesfr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(thesesfr)
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
#> Warning: remplacement de l'importation précédente 'arrow::schema' par
#> 'plotly::schema' lors du chargement de 'thesesfr'
#> Warning: remplacement de l'importation précédente 'DT::dataTableOutput' par
#> 'shiny::dataTableOutput' lors du chargement de 'thesesfr'
#> Warning: remplacement de l'importation précédente 'DT::renderDataTable' par
#> 'shiny::renderDataTable' lors du chargement de 'thesesfr'
#> Warning: remplacement de l'importation précédente 'data.table:::=' par
#> 'timetk:::=' lors du chargement de 'thesesfr'
#> Warning: remplacement de l'importation précédente 'data.table::last' par
#> 'xts::last' lors du chargement de 'thesesfr'
#> Warning: remplacement de l'importation précédente 'data.table::first' par
#> 'xts::first' lors du chargement de 'thesesfr'
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
