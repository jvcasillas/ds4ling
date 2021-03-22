set.seed(20210322)

n <- 1e+04
a_h <- 35
a_s <- 50
b <- 1.25
sigma_h <- rnorm(n = n, mean = 0, sd = 3)
sigma_s <- rnorm(n = n, mean = 0, sd = 2)

age    <- round(seq(5, 18, length.out = n), 1)
height <- a_h + (age * b) + sigma_h
score  <- a_s + (age * b) + sigma_s

mrc_ex_data <- data.frame(
  age,
  height,
  score,
  age_c = age - mean(age),
  height_c = height - mean(height)
  )

usethis::use_data(mrc_ex_data, overwrite = TRUE)
