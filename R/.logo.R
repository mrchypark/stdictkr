download.file(
  "https://stdict.korean.go.kr/images/common/logo_big.png",
  "./man/figures/logo_image.png", mode = "wb"
)

library(magick)

im <- image_read("./man/figures/logo_image.png")
imc <- image_crop(im, "230x170")
image_write(imc, path = "./man/figures/logo_crop.png", format = "png")

library(hexSticker)

# for windows
sticker(
  "./man/figures/logo_crop.png",
  s_x = 1, s_y = 0.75,
  package = "stdictkr",
  p_size = 45, p_y = 1.4, p_x = 1,
  filename = "man/figures/logo.png",
  h_fill = "#f8f8f0",
  p_color = "#222222",
  h_color = "#3f3936",
  url = "mrchypark.github.io/stdictkr",
  u_size = 9,
  u_color = "#3f3936",
  dpi = 500
)
