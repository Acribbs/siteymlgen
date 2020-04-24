context("test-features_yaml_results")

if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that author name and date are rendered correctly", {
  result <- siteymlgen_toplevel(authors="Adam", date=as.character(2020-04-11),
                      title="siteymlgen", name=NULL, output_dir="_site") %>%
    yaml::as.yaml()

yaml_string <-
"author: Adam
date: '2005'
name: ~
output_dir: _site
include: ~
exclude: ~
title: siteymlgen
"

  expect_equal(result, yaml_string)
})
