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
siteymlgen_parsenav <- function(.yml, dir="../BOTNAR_projects/proj003/tes/",
                                title=NULL, type=NULL, left=NULL, right =NULL, ...){
  infiles <- list.files(dir, pattern = c("md","Rmd"))
  n <- length(infiles)
  value = ""

  for(infile in infiles){

    n <- n - 1

    infile <- gsub(infile, pattern = "\\.\\S+$", replacement = "")
    href_infile <- paste0(infile, ".html", sep="")

    navbar <- list(
      text = infile,
      href = href_infile,
      left = left,
      right = right,
      ...
    ) %>%
      purrr::discard()

    value <- paste(value, now)

  if(n > 0){
      value <- paste(value, "%>%")
  }else{
    break
  }
}

return(value)

}
