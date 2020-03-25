#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @param authors Path to the input file
#' @return A matrix of the infile
#' @export
siteymlgen_blank <- function() {
  structure(list(), class = "yml_blank")
}

#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @param authors Path to the input file
#' @return A matrix of the infile
#' @export
is_siteymlgen_blank <- function(x) {
  inherits(x, "yml_blank")
}
