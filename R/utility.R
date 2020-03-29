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
siteymlgen_navbar <- function(left=NULL, right=NULL, navbar_list=NULL, menu_list=NULL){
  if (!is.null(left)){
    ymlthis::yml_empty() %>%
      ymlthis::yml_navbar(
        title = "My Website",
        left = navbar_list,
        menu=menu_list)
  }else if(!is.null(right)){
    ymlthis::yml_empty() %>%
      ymlthis::yml_navbar(
        title = "My Website",
        right = navbar_list,
        menu = menu_list)
  }else{

  }
}
