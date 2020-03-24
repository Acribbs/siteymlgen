
siteymlgen_blank <- function() {
  structure(list(), class = "yml_blank")
}

is_siteymlgen_blank <- function(x) {
  inherits(x, "yml_blank")
}
