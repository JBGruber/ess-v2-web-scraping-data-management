setwd("01_Introduction/")
media <- list.files("media/")
lines <- list.files(pattern = ".qmd") |>
  readLines()

for (m in media) {
  if (!any(grepl(paste0("media/", m), lines))) {
    message(m, " is superfluous")
  }
}
