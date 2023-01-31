#' @title Reverse complement
#' @description Take that flip it and reverse it
#' @param x A DNA sequence consisting of A, C, G, and T
#' @return A reverse-complemented DNA sequence
#' @export
#' @examples
#' missyelliot("GATTACA")
missyelliot <- Vectorize(function(x) {
  xvec <- strsplit(x, "")[[1]]
  if (!all(xvec %in% c("A", "C", "G", "T"))) stop("Doesn't look like a DNA sequence.")
  xrev <- rev(xvec)
  xrevcomp <- chartr("ACGT", "TGCA", xrev)
  res <- paste(xrevcomp, collapse="")
  return(res)
})
