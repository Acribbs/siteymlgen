# Configure the output of the final website
siteymlgen_output <- function(.yml, toc=TRUE, toc_depth=2, toc_title=NULL, highlight = "textmate", ...){


  ymlthis::yml_output(.yml, rmarkdown::html_document()) %>%
    ymlthis::yml_toc(toc=toc, toc_depth=toc_depth, toc_title=toc_title)
  test <-
    siteymlgen_output_list()

  test$output$html_document <- siteymlgen_toc_options(toc=TRUE)

  test$output[1] <- NULL

  as_yml(test)

}
