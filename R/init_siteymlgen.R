#' Initiate the yaml generation
#'
#' This function acts as an entry point for the initialisation of the yaml
#' generation.
#'
#' @param authors A character or vector of characters of authors to add to the _site.yml
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
#' @param name A character or a vector of characters describing
#'   the name of the author(s)
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
#' @param toc_depth An integer to specify the depth of the table of contents
#' @param toc_title A character that sets the toable of contents title
#' @param toc_float A boolean to specify if the table of contents is static or floats.
#'   defaults to FALSE.
#' @param theme An Rmarkdown theme to set the render output. Defaults to 'united'.
#' @param css Specify custom css.
#' @param file Specify the output filename. Default to tempfile.
#' @importFrom magrittr %>%
#' @return A _site.yml file populated with yaml code.
#' @examples
#' init(authors = c("Adam","Paul"), left="yes",
#' navbar_title = "Main title", title = "hello",
#' categories=c("r", "reprodicibility"))
#' @export
init <- function(authors="author", date=lubridate::today(),
                 affiliation=NULL, dir=getwd(), left="yes", right=NULL,
                 navbar_title="Title", title="siteymlgen", categories=NULL,
                 name=NULL, output_dir=NULL, include=NULL,
                 exclude=NULL, toc=FALSE, toc_depth=NULL, toc_title= NULL, toc_float=FALSE,
                 theme="united", highlight=NULL, css=NULL, file=tempfile()){

  # Create a file
  file.create(file)

  features <- siteymlgen_toplevel(authors=authors,
                                  date=as.character(date),
                                  affiliation=affiliation,
                                  title=title,
                                  categories=categories,
                                  name=name,
                                  output_dir=output_dir,
                                  include=include,
                                  exclude=exclude)

  parseenv <- siteymlgen_parsenav(dir=dir,
                                  left=left,
                                  right=right,
                                  navbar_title=navbar_title)

  output <- siteymlgen_output(toc=toc,
                              toc_depth=toc_depth,
                              toc_title=toc_title,
                              toc_float=toc_float,
                              theme=theme,
                              highlight=highlight,
                              css=css)

  yml_final <- c(features,
                 parseenv,
                 output)

  yaml::write_yaml(yml_final, file=file)
}




