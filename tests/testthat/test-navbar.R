context("test-navbar_yaml_results")

if (!rmarkdown::pandoc_available()) testthat::skip("Pandoc not found")

test_that("Test that the navbar is generated accordingly", {
  test_dir <- system.file("extdata", package="siteymlgen")
  result <- siteymlgen_parsenav(dir=test_dir, left="yes", right=NULL, navbar_title="test") %>%
    yaml::as.yaml()

  yaml_string <-"navbar:
  title: test
  type: ~
  left:
  - text: Home
    href: index.html
  - text: A1_test
    href: A1_test.html
    icon: ~
    menu:
    - text: A1_test
      href: A1_test.html
      icon: ~
      menu: ~
    - text: A2_test1
      href: A2_test1.html
      icon: ~
      menu: ~
  - text: B1_test1
    href: B1_test1.html
    icon: ~
    menu:
    - text: B1_test1
      href: B1_test1.html
      icon: ~
      menu: ~
    - text: B2_test1
      href: B2_test1.html
      icon: ~
      menu: ~
    - text: B3_test1
      href: B3_test1.html
      icon: ~
      menu: ~
  - text: C1_test1
    href: C1_test1.html
    icon: ~
    menu: ~
  right: ~
"
  expect_equal(result, yaml_string)
})
