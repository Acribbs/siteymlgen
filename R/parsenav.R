#' Load a Matrix
#'
#' This function loads a file as a matrix. It assumes that the first column
#' contains the rownames and the subsequent columns are the sample identifiers.
#' Any rows with duplicated row names will be dropped with the first one being
#' kepted.
#'
#' @param infile Path to the input file
#' @return A matrix of the infile
#' @export
siteymlgen_parsenav <- function(.yml, dir="test/",
                                title=NULL, type=NULL, left=NULL, right =NULL, ...){
  infiles <- list.files(dir, pattern = c("md","Rmd"))
  n <- length(infiles)
  value = ""
  # loop over infiles and then assign text and href based off the name of file
  # Index as first navbar


  home <- list(navbar_page("Home", href = "index.html"))


  for(infile in infiles){

    infile.replace <- gsub(infile, pattern = "\\.\\S+$", replacement = "")

    if (infile.replace == "index"){
      next
    }else{
      ident <- str_extract(infile.replace, "[A-Z]+[1-9]+")
      name <- str_extract(infile.replace, "\\S+")
      print(name)
      href_infile <- paste0(name, ".html", sep="")

      home <- rlist::list.append(home,navbar_page(name, href = href_infile))

    }


}

    ymlthis::yml_empty() %>%
    yml_navbar(
      title = "My Website",
      left = home)
}
