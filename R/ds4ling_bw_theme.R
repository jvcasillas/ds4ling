#' ds4ling plotting theme
#'
#' This function provides the plot theme used in most ds4ling slides
#'
#' @param ds4ling_bw_theme A theme function used with ggplot (e.g., 'theme_bw')
#' @param ... Pass extra parameters
#' @keywords plot
#' @import ggplot2
#' @import untidydata
#' @importFrom rlang .data
#' @export
#' @examples
#' library(ggplot2)
#' library(untidydata)
#' ggplot(pre_post, aes(x = test1, y = test2)) +
#'   geom_point() +
#'   ds4ling_bw_theme()
#'
# ds4ling bw theme
ds4ling_bw_theme <- function(...) {
  list(
    theme_bw(...),
    theme(
      axis.title.y = element_text(size = rel(.9), hjust = 0.95),
      axis.title.x = element_text(size = rel(.9), hjust = 0.95),
      panel.grid.major = element_line(colour = 'grey90', size = 0.15),
      panel.grid.minor = element_line(colour = 'grey90', size = 0.15))
  )
}
