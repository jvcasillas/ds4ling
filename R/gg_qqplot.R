#' QQ-plot function
#'
#' This function creates a QQ-plot using ggplot
#'
#' @param gg_qqplot A function for generating QQ-plots
#' @param vec A numeric vector
#' @keywords plot
#' @import ggplot2
#' @import dplyr
#' @import tibble
#' @importFrom stats cor qqnorm
#' @importFrom rlang .data
#' @export
#' @examples
#' gg_qqplot(rnorm(30))
#'
# QQ plot function
gg_qqplot <- function(vec) {

the_cor <- round(cor(vec, qqnorm(vec)$x), 3)

ggplot(tibble(vec), aes(sample = vec)) +
  stat_qq(pch = 21, size = 1.25, fill = "grey") +
  stat_qq_line() +
  annotate("text", x = -1, y = mean(vec),
    label = paste0("r = ", the_cor)) +
  labs(x = "Theoretical quantiles", y = "Sample quantiles") +
  ds4ling_theme() +
  theme(axis.line = element_line(colour = "black"))

}

