#' QQ-plot function
#'
#' This function creates a QQ-plot using ggplot
#'
#' @param gg_qqplot A function for generating QQ-plots
#' @param vec A numeric vector
#' @keywords plot
#' @import ggplot2
#' @import dplyr
#' @importFrom stats quantile qnorm cor qqnorm
#' @importFrom rlang .data
#' @export
#' @examples
#' gg_qqplot(rnorm(30))
#'
# QQ plot function
gg_qqplot <- function(vec) {

  # Get slope and intercept for qqline
  # from base R's qqline()
  y <- quantile(vec[!is.na(vec)], c(0.25, 0.75))
  x <- qnorm(c(0.25, 0.75))
  slope <- diff(y) / diff(x)
  int <- y[1L] - slope * x[1L]

  # Calculate vec and qq correlation
  the_cor <- cor(vec, qqnorm(vec)$x)

  # Create plot
  tibble(resid = vec) %>%
  ggplot() +
    aes(sample = .data$resid) +
    geom_point(stat = 'qq', shape = 21, color = "grey30",
               fill = 'lightblue') +
    geom_abline(slope = slope, intercept = int) +
    annotate("text", x = -1, y = max(y),
             label = paste0("r = ", round(the_cor, 4))) +
    ds4ling_theme() +
    labs(x = "Theoretical quantiles", y = "Sample quantiles") +
    theme(axis.line = element_line(colour = "black"))

}
