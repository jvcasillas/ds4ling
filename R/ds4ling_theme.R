#' ds4ling plotting theme
#'
#' This function provides the plot theme used in most ds4ling slides
#'
#' @param ds4ling_theme A theme function used with ggplot (e.g., 'theme_bw')
#' @param ... Pass extra parameters
#' @keywords plot
#' @import ggplot2
#' @importFrom rlang .data
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = drat, y = mpg)) +
#'   geom_point() +
#'   ds4ling_theme()
#'
# ds4ling theme
ds4ling_theme <- function(...) {
  list(
    theme_minimal(base_family = 'Times', base_size = 20),
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  )
}
