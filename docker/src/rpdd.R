args <- commandArgs(trailingOnly=TRUE)
readLines(args[1]) |>
  rpdd::missyelliot() |>
  cat(sep="\n")
