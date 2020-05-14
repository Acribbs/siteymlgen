context("test-init_yaml_results")


if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that the init function gives warning when file is not spceified", {
  test_dir <- system.file("extdata", package="siteymlgen")
  expect_warning(init(authors = c("Adam","Paul"), left="yes", dir=test_dir, navbar_title = "Main title", title = "hello", categories=c("r", "reprodicibility"), toc=TRUE, toc_depth = 3))
})
