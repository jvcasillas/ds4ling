#' A function to plot distributions
#'
#' This function generates a plot of a normal distribution using user
#' supplied mean and standard deviation.
#'
#' @param plot_dist A function for plotting normal distributions
#' @param distribution A distribution type (defaults to gaussian)
#' @param range A vector of 2 values indicating the range for the x-axis and
#' the data
#' @param mean A numeric value for the center of gravity of the distribution
#' (defaults to 0)
#' @param sd A numeric value for the standard deviation of the distribution
#' (defaults to 1)
#' @param ... Arguments to be passed to ggplot. Specifically 'font_color' and
#' 'tex'.
#' @keywords plot
#' @import ggplot2
#' @importFrom latex2exp TeX
#' @importFrom stats dnorm
#' @importFrom stats pnorm
#' @importFrom rlang .data
#' @export
#' @examples
#' plot_dist(font_color = "darkblue")
#' plot_dist(range = c(-10, 10), distribution = "gaussian", mean = 1, sd = 3)
#' plot_dist(range = c(-1, 1), distribution = "gaussian", mean = 0, sd = 0.3)
#' plot_dist(range = c(-5, 5), distribution = "anything")
#' plot_dist(tex = "$Hello_{\\Delta} = 4^5$")

plot_dist <- function(distribution = "gaussian", range = c(-3, 3), mean = 0,
                      sd = 1, ...) {

  # Get some dots
  extras <- list(...)

  # Select font color
  if ("font_color" %in% names(extras)) {
    color <- extras[["font_color"]]
  } else {
    color <- "darkred"
  }

  # Generate LaTeX
  if ("tex" %in% names(extras)) {

    tex_formula <- latex2exp::TeX(extras[["tex"]], output = "character")

  } else {
    # Get formula for normal dist
    tex_formula <- latex2exp::TeX(paste0("$\\textit{N}(", mean, ", ", sd, ")$"),
      output = "character")
  }

  if (distribution == "gaussian") {
    dist <- dnorm
  } else {
    dist <- pnorm
  }

  # Plot normal dist or sigmoid
  p <- ggplot(data.frame(x = range)) +
    aes(x = .data$x) +
    stat_function(fun = dist, n = 100, args = list(mean = mean, sd = sd),
      size = 1) +
    annotate("text", x = range[1] + sd, y = dnorm(mean, mean, sd) * 0.5,
      size = 7, label = tex_formula, color = color, parse = TRUE) +
    ds4ling::ds4ling_theme() +
    theme(axis.line = element_line(colour = "black"))

  return(p)
}
