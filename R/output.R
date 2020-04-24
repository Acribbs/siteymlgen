# Configure the output of the final website
siteymlgen_output <- function(toc=FALSE, toc_depth=NULL, toc_title=NULL,
                              toc_float=NULL, theme=NULL, highlight=NULL, css=NULL, ...){

  if(length(is.na(toc_depth)) == 0){
    toc_depth_present = 'TRUE'
  } else {
    toc_depth_present ='FALSE'
    }

  # if toc is true and toc_depth is null change to toc_depth=1
  if(toc == TRUE & as.logical(toc_depth_present)){
    toc_depth=1
  } else {
    toc_depth=toc_depth
  }

  output <- siteymlgen_output_list()

  toc_list <- siteymlgen_toc_options(toc=toc, toc_depth=toc_depth, toc_title=toc_title,
                         toc_float=toc_float)
  appearance <- siteymlgen_appearance(theme=theme, highlight=highlight, css=css)

  output_list <- c(toc_list, appearance)

  suppressWarnings(output$output$html_document <- output_list)

  output$output[1] <- NULL
  return(output)
}


