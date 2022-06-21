#' Set API Key on stdict
#'
#'
#' @importFrom keyring key_set
#' @export
std_auth_set <- function() {
  keyring::key_set("stdictapi",
                   prompt = "Enter https://stdict.korean.go.kr/ API KEY")
}

#' Remove API Key on stdict
#'
#'
#' @importFrom keyring key_delete
#' @export
std_auth_remove <- function() {
  keyring::key_delete("stdictapi")
}

#' @importFrom keyring key_get
std_auth_exist <- function() {
  chk <- try(keyring::key_get("stdictapi"), silent = T)
  return(!inherits(chk, "try-error"))
}

std_auth_work <- function() {
  "https://stdict.korean.go.kr/api/view.do" %>%
    urltools::param_set("key", keyring::key_get("stdictapi")) %>%
    urltools::param_set("q", "%EB%82%98%EB%AC%B41") %>%
    urltools::param_set("method", "word_info") %>%
    httr::GET() -> req

  if (httr::status_code(req) == 400) {
    stop("Error. http status is 400. Please try agian.")
  }

  if (!httr::has_content(req)) {
    stop("Error. Return empty body. Please try agian.")
  }

  httr::content(req) %>%
    rvest::html_nodes("error_code") %>%
    rvest::html_text() -> status

  if (identical(status, character(0))) {
    return(TRUE)
  }
  if (status == "020") {
    return(FALSE)
  }
  # TODO: error message need to return with details.
  stop("Error. error_code: ", status)
}


#https://stdict.korean.go.kr/openapi/openApiRegister.do
