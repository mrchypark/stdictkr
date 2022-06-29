#' Get All Dictionary Data
#'
#' If want to change dict file location, set env `STDICTKR_HOME` to path
#' not contain filename.
#'
#' @export
std_dict_get <- function() {
  dir.create(std_dict_path(),
             showWarnings = F,
             recursive = T)

  download.file(
    "https://stdict.korean.go.kr/common/download.do?link_key=976570&pageUnit=10&pageIndex=1",
    std_dict_path_full(),
    mode = "wb"
  )

  unzip(zipfile = std_dict_path_full(),
        exdir = std_dict_path())

  unlink(std_dict_path_full())
}

std_dict_path <- function() {
  path <- Sys.getenv("STDICTKR_HOME")
  if (nzchar(path)) {
    normalizePath(path, mustWork = FALSE)
  } else {
    normalizePath(file.path(system.file("", package = "stdictkr"), "dict"),
                  mustWork = FALSE)
  }
}

std_dict_path_full <- function() {
  normalizePath(file.path(std_dict_path(), "dictxml.zip"), mustWork = FALSE)
}

# TODO: need to load tbl
std_dict_load <- function() {
  tars <-
    normalizePath(file.path(std_dict_path(), list.files(std_dict_path())), mustWork = FALSE)
  purrr::map(tars, ~ xml2::read_xml(.x) %>% rvest::html_nodes("item"))
}
