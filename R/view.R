#' View api for stdict korean
#'
#'  stdict korean api can use view api
#'
#' @param query query for view
#' @param method method. default is "word_info"
#'
#' @importFrom urltools param_set
#' @importFrom httr GET status_code content
#' @importFrom jsonlite fromJSON
#' @importFrom keyring key_get
#' @export
std_view <- function(query, method = "word_info") {
  method <- match.arg(method, choices = c("word_info", "target_code"))
  "https://stdict.korean.go.kr/api/view.do" %>%
    urltools::param_set("key", keyring::key_get("stdictapi")) %>%
    urltools::param_set("q", query) %>%
    urltools::param_set("req_type", "json") %>%
    urltools::param_set("type_search", "view") %>%
    urltools::param_set("method", method) %>%
    httr::GET() -> resp

  if (httr::status_code(resp) != 200) {
    return("error")
  }

  httr::content(resp, "text") %>%
    jsonlite::fromJSON() -> res
  return(res)
}
