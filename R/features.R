#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @param authors Path to the input file
#' @inheritParams tidyr::separate
#' @importFrom magrittr %>%
#' @return A matrix of the infile

siteymlgen_features <- function(authors=NULL, date=NULL, affiliation=NULL, title=NULL,
                                categories=NULL){
    ymlthis::yml() %>%
    ymlthis::yml_author(
      eval(authors),
      affiliation = affiliation
    ) %>%
    ymlthis::yml_date(date) %>%
    ymlthis::yml_title(title) %>%
    ymlthis::yml_category(categories)
}


