#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @inheritParams tidyr::separate
#' @importFrom magrittr "%>%"
#' @return A matrix of the infile
#' @export
init_siteymlgen <- function(.yml=NULL, authors=NULL, date=lubridate::today(),
                            affiliation=NULL, dir=NULL, left=NULL, right=NULL,
                            navbar_title=NULL, title="siteymlgen", categories=NULL){

  features <- siteymlgen_features(authors=authors, date=as.character(date), affiliation=affiliation,
                                  title=title, categories=categories)

  parseenv <- siteymlgen_parsenav(dir=dir, left=left, right=right, navbar_title=navbar_title)

  #output <- siteymlgen_output()

  yml_final <- c(features, parseenv)


  yaml::write_yaml(yml_final, file="_site.yml")


}




