
# stdictapi [<img src="man/figures/logo.png" align="right" height=140/>](https://mrchypark.github.io/stdictapi/index.html)

<!-- badges: start -->
<!-- badges: end -->

The goal of stdictapi is to provide client package for <https://stdict.korean.go.kr/openapi>.

## Installation

Installation
You can install the stdictapi with:

```
# CRAN NOT YET!!!
install.packages("stdictapi")

# Dev version
install.packages("stdictapi", repos = 'https://mrchypark.r-universe.dev')
```

## How to USE

### Set API Key

you need set api key from <https://stdict.korean.go.kr/openapi/openApiRegister.do> using `std_auth_set()`.

### Search API

This is a basic example which shows you how to solve a common problem:

``` r
library(stdictapi)
std_search("얼굴")
```

### View API

This is a basic example which shows you how to solve a common problem:

``` r
library(stdictapi)
std_view("나무1")
```
