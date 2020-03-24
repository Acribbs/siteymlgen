library(ymlthis)

authors <- list("Yihui Xie", "Hadley Wickham")



init_siteymlgen <- function(authors=NULL, date=NULL, affiliation=NULL){

  features <- siteymlgen_features(authors, date, affiliation)

  parseenv <- siteymlgen_parsenav()

  output <- siteymlgen_output()

  yml_final <- c(features, parseenv, output)


  yaml::write_yaml(yml_final, file="_site.yml")


}




author_list <- list(author = c("Adam", "Natalia"))
yaml[names(author_list)] <- author_list







init_siteymlgen(authors = authors)



