
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

### License

All credit about data and logo is from [국립국어원 표준국어대사전](https://stdict.korean.go.kr/main/main.do) under [cc-by-sa 2.0 kr](https://creativecommons.org/licenses/by-sa/2.0/kr/).
