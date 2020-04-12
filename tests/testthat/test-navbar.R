context("test-navbar_yaml_results")


test_that("Test that the navbar is generated accordingly", {

  test_dir <- "../inst/extdata/"
  result <- siteymlgen_parsenav(dir=test_dir, left="yes", right=NULL, navbar_title="test")

  yaml_string <-"---
navbar:
  title: test
  type: null
  left:
  - text: Home
    href: index.html
  - text: A1_test
    href: A1_test.html
    icon: null
    menu:
    - text: A1_test
      href: A1_test.html
      icon: null
      menu: null
    - text: A2_test1
      href: A2_test1.html
      icon: null
      menu: null
  - text: B1_test1
    href: B1_test1.html
    icon: null
    menu:
    - text: B1_test1
      href: B1_test1.html
      icon: null
      menu: null
    - text: B2_test1
      href: B2_test1.html
      icon: null
      menu: null
    - text: B3_test1
      href: B3_test1.html
      icon: null
      menu: null
  - text: C1_test1
    href: C1_test1.html
    icon: null
    menu: null
  right: null
---"

  expect_equal(result, yaml_string)
})
