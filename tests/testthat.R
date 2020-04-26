Sys.setenv("R_TESTS" = "")
library(testthat)
library(siteymlgen)

test_check("siteymlgen")
