# For automatically poarsing the navbar
siteymlgen_parsenav <- function(.yml, dir="../BOTNAR_projects/proj003/tes/",
                                title=, type = , left = , right =, ...){
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
      left = left
      right = right,
      ...
    ) %>%
      purrr::discard()

    value <- paste(value, now)

    if(n > 0)
      value <- paste(value, "%>%")
  }else{
    break
  }
}

return(value)

}
