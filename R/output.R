# Configure the output of the final website
siteymlgen_output <- function(toc=TRUE, highlight = "textmate", ...){

  ymlthis::yml_output(rmarkdown::html_document(toc = toc, highlight = highlight))

}
