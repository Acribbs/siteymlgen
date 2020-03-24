# For author data time e.c.t.
siteymlgen_features <- function(authors=NULL, date=NULL, affiliation=NULL ){
   yaml <- ymlthis::yml() %>%
    ymlthis::yml_author(
      eval(authors),
      affiliation = affiliation
    ) %>%
    ymlthis::yml_date("07/04/2019") %>%
    ymlthis::yml_title("Reproducible Research in R") %>%
    ymlthis::yml_category(c("r", "reprodicibility"))
}


