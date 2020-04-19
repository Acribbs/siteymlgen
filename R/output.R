# Configure the output of the final website
siteymlgen_output <- function(toc=TRUE, toc_depth=2, toc_title=NULL, ...){

  test <- siteymlgen_output_list()

  suppressWarnings(test$output$html_document <- siteymlgen_toc_options(toc=TRUE))

  test$output[1] <- NULL
  return(test)
}
