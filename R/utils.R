#' @title Reverse complement
#' @description Take that flip it and reverse it
#' @param x A DNA sequence consisting of A, C, G, and T
#' @return A reverse-complemented DNA sequence
#' @export
#' @examples
#' missyelliot("GATTACA")
#' missyelliot(c("GATTACA", "CATATTAC"))
missyelliot <- function(x) {
  sapply(x, function(seq) {
    xvec <- strsplit(seq, "")[[1]]
    if (!all(xvec %in% c("A", "C", "G", "T"))) stop("Doesn't look like a DNA sequence.")
    xrev <- rev(xvec)
    xrevcomp <- chartr("ACGT", "TGCA", xrev)
    paste(xrevcomp, collapse="")
  })
}
