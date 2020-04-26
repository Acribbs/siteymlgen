context("test-features_yaml_results")

if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that author name and date are rendered correctly", {
  result <- siteymlgen_toplevel(date="2020-04-11",
                                authors="Adam",
                                affiliation="University of Oxford")

  expect_equal(sort(names(result)), c("author", "date", "exclude", "include", "name", "output_dir", "title"))
  expect_length(result, 7)
})

