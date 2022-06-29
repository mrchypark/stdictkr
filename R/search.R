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
#' @importFrom xml2 as_list
#' @importFrom keyring key_get
#' @importFrom rvest html_nodes
#' @importFrom purrr map
#' @importFrom dplyr bind_rows mutate
#'
#' @return a [tibble][tibble::tibble-package]
#'
#' @export
std_search <- function(query,
                       start = 1,
                       count = 10) {

  sense.type <- sup_no <- NULL

  "https://stdict.korean.go.kr/api/search.do" %>%
    urltools::param_set("key", std_key()) %>%
    urltools::param_set("q", query) %>%
    urltools::param_set("req_type", "xml") %>%
    urltools::param_set("start", start) %>%
    urltools::param_set("num", count) %>%
    httr::GET() -> resp

  if (httr::status_code(resp) != 200) {
    return("error")
  }

  httr::content(resp) %>%
    rvest::html_nodes("item") -> res

  if (length(res) == 0) {
    return(tibble::tibble(
      "target_code" = NA,
      "word" = NA,
      "sup_no" = NA,
      "pos" = NA,
      "sense.definition" = NA,
      "sense.link" = NA,
      "sense.type" = NA
    ))
  }


  res %>%
    xml2::as_list() %>%
    purrr::map(unlist) %>%
    purrr::map(t) %>%
    purrr::map(tibble::as_tibble, .name_repair = "unique") %>%
    dplyr::bind_rows() %>%
    dplyr::mutate(sense.type = trimws(sense.type),
                  sup_no = as.integer(sup_no)) %>%
    return()
}
