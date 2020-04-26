context("test-navbar_yaml_results")

if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that the navbar is generated accordingly", {
  test_dir <- system.file("extdata", package="siteymlgen")
  result <- siteymlgen_parsenav(dir=test_dir, left="yes", right=NULL, navbar_title="test") %>%
    yaml::as.yaml()

  yaml_string <-"navbar:\n  title: test\n  type: ~\n  left:\n  - text: Home\n    href: index.html\n  - text: A1_test\n    href: A1_test.html\n    icon: '~'\n    menu:\n    - text: A1_test\n      href: A1_test.html\n      icon: fa-gear\n      menu: ~\n    - text: A2_test1\n      href: A2_test1.html\n      icon: '~'\n      menu: ~\n  - text: B1_test1\n    href: B1_test1.html\n    icon: '~'\n    menu:\n    - text: B1_test1\n      href: B1_test1.html\n      icon: '~'\n      menu: ~\n    - text: B2_test1\n      href: B2_test1.html\n      icon: '~'\n      menu: ~\n    - text: B3_test1\n      href: B3_test1.html\n      icon: '~'\n      menu: ~\n  - text: C1_test1\n    href: C1_test1.html\n    icon: '~'\n    menu: ~\n  right: ~\n"
  expect_equal(result, yaml_string)
})
