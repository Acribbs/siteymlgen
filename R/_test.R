infiles=c("A1_test.Rmd", "A2_test1.Rmd", "B1_test.Rmd")

library(ymlthis)
yml <- yml_empty() %>%
  yml_site_opts(
    name = "my-website",
    output_dir =  "_site",
    include = "demo.R",
    exclude = c("docs.txt", "*.csv")
  ) %>%
  yml_navbar(
    title = "My Website",
    left = list(
      navbar_page("Home", href = "index.html", menu = list(navbar_page("Home", href = "index.html"),
                                                           navbar_page("Home", href = "index.html")))
    )

  ) %>%
  ymlthis::yml_latex_opts(biblio_style = "apalike")


foo <- vector(mode="list", length=3)
names(foo) <- c("tic", "tac", "toe")
foo[[1]] <- 12; foo[[2]] <- 22; foo[[3]] <- 33
names(foo)




devtools::load_all()
init_siteymlgen(authors = c("Adam","Paul"), left="yes", dir="~/Documents/siteymlgen/inst/extdata/")


init(authors = c("Adam","Paul"), left="yes", dir="~/Documents/siteymlgen/inst/extdata/", navbar_title = "Main title", title = "hello", categories=c("r", "reprodicibility"))
