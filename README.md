
# stdictapi

<!-- badges: start -->
<!-- badges: end -->

The goal of stdictapi is to ...

## Installation

You can install the development version of stdictapi from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mrchypark/stdictapi")
```

## How to USE

### Set API Key

you need set `{env: STDICT_KEY}` for api key from <https://stdict.korean.go.kr/openapi/openApiRegister.do>.

### Search API

This is a basic example which shows you how to solve a common problem:

``` r
library(stdictapi)
std_search("얼굴")
```

