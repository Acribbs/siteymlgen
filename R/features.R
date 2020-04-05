#' Generate a set of top level features for the yaml document
#'
#' This function handles the generation of top level features that are used to
#' describe the generation of the website, such as `author`, `date`, `title` and
#' `site options`.
#'
#' @param name A character or a vector of characters describing
#'   the name of the author(s)
#' @param date A character or a vector of characters describing
#'   the date
#' @param affiliation A character or a vector of characters describing the
#'   authors affiliation. The affiliation which must match the length of the
#'   vector supplied to `name`.
#' @param title A character describing the title of the website.
#' @param categories A character or vector of characters describing the categories
#'   for the website.
#' @param output_dir A character describing the output directory name for the final
#'   Rmarkdown website.
#' @param include A character or vector of characters detailing the extra files to include
#'   in the final Rmarkdown build
#' @param exclude A character or vector of characters detailing the files not to include
#'   in the final Rmarkdown build
#' @param authors A character or vector of characters of authors to add to the _site.yml
#' @importFrom magrittr %>%
#' @return A matrix of the infile

siteymlgen_toplevel <- function(name=NULL, date=NULL, affiliation=NULL, title=NULL,
                                categories=NULL, output_dir=NULL, include=NULL,
                                exclude=NULL, authors=NULL, ...){
    ymlthis::yml() %>%
    ymlthis::yml_site_opts(name=name,
                           output_dir = output_dir,
                           include = include,
                           exclude = exclude) %>%
    ymlthis::yml_date(date) %>%
    ymlthis::yml_title(title) %>%
    ymlthis::yml_category(categories) %>%
    ymlthis::yml_author(
      eval(authors),
      affiliation = affiliation
    )
  }


