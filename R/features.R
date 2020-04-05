# Generate a set of top level features for the yaml document
#
# This function handles the generation of top level features that are used to
# describe the generation of the website, such as `author`, `date`, `title` and
# `site options`.

siteymlgen_toplevel <- function(name=NULL, date=NULL, affiliation=NULL, title=NULL,
                                categories=NULL, output_dir=NULL, include=NULL,
                                exclude=NULL, authors=NULL, ...){
    ymlthis::yml() %>%
    ymlthis::yml_site_opts(name=name,
                           output_dir = output_dir,
                           include = include,
                           exclude = exclude) %>%
    ymlthis::yml_date(date) %>%
    ymlthis::yml_title(title) %>%
    ymlthis::yml_category(categories) %>%
    ymlthis::yml_author(
      eval(authors),
      affiliation = affiliation
    )
  }


