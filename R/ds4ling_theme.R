#' ds4ling plotting theme
#'
#' This function provides the plot theme used in most ds4ling slides
#'
#' @param ds4ling_theme A theme function used with ggplot (e.g., 'theme_bw')
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
#'   ds4ling_theme()
#'
# ds4ling theme
ds4ling_theme <- function(...) {
  list(
    theme_minimal(base_family = 'Palatino', base_size = 20),
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank())
  )
}

.onAttach <- function(libname, pkgname) {
  message <- c("\n ds4ling loaded",
               "\n Happy coding!")
  packageStartupMessage(message)
}
