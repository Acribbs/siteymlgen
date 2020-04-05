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
siteymlgen_navbar_init <- function(left=NULL, title=NULL, right=NULL, type=NULL, navbar_list=NULL){
  if (!is.null(left)){
    ymlthis::yml_empty() %>%
      siteymlgen_navbar(
        title="Left",
        type=type,
        left=navbar_list,
        right=NULL)
  }else if(!is.null(right)){
    ymlthis::yml_empty() %>%
      siteymlgen_navbar(
        title="Right",
        type=type,
        left=NULL,
        right=navbar_list)
  }else{

  }
}


#' @param title The title of the website
#' @param type The color scheme for the navigation bar: either "default" or "inverse".
#' @param left,right the side of the navbar a `navbar_page()` should go (see example)
#'
siteymlgen_navbar <- function(.yml, title =NULL, type = NULL,
                       left = NULL, right = NULL, ...) {
  navbar <- list(
    title = title,
    type = type,
    left = left,
    right = right,
    ...
  ) %>%
    purrr::discard(ymlthis::is_yml_blank)

  .yml$navbar <- navbar

  .yml
}


#' @param text The link text
#' @param href The link URL
#' @param icon An icon to include
#' @param menu drop-down menus specified by including another `navbar_page()`
#'
siteymlgen_navbar_page <- function(text = NULL, href = NULL, icon = NULL, menu = NULL, ...) {
    list(
      text = text,
      href = href,
      icon = icon,
      menu = menu,
      ...
    ) %>%
      purrr::discard(ymlthis::is_yml_blank)
  }

