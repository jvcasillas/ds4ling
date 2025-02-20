# Riverside income and education data -----------------------------------------
#
# Create 'riverside' for QASS 22, Ch 1
# Copied from Table 2, p. 16
#
# -----------------------------------------------------------------------------

# Respondents
respondent <- 1:32

# Education vector
education <- c(
  4, 4, 6, 6, 6, 8, 8, 8, 8, 10, 10, 10, 11, 12, 12, 12, 12, 12, 13, 14, 14,
  15, 15, 16, 16, 16, 16, 17, 17, 18, 18, 20
)

# Income vector
income <- c(
  6281, 10516, 6898, 8212, 11744, 8618, 10011, 12405, 14664, 7472, 11598,
  15336, 10186, 9771, 12444, 14213, 16908, 18347, 19546, 12660, 16326,
  12772, 17218, 12599, 14852, 19138, 21779, 16428, 20018, 16526, 19414,
  18822
)

# Create tibble
riverside <- data.frame(
  respondent = respondent,
  education = education,
  income = income
)

usethis::use_data(riverside, overwrite = TRUE)
