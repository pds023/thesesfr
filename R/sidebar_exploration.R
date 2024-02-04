#' Title
#'
#' @return
#' @export
#'
#' @examples
sidebar_exploration <- function() {
  renderUI({
    accordion(accordion_panel(title = "Filtrer",icon = icon("filter"),
                              checkboxInput(inputId = "exploration_filter_chinese",
                                            label = "Chine"),
                              create_picker(id = "exploration_filter_discipline",label = "Discipline",multiple = TRUE),
                              create_picker(id = "exploration_filter_techs",label = "Technologies",multiple = TRUE),
                              create_picker(id = "exploration_filter_chems",label = "Précurseurs chimiques",multiple = TRUE),
                              create_picker(id = "exploration_filter_pathogenes",label = "Pathogènes",multiple = TRUE),
                              create_picker(id = "exploration_filter_vegs",label = "Végétaux",multiple = TRUE),
                              create_picker(id = "exploration_filter_sujets",label = "Sujets",multiple = TRUE),
                              create_picker(id = "exploration_filter_membres_sujets_rameau",label = "Sujets rameau",multiple = TRUE),
                              actionButton(inputId = "exploration_filters_apply",label = "Appliquer",width = "100%"),
                              actionButton(inputId = "exploration_filters_reset",label = "Réinitialiser",width = "100%"))

    )
  })
}
