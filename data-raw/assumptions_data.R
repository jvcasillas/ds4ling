# create assumptions data -----------------------------------------------------
#
# Create 'assumptions_data' for teaching model checking
#
# -----------------------------------------------------------------------------

library("tidyverse")
set.seed(1)
n <- 50
b0 <- 0
b1 <- -2
sigma <- 0.6

assumptions_data <- tibble(
    x = sort(rnorm(n = n)),
    y =      b0 + (x * b1)   + rnorm(n = n, sd = sigma),
    y_quad = b0 + (x * b1)^2 + rnorm(n = n, sd = sigma)
  ) %>%
  add_row(., x = -2, y = -2, y_quad = 7)

usethis::use_data(assumptions_data, overwrite = TRUE)
