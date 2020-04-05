# Generate a navbar
#
# This function parses the directory for Rmarkdown documents and then parses
# the prefixes to generate an automatic heirarchy that is then used to pass
# to generate a yaml menu attribute
siteymlgen_parsenav <- function(.yml, dir=NULL,
                                navbar_title=NULL, type=NULL, left=NULL, right =NULL, ...){
  infiles <- list.files(dir, pattern = c("md$"))

  # Make a named list and save infiles with suffixes
  files_dict <- vector(mode="list", length=length(infiles))
  names(files_dict) <- stringr::str_extract(infiles, "[A-Z]")

  for (infile in infiles){
    letter <- stringr::str_extract(infile, "^[A-Z]")
    number <- as.integer(stringr::str_extract(infile, "[1-9]+"))
    files_dict[[letter]] <- number
  }



  # Select all conditions where there are more than 2 files
  files_dict[sapply(files_dict, is.null)] <- NULL
  files_dict[sapply(files_dict, is.na)] <- NULL
  cond <- lapply(files_dict, function(x) x > 1)
  more_than_one <- paste0(names(files_dict[as.logical(cond)]), collapse="")
  equal_to_one <- paste0(names(files_dict[!as.logical(cond)]), collapse = "")


  # loop over infiles and then assign text and href based off the name of file
  # Index as first navbar
  navbar_list <- list(ymlthis::navbar_page("Home", href = "index.html"))
  menu_list = list()

  for(infile in infiles){


    infile.replace <- gsub(infile, pattern = "\\.\\S+$", replacement = "")


    if (infile.replace == "index"){

    }else if(!grepl(stringr::str_extract(infile.replace, "[A-Z]"),more_than_one)){

      # Need to state if the current matches previous and if it does add menu
      name <- stringr::str_extract(infile.replace, "\\S+")

      href_infile <- paste0(name, ".html", sep="")

      navbar_list <- rlist::list.append(navbar_list,
                                        siteymlgen_navbar_page(name, href = href_infile))
    }else{

      # Need to make a list of navbar_page for menu
      name <- stringr::str_extract(infile.replace, "\\S+")

      href_infile <- paste0(name, ".html", sep="")

      file_no <- stringr::str_extract(infile.replace, "[1-9]")
      file_letter <- file_value <- stringr::str_extract(infile.replace, "[A-Z]")
      max_files <- unlist(files_dict)[file_letter][[1]]


      if (grepl("[A-Z]1", infile)){

        first_name = name
        first_href = href_infile

        menu_list <- rlist::list.append(menu_list,
                                        siteymlgen_navbar_page(name, href = href_infile))
      } else if(file_no < max_files){

        menu_list <- rlist::list.append(menu_list,
                                        siteymlgen_navbar_page(name, href = href_infile))

      }else if(file_no == max_files){

        menu_list <- rlist::list.append(menu_list,
                                        siteymlgen_navbar_page(name, href = href_infile))


        navbar_list <- rlist::list.append(navbar_list, siteymlgen_navbar_page(first_name, href = first_href, menu=menu_list))

        menu_list = list()
      }


    }

  }
  siteymlgen_navbar_init(left=left, right=right, navbar_list=navbar_list, navbar_title=navbar_title)

}














