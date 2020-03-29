#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @inheritParams tidyr::separate
#' @importFrom magrittr %>%
#' @return A matrix of the infile
siteymlgen_parsenav <- function(.yml, dir="test/",
                                title=NULL, type=NULL, left=NULL, right =NULL, ...){
  infiles <- list.files(dir, pattern = c("md","Rmd"))
  n <- length(infiles)
  previous = ""
  # loop over infiles and then assign text and href based off the name of file
  # Index as first navbar


  home <- list(ymlthis::navbar_page("Home", href = "index.html"))


  for(infile in infiles){

    infile.replace <- gsub(infile, pattern = "\\.\\S+$", replacement = "")

    if (infile.replace == "index"){
      next
    }else{

      # Need to state if the current matches previous and if it does add menu
      current <- stringr::str_extract(infile.replace, "[A-Z][1-9]+")
      name <- stringr::str_extract(infile.replace, "\\S+")


      href_infile <- paste0(name, ".html", sep="")

      home <- rlist::list.append(home,
                                 ymlthis::navbar_page(name, href = href_infile))

    }


}

    ymlthis::yml_empty() %>%
      ymlthis::yml_navbar(
      title = "My Website",
      left = home)
}
