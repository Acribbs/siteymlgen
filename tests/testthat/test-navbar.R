context("test-navbar_yaml_results")

if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that the navbar is generated accordingly", {
  test_dir <- system.file("extdata", package="siteymlgen")
  result <- siteymlgen_parsenav(dir=test_dir, left="yes", right=NULL, navbar_title="test") %>%
    yaml::as.yaml()

  yaml_string <-"navbar:\n  title: test\n  type: ~\n  left:\n  - text: Home\n    href: index.html\n  - text: test\n    href: test.html\n    icon: '~'\n    menu:\n    - text: test\n      href: test.html\n      icon: fa-gear\n      menu: ~\n    - text: test1\n      href: test1.html\n      icon: '~'\n      menu: ~\n  - text: test1\n    href: test1.html\n    icon: '~'\n    menu:\n    - text: test1\n      href: test1.html\n      icon: '~'\n      menu: ~\n    - text: test1\n      href: test1.html\n      icon: '~'\n      menu: ~\n    - text: test1\n      href: test1.html\n      icon: '~'\n      menu: ~\n  - text: test1\n    href: test1.html\n    icon: '~'\n    menu: ~\n  right: ~\n"
  expect_equal(result, yaml_string)
})
