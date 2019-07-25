#' Material design - bootstrap HTML output format
#'
#' Format for converting from R Markdown to an HTML document with a material design theme.
#'
#' @details
#' JavaScript and CSS taken and adapted from the Material design theme
#' for Bootstrap 3 project : \url{https://github.com/FezVrasta/bootstrap-material-design}.
#'
#' @param fig_width Default width (in inches) for figures
#' @param fig_height Default width (in inches) for figures
#' @param fig_caption \code{TRUE} to render figures with captions
#' @param highlight Syntax highlighting style. Supported styles include
#'   "default", "tango", "pygments", "kate", "monochrome", "espresso",
#'   "zenburn", "haddock", and "textmate". Pass \code{NULL} to prevent syntax
#'   highlighting.
#' @param pandoc_args arguments passed to the pandoc_args argument of rmarkdown \code{\link[rmarkdown]{html_document}}
#' @param ... Additional function arguments passed to R Markdown \code{\link[rmarkdown]{html_document}}
#' @return R Markdown output format to pass to \code{\link[rmarkdown]{render}}
#' @import rmarkdown
#' @importFrom htmltools htmlDependency
#' @export


material <- function(fig_width = 6,
                     fig_height = 3,
                     fig_caption = TRUE,
                     highlight = "kate",
                     pandoc_args = NULL,
                     use_bookdown = FALSE,
                     ...) {

  ## js and css dependencies
  extra_dependencies <- list(html_dependency_material())


  ## Merge "extra_dependencies"
  extra_args <- list(...)
  if ("extra_dependencies" %in% names(extra_args)) {
    extra_dependencies <- append(extra_dependencies, extra_args[["extra_dependencies"]])
    extra_args[["extra_dependencies"]] <- NULL
  }

  ## Call rmarkdown::html_document
  html_document_args <- list(
    template = system.file("templates/material/material.html", package = "nzheraldr"),
    extra_dependencies = extra_dependencies,
    fig_width = fig_width,
    fig_height = fig_height,
    highlight = highlight,
    pandoc_args = pandoc_args,
    fig_caption = TRUE,
    toc = TRUE,
    toc_depth = 1,
    css = NULL,
    theme = NULL,
    bootstrap_compatible = F,
    html_format = 'html5'
  )
  html_document_args <- append(html_document_args, extra_args)
  html_document_func <- rmarkdown::html_document

  do.call(html_document_func, html_document_args)

}

html_dependency_material <- function() {
  htmltools::htmlDependency(name = "material",
                 version = "0.1",
                 src = system.file("templates/material/dist", package = "nzheraldr"),
                 script = c("index.js"),
                 stylesheet = c("index.css"))
}


