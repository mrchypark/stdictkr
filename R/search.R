#' Search api for stdict korean
#'
#'  stdict korean api can use search api
#'
#' @param query query for search
#' @param start query result of start
#' @param count count of result number
#'
#' @importFrom urltools param_set
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom keyring key_get
#' @export
std_search <- function(query, start = 1, count = 10) {
  "https://stdict.korean.go.kr/api/search.do" %>%
    urltools::param_set("key", std_key()) %>%
    urltools::param_set("q", query) %>%
    urltools::param_set("req_type", "json") %>%
    urltools::param_set("start", start) %>%
    urltools::param_set("num", count) %>%
    httr::GET() -> resp

    if (httr::status_code(resp) != 200) {
      return("error")
    }

    httr::content(resp, "text") %>%
    jsonlite::fromJSON() -> res
  return(res$channel$item)
}


