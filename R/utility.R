# Function for generating a left or right navbar depending on the presence
# of right or left. Will default to left if both right and left have values
# supplied
siteymlgen_navbar_init <- function(left=NULL, title=NULL, right=NULL, type=NULL, navbar_list=NULL,
                                   navbar_title=NULL, ...){
  if (!is.null(left)){
    ymlthis::yml_empty() %>%
      siteymlgen_navbar(
        title=navbar_title,
        type=type,
        left=navbar_list,
        right=NULL)
  }else if(!is.null(right)){
    ymlthis::yml_empty() %>%
      siteymlgen_navbar(
        title=navbar_title,
        type=type,
        left=NULL,
        right=navbar_list)
  }else{

  }
}


# A function to create the navbar. This was modified from the
# navbar code of ymlthis
siteymlgen_navbar <- function(.yml, title =NULL, type = NULL,
                       left = NULL, right = NULL, ...) {
  navbar <- list(
    title = title,
    type = type,
    left = left,
    right = right,
    ...
  ) %>%
    purrr::discard(ymlthis::is_yml_blank)

  .yml$navbar <- navbar

  .yml
}


# A function to create the navbar page. This was modified from the
# navbar code of ymlthis
siteymlgen_navbar_page <- function(text = NULL, href = NULL, icon = NULL, menu = NULL, ...) {
    list(
      text = text,
      href = href,
      icon = icon,
      menu = menu,
      ...
    ) %>%
      purrr::discard(ymlthis::is_yml_blank)
  }

# This function creats the output list
siteymlgen_output_list <- function(html_document="html_document", ...){
  list(
    output = html_document,
    ...
  ) %>%
    purrr::discard(ymlthis::is_yml_blank)
}


siteymlgen_toc_options <- function(toc=NULL, toc_float=NULL, toc_depth=NULL, toc_title=NULL, ...){

  list(
  "toc" = toc,
  "toc_float" = toc_float,
  "toc_depth" = toc_depth,
  "toc_title" = toc_title,
  ...
  ) %>%
    purrr::discard(ymlthis::is_yml_blank)
  }

siteymlgen_appearance <- function(theme=NULL, highlight=NULL, css=NULL, ...){

  list(
    "theme" = theme,
    "highlight" = highlight,
    "css" = css,
    ...
  ) %>%
    purrr::discard(ymlthis::is_yml_blank)
}

