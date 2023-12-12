# args <- commandArgs(TRUE)
# file_path <- args[1]
# file <- basename(file_path)
# file_dir <- dirname(file_path)


root_dir <- "./"
build_dir <- "build" # todo: cli arg

render_md <- function(file_path, build_dir) {
  # file <- basename(file_path)
  file_path <- normalizePath(file_path)
  build_dir <- normalizePath(build_dir)
  file_dir <- dirname(file_path)

  rmarkdown::render(file_path,
    output_dir = build_dir,
    knit_root_dir = file_dir
  )
}


render_all_md <- function(root_dir, build_dir) {
  dir.create(build_dir)

  files <- list.files(root_dir, recursive = TRUE)

  for (file in files) {
    if (tools::file_ext(file) == "Rmd") {
      render_md(file, build_dir)
    }
  }
}

render_all_md(root_dir, build_dir)
