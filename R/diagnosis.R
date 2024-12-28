#' A function to plot model diagnostics
#'
#' This function generates a series of plots that can be used to check some
#' model assumptions in linear models.
#'
#' The left panel shows residuals as a function of fitted values and is useful
#' for checking homoskedasticity.
#'
#' The middle panel plots a histogram of the residuals with a vertical
#' discontinuous line that represents the mean.
#'
#' The right panel provides a qq-plot of the residuals.
#'
#' @param diagnosis A function for plotting model diagnostics
#' @param mod A model object
#' @keywords plot
#' @import ggplot2
#' @import patchwork
#' @importFrom rlang .data
#' @importFrom stats IQR
#' @export
#' @examples
#' mod1 <- lm(mpg ~ drat, data = mtcars)
#' diagnosis(mod1)

diagnosis <- function(mod) {

  resid  <- mod$residuals
  fitted <- mod$fitted

  resid_cog <- mean(resid)
  fd_bw <- 2 * IQR(resid) / length(resid)^(1/3)

  p1 <- data.frame(resid, fitted) |>
    ggplot() +
    aes(x = .data$fitted, y = .data$resid) +
    geom_hline(yintercept = 0, lty = 3) +
    geom_point(pch = 21, size = 1.25, fill = "grey") +
    labs(y = "Residuals", x = "Fitted values") +
    ds4ling::ds4ling_bw_theme()

  p2 <- data.frame(x = resid) |>
    ggplot() +
    aes(x = .data$x) +
    geom_histogram(color = "black", fill = "grey70", binwidth = fd_bw) +
    geom_vline(xintercept = resid_cog, lty = 2) +
    labs(y = "Density", x = "Residuals") +
    ds4ling::ds4ling_bw_theme()

  p3 <- ds4ling::gg_qqplot(resid) +
    ds4ling::ds4ling_bw_theme()

  print(p1 + p2 + p3)
}
