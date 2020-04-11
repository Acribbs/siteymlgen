#' Initiate the yaml generation
#'
#' This function acts as an entry point for the initialisation of the yaml
#' generation.
#'
#' @param authors A character or vector of characters of authors to add to the _site.yml
#' @param name A character or a vector of characters describing
#'   the name of the author(s)
#' @param date A character or a vector of characters describing
#'   the date
#' @param affiliation A character or a vector of characters describing the
#'   authors affiliation. The affiliation which must match the length of the
#'   vector supplied to `name`.
#' @param dir The directory of the Rmarkdown documents that you want automatically
#'   built into a _site.yml file.
#' @param left A TRUE or FALSE value that determines if you want your navigation bar
#'   left aligned. This is the default location.
#' @param right A TRUE or FALSE value that determines if you want your navigation bar
#'   right aligned. Left aligned is the default location
#' @param navbar_title The title of the navigation bar. If none supplied this defaults
#'   to "Title"
#' @param title A character describing the title of the website. This defaults to
#'   "siteymlgen" if no value is supplied
#' @param categories A character or vector of characters describing the categories
#'   for the website.
#' @param output_dir A character describing the output directory name for the final
#'   Rmarkdown website.
#' @param include A character or vector of characters detailing the extra files to include
#'   in the final Rmarkdown build
#' @param exclude A character or vector of characters detailing the files not to include
#'   in the final Rmarkdown build
#' @param toc Specify whether a table of contents is required for your website, defaults
#'   to TRUE
#' @param highlight Syntax highlighting style for html_output from the rmarkdown package.
#'   Supported styles include "default",
#'   "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", "haddock",
#'   and "textmate". Pass NULL to prevent syntax highlighting
#' @importFrom magrittr %>%
#' @return A _site.yml file
#' @export
init_siteymlgen <- function(authors=NULL, date=lubridate::today(),
                            affiliation=NULL, dir=".", left=NULL, right=NULL,
                            navbar_title=NULL, title="siteymlgen", categories=NULL,
                            name=NULL, output_dir=NULL, include=NULL,
                            exclude=NULL, toc=TRUE, highlight=NULL, ...){

  features <- siteymlgen_toplevel(authors=authors, date=as.character(date), affiliation=affiliation,
                                  title=title, categories=categories, name=name, output_dir=output_dir, include=include,
                                  exclude=exclude)

  parseenv <- siteymlgen_parsenav(dir=dir, left=left, right=right, navbar_title=navbar_title)

  output <- siteymlgen_output()

  yml_final <- c(features, parseenv, output)


  yaml::write_yaml(yml_final, file="_site.yml")


}




