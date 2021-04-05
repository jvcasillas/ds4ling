set.seed(1)

vals <- c(-60, -50, -40, -30, -20, -10, 0,
           10,  20,  30,  40,  50,  60)
vot <- rep(vals, each = 200)
resp <- c(rbinom(1200, 0:1, 0.15),
          rbinom(200, 0:1, 0.35),
          rbinom(200, 1, 0.4),
          rbinom(200, 1, 0.55),
          rbinom(100, 1, 0.7),
          rbinom(700, 1, 0.9))

vot_logistic_data <- data.frame(resp = resp, vot = vot)

usethis::use_data(vot_logistic_data, overwrite = TRUE)
