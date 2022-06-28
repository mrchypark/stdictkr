

body <- list(
  link_key =  976570,
  pageUnit = 10,
  pageIndex = 1
)
httr::POST("https://stdict.korean.go.kr/common/download.do",
           body = body)
