#' View api for stdict korean
#'
#'  stdict korean api can use view api
#'
#' @param query query for view
#' @param method method. default is "word_info"
#'
#' @importFrom urltools param_set
#' @importFrom httr GET status_code content
#' @importFrom xml2 as_list
#' @importFrom keyring key_get
#' @export
std_view <- function(query, method = "word_info") {
  method <- match.arg(method, choices = c("word_info", "target_code"))

  httr::POST(
    "https://stdict.korean.go.kr/api/view.do",
    body = list(
      key = std_key(),
      q = query,
      req_type = "xml",
      method = method
    )
  ) -> resp

    if (httr::status_code(resp) != 200) {
    return("error")
  }

  httr::content(resp) %>%
    rvest::html_nodes("item") %>%
    # xml2::as_list() %>%
    # purrr::map(unlist) %>%
    # purrr::map(t) %>%
    # purrr::map(tibble::as_tibble, .name_repair = "unique") %>%
    # dplyr::bind_rows()
    return()
}
